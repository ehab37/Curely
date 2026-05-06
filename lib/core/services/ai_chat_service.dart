import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'get_it.dart';

class AiChatService {
  Future<String?>? sendPrompt({
    required String prompt,
    List<ChatMessage>? messagesHistory,
  }) async {
    final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
    final model = FirebaseAI.googleAI().templateGenerativeModel();
    final chat = model.startChat(
      'curely-doctor-v1-0-0',
      inputs: {
        "userMessage": prompt,
        "userName": user.name,
        "userHeight": user.height.toString(),
        "userWeight": user.weight.toString(),
        "userAge": user.dateOfBirth.calculateAge.toString(),
      },
      history: messagesHistory.isNullOrEmpty
          ? []
          : messagesHistory!
          .map(
            (e) =>
        e.sender == MessageSender.ai
            ? Content.model([TextPart(e.text)])
            : Content.text(e.text),
      )
          .toList(),
    );
    final response = await chat.sendMessage(Content.text(prompt));
    return response.text;
  }
}
