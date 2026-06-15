import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSend;

  const ChatInput({super.key, required this.controller, this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHigh.withAlpha(50),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: context.tr('ask_dr_curely'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withAlpha(100),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onSubmitted: (_) => onSend?.call(controller.text),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => onSend?.call(controller.text),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
