import 'package:flutter/material.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_colors.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/responsive.dart';

import '../../app/theme/app_style_manager.dart';

//* Toast de aviso para sucesso, erro e etc
enum MessageTypes {
  success(icon: Icons.sentiment_satisfied_alt, color: AppColors.success),
  info(icon: Icons.info_outline, color: AppColors.info),
  warning(icon: Icons.warning_amber_outlined, color: AppColors.warning),
  error(icon: Icons.sentiment_dissatisfied_outlined, color: AppColors.error);

  final IconData icon;
  final Color color;

  const MessageTypes({required this.icon, required this.color});
}

class Toast {
  static Future<void> show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 5),
    MessageTypes messageType = MessageTypes.info,
  }) async {
    final snackBar = SnackBar(
      duration: duration,
      elevation: 5,
      showCloseIcon: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: messageType.color,
      content: Row(
        children: [
          Icon(
            messageType.icon,
            size: 26.width,
            color: AppColors.white,
          ),
          SizedBox(width: 8.width),
          Expanded(
            child: Text(
              message,
              style: getSemiBoldStyle(
                color: AppColors.white,
                fontSize: 12.8.sp,
                overflow: TextOverflow.clip,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
