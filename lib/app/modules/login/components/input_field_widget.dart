import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFieldWidget {
  final String hint;
  final IconData icon;
  final Color color;
  final bool obscure;
  final FocusNode focusNode;
  final TextInputType inputType;
  final Function(String) onChanged;
  final TextEditingController controller;
  final Function() onEditingComplete;
  final Function() onObscure;
  final String Function() errorText;
  final String mask;
  final Widget suffix;
  final int lines;
  final TextInputAction inputAction;
  final TextCapitalization textCapitalization;


  InputFieldWidget({
    this.icon,
    this.hint,
    this.color,
    this.obscure,
    this.focusNode,
    this.onEditingComplete,
    this.inputType,
    this.onChanged,
    this.controller,
    this.onObscure,
    this.errorText,
    this.suffix,
    this.mask,
    this.lines = 1,
    this.inputAction = TextInputAction.next,
    this.textCapitalization,

  });

  MaskTextInputFormatter _maskFormatter;

  Widget build() {
    if (mask != null) {
      _maskFormatter = new MaskTextInputFormatter(mask: mask);
    }

    return TextField(
      controller: controller,
      maxLines: lines,
      onChanged: onChanged,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      textInputAction: inputAction,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color ?? Colors.grey[900],
        fontSize: 17,
      ),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: _maskFormatter != null ? [_maskFormatter] : null,
      obscureText: obscure,
      keyboardType: inputType,
      cursorColor: Color.fromRGBO(201, 29, 69, 1),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        fillColor: Color.fromRGBO(231, 235, 237, 1),
        filled: true,
        errorText: errorText == null ? null : errorText(),
        contentPadding: EdgeInsets.only(top: 30, left: 20),
        hintText: hint,
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: color ?? Colors.grey,
              ),
        suffixIcon: suffix,
        hintStyle: TextStyle(
          color: color ?? Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          // letterSpacing: 5,
        ),
      ),
    );
  }
}
