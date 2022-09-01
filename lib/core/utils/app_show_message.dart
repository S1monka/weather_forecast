import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showMessage(String content, MessageType type, {Duration? duration}) {
  BotToast.showText(
    text: content,
    contentColor: (type == MessageType.info) ? Colors.green : Colors.red,
    duration: duration ?? const Duration(seconds: 5),
    contentPadding: const EdgeInsets.all(5),
  );
}

enum MessageType { info, error }
