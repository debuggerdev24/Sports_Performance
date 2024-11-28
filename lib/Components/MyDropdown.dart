import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final List? items;
  final Function(Object?) onChanged;
  final String? Function(Object?)? validator;
  final String? hint;
  final TextStyle? hintStyle;
  final IconData? icon;
  final Widget? suffix;
  final Color? color;
  final double? size;
  final double? borderRadius;
  final Color? errorTextColor;
  final Color? borderColor;
  final Object? value;
  final List<String>? title;
  final double? maxHeight;

  const MyDropdown({
    required this.items,
    required this.onChanged,
    required this.title,
    this.validator,
    this.borderColor,
    this.hint,
    this.hintStyle,
    this.size,
    this.suffix,
    this.icon,
    this.errorTextColor,
    this.color,
    this.value,
    this.borderRadius,
    this.maxHeight,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<Object?>(
      // buttonHeight: size,
      // dropdownMaxHeight: maxHeight,
      // itemPadding: EdgeInsets.zero,
      // buttonPadding: EdgeInsets.zero,
      // dropdownPadding: EdgeInsets.zero,
      // dropdownScrollPadding: const EdgeInsets.only(left: 15),
      // offset: const Offset(0, -10),
      items: List.generate(
        items!.length,
        (index) => DropdownMenuItem(
          value: items![index],
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title![index],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      value: value,
      onChanged: onChanged,
      validator: validator,
      isDense: true,
      isExpanded: true,
      style: const TextStyle(fontSize: 12),
      hint: hint != null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint!,
                style: hintStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
              ),
            )
          : null,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
        suffixIcon: suffix,
        filled: true,
        fillColor: color,
        suffixIconConstraints: BoxConstraints(
          maxHeight: size ?? 35,
          minHeight: size ?? 35,
          maxWidth: size == null ? 38 : (size! + 3),
          minWidth: size == null ? 38 : (size! + 3),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: size ?? 35,
          minHeight: size ?? 35,
          maxWidth: size == null ? 38 : (size! + 3),
          minWidth: size == null ? 38 : (size! + 3),
        ),
        contentPadding: EdgeInsets.only(
          top: icon == null
              ? suffix == null
                  ? size == null
                      ? 19
                      : (size! / 1.5)
                  : 0
              : 0,
          bottom: icon == null
              ? suffix == null
                  ? size == null
                      ? 19
                      : (size! / 1.5)
                  : 0
              : 0,
          right: 0,
          left: icon == null ? 15 : 0,
        ),
        errorStyle: errorTextColor != null
            ? TextStyle(color: errorTextColor)
            : const TextStyle(color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: borderColor != null
              ? BorderSide(color: borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
