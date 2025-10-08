import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonSearchTextField extends StatelessWidget {
  const CommonSearchTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.hintText = 'Search',
    this.autofocus = false,
    this.readOnly = false,
    this.prefixIcon,
    this.fillColor,
    this.textColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 0),
    this.keyboardType,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  final String hintText;
  final bool autofocus;
  final bool readOnly;

  final Widget? prefixIcon; // mặc định là icon search trắng
  final Color? fillColor; // mặc định Colors.black26
  final Color? textColor; // mặc định Colors.white
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry contentPadding;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: TextStyle(color: textColor ?? Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: prefixIcon ?? const Icon(Icons.search, color: Colors.white),
        filled: true,
        fillColor: fillColor ?? Colors.black26,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
