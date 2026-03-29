import 'package:curely/core/utils/info_box.dart';
import 'package:curely/features/home/presentation/cubits/doctor_ai_cubit/doctor_ai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_bubble.dart';
import 'chat_input.dart';
import 'typing_indicator.dart';

class DoctorAiViewBody extends StatelessWidget {
  const DoctorAiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorAiCubit>();
    return BlocConsumer<DoctorAiCubit, DoctorAiState>(
      listener: (context, state) {
        if (state is DoctorAiFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: cubit.scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount:
                    cubit.messages.length +
                    (state is DoctorAiTypingState ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == cubit.messages.length) {
                    return const TypingIndicator();
                  }
                  return ChatBubble(message: cubit.messages[index]);
                },
              ),
            ),
            ChatInput(
              controller: cubit.promptController,
              onSend: (text) {
                context.read<DoctorAiCubit>().sendPrompt();
              },
            ),
          ],
        );
      },
    );
  }
}
