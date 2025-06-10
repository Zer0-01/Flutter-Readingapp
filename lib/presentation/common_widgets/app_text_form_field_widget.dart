import 'package:flutter/material.dart';
import 'package:get/utils.dart';

enum InputBorderType {
  enabled,
  focused,
  error,
}

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool obscureText;
  final Widget? suffixIcon;

  const AppTextFormFieldWidget({
    super.key,
    this.controller,
    this.labelText,
    this.onTapOutside,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: onTapOutside,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        enabledBorder:
            getInputBorder(type: InputBorderType.enabled, context: context),
        focusedBorder:
            getInputBorder(type: InputBorderType.focused, context: context),
        errorBorder:
            getInputBorder(type: InputBorderType.error, context: context),
      ),
    );
  }

  InputBorder getInputBorder(
      {required InputBorderType type, required BuildContext context}) {
    switch (type) {
      case InputBorderType.enabled:
        return OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 1,
          ),
        );
      case InputBorderType.focused:
        return OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: context.theme.hintColor,
              width: 1,
            ));
      case InputBorderType.error:
        return const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        );
    }
  }
}
