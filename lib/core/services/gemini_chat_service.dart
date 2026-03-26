import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:gemini_ai/enum/block_threshold.dart';
import 'package:gemini_ai/enum/harm_category.dart';
import 'package:gemini_ai/enum/role.dart';
import 'package:gemini_ai/gemini_ai.dart';
import 'package:gemini_ai/model/chat_message.dart' as gemini_message;
import 'package:gemini_ai/model/generation_config.dart';
import 'package:gemini_ai/model/generative_model.dart';
import 'package:gemini_ai/model/safety_setting.dart';

class GeminiChatService {
  GeminiAi geminiAi = GeminiAi();

  Future<String?> sendMessage({
    required String prompt,
    List<ChatMessage>? messagesHistory,
  }) {
    geminiAi.generateContent(
      generativeModel,
      """You are Dr. Curely, an advanced AI medical consultant.
        Tone: Calm, professional, and empathetic.
        Rules:

        Use simple terms to explain medical jargon.

        Always follow up a symptom description by asking about the duration and severity.

        If a user describes life-threatening symptoms (chest pain, stroke signs), stop the conversation and tell them to call an ambulance immediately.

    Do not prescribe specific doses of high-risk medication; suggest consulting a pharmacist or doctor instead.

    Keep responses concise and formatted with bullet points for readability.""",
    );

    final response = geminiAi.startChat(
      generativeModel,
      prompt,
      history: messagesHistory == null || messagesHistory.isEmpty
          ? []
          : messagesHistory
                .map(
                  (e) => gemini_message.ChatMessage(
                    e.sender == MessageSender.ai ? Role.model : Role.user,
                    [e.text],
                  ),
                )
                .toList(),
    );
    return response;
  }

  static final GenerativeModel generativeModel = GenerativeModel(
    modelName: "gemini-2.5-flash",
    apiKey: DatabaseConstants.geminiApiKey,
    generationConfig: generationConfig,
    safetySettings: safetySettings,
  );

  static final GenerationConfig generationConfig = GenerationConfig(
    temperature: 0.9,
    topK: 1,
    topP: 1,
    maxOutputTokens: 2048,
  );

  static final List<SafetySetting> safetySettings = [
    SafetySetting(HarmCategory.harassment, BlockThreshold.mediumAndAbove),
    SafetySetting(HarmCategory.hateSpeech, BlockThreshold.mediumAndAbove),
    SafetySetting(HarmCategory.sexuallyExplicit, BlockThreshold.mediumAndAbove),
    SafetySetting(HarmCategory.dangerousContent, BlockThreshold.mediumAndAbove),
  ];
}
