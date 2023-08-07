import 'package:flutter/material.dart';
import 'package:qiddam/theme/app_theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: AppTheme.primaryColor),
    );
  }
}
