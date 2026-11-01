import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'record_details_item_entity.dart';

const List<String> doctorSpecializationsList = [
  'dentistry',
  'neurology',
  'ear_nose_throat',
  'orthopedics',
  'cardiology',
  'dermatology',
  'gastroenterology',
  'surgery',
  'internal_medicine',
  'obstetrics_gynecology',
  'ophthalmology',
  'pediatrics',
  'psychiatry',
  'urology',
  'other',
];

class PrescriptionEntity {
  String? docId;
  final String doctorSpecialization;
  final String doctorName;
  final String? hospital;
  String? diagnosis;
  final String examinationDate;
  final DateTime? nextAppointmentDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  PrescriptionEntity({
    this.docId,
    required this.doctorSpecialization,
    required this.doctorName,
    this.hospital,
    this.diagnosis,
    required this.examinationDate,
    this.nextAppointmentDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}

List<RecordDetailsItemEntity> prescriptionDetailsList(
  BuildContext context,
  PrescriptionEntity prescription,
) => [
  RecordDetailsItemEntity(
    title: context.tr('doctor_name'),
    subTitle: prescription.doctorName,
    icon: FontAwesomeIcons.userDoctor,
  ),
  RecordDetailsItemEntity(
    title: context.tr('doctor_specialization'),
    subTitle: context.tr(prescription.doctorSpecialization),
    icon: FontAwesomeIcons.stethoscope,
  ),
  RecordDetailsItemEntity(
    title: context.tr('hospital_name'),
    subTitle: prescription.hospital ?? context.tr('not_added'),
    icon: FontAwesomeIcons.hospital,
  ),
  RecordDetailsItemEntity(
    title: context.tr('diagnosis'),
    subTitle: prescription.diagnosis ?? context.tr('no_diagnosis'),
    icon: FontAwesomeIcons.filePrescription,
  ),
  RecordDetailsItemEntity(
    title: context.tr('examination_date'),
    subTitle: prescription.examinationDate,
    icon: FontAwesomeIcons.calendar,
  ),
];
