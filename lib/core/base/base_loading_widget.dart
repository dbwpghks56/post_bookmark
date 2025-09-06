import 'package:flutter/material.dart';

class BaseLoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const BaseLoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? const CircularProgressIndicator() : child;
  }
}
