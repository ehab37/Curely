import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isAi = message.sender == MessageSender.ai;
    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isAi ? AppColors.skyBlue.withAlpha(51) : AppColors.darkGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isAi ? Radius.zero : Radius.circular(15),
            bottomRight: isAi ? Radius.circular(15) : Radius.zero,
          ),
        ),
        child: MarkdownBody(
          data: message.text,
          selectable: true,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              color: isAi ? Colors.black87 : Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
