import 'package:flutter/material.dart';

class SnakeBarManager {
  //setar no Material APP a chave: //scaffoldMessengerKey: SnackBarManager.snackKey,
  static final GlobalKey<ScaffoldMessengerState> snakebarKey =
      GlobalKey<ScaffoldMessengerState>();

  void showError({required String message}) => _show(
        message: message,
        icon: Icons.warning_rounded,
        iconColor: Colors.red,
      );

  void showWarning({required String message}) => _show(
        message: message,
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.yellow,
      );

  void showSuccess({required String message}) => _show(
        message: message,
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        backgroundColor: Colors.green[100],
      );

  void _show({
    required String message,
    required IconData icon,
    required Color iconColor,
    backgroundColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: snakebarKey.currentState?.hideCurrentSnackBar,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );

    snakebarKey.currentState?.showSnackBar(snackBar);
  }
}
