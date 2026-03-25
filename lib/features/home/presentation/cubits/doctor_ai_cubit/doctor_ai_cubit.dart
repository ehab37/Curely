import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_ai_state.dart';

class DoctorAiCubit extends Cubit<DoctorAiState> {
  DoctorAiCubit({required this.homeRepo}) : super(DoctorAiInitial()) {
    sendInitialMessage();
  }

  final HomeRepo homeRepo;
  final TextEditingController promptController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<ChatMessage> messages = [];

  void sendInitialMessage() async {
    emit(DoctorAiTypingState());
    const String disclaimer =
        """I am an AI assistant, not a replacement for professional medical advice. In case of emergency, please contact local medical services immediately.""";
    const String welcomeMessage =
        """Hello! I am Dr. Curely, your personal health assistant. How can I help you today? Please feel free to share any symptoms or concerns you have.""";
    await Future.delayed(const Duration(seconds: 1));
    messages.add(ChatMessage(text: disclaimer, sender: MessageSender.ai));
    messages.add(ChatMessage(text: welcomeMessage, sender: MessageSender.ai));
    emit(DoctorAiMessageReceived());
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  sendPrompt() async {
    final prompt = promptController.text;
    if (prompt.trim().isEmpty) return;
    messages.add(ChatMessage(text: prompt, sender: MessageSender.user));
    promptController.clear();
    scrollToBottom();
    emit(DoctorAiTypingState());
    var result = await homeRepo.doctorAiChat(
      prompt: prompt,
      messagesHistory: messages,
    );
    result.fold((l) => emit(DoctorAiFailure(errMessage: l.errMessage)), (r) {
      messages.add(ChatMessage(text: r, sender: MessageSender.ai));
      scrollToBottom();
      emit(DoctorAiMessageReceived());
    });
  }
}
