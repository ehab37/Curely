import 'dart:developer';
import 'package:curely/core/utils/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) async {
  log('Background action: ${response.actionId}, id: ${response.id}');
  if (response.actionId == 'dismiss_action') {
    log('Notification ${response.id} cancelled from background');
  }
}

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );
    await notificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        log('Foreground action: ${response.actionId}, id: ${response.id}');

        if (response.actionId == 'dismiss_action') {
          log('Notification ${response.id} cancelled');
          return;
        }

        if (response.actionId == null) {
          final String? payload = response.payload;
          if (payload != null) {
            AppRouter.router.push(payload);
          }
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future<bool> checkPermissionStatus(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      final androidImplementation = notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final bool enabled =
          await androidImplementation?.areNotificationsEnabled() ?? false;
      return enabled;
    } else {
      final iosImplementation = notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final settings = await iosImplementation?.checkPermissions();
      return settings?.isEnabled ?? false;
    }
  }

  Future<bool> requestPermissions(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      final androidImplementation = notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final bool? granted = await androidImplementation
          ?.requestNotificationsPermission();
      final bool? exactAlarmGranted = await androidImplementation
          ?.requestExactAlarmsPermission();
      return (granted ?? false) && (exactAlarmGranted ?? false);
    } else {
      return await notificationsPlugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
  }

  Future<void> zonedScheduleNotification({
    required int id,
    required String title,
    required String body,
    required String channelId,
    required String channelName,
    required DateTime date,
    bool daily = true,
    String? payload,
  }) async {
    await notificationsPlugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tz.TZDateTime.from(date, tz.local),
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.max,
          priority: Priority.high,
          ongoing: true,
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction('dismiss_action', 'got_it'.tr()),
          ],
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: daily
          ? DateTimeComponents.time
          : DateTimeComponents.dateAndTime,
      payload: payload,
    );
  }

  Future<void> cancelReminder(int id) async {
    await notificationsPlugin.cancel(id: id);
  }
}
