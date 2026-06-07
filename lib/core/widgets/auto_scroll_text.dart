import 'package:flutter/material.dart';

class AutoScrollText extends StatefulWidget {
  const AutoScrollText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  State<AutoScrollText> createState() => _AutoScrollTextState();
}

class _AutoScrollTextState extends State<AutoScrollText> {
  final ScrollController _scrollController = ScrollController();
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation(repeatCount: 2);
    });
  }

  Future<void> _startAnimation({int repeatCount = 1}) async {
    if (_isAnimating || !_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    if (maxScroll <= 0) return;

    _isAnimating = true;

    for (int i = 0; i < repeatCount; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (!_scrollController.hasClients) break;

      await _scrollController.animateTo(
        maxScroll,
        duration: Duration(
          milliseconds: (maxScroll * 30).toInt().clamp(1000, 5000),
        ),
        curve: Curves.linear,
      );

      await Future.delayed(const Duration(milliseconds: 1000));
      if (!_scrollController.hasClients) break;

      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }

    _isAnimating = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _startAnimation(repeatCount: 1),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Text(widget.text, style: widget.style, maxLines: 1),
      ),
    );
  }
}
