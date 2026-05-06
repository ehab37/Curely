import 'package:curely/core/error/failures.dart';
import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<void> callEmergency();

  Future<Either<Failure, void>> nearestPharmacy();

  Future<Either<Failure, String>> sendPromptToAi({
    required String prompt,
    List<ChatMessage>? messagesHistory,
  });
}
