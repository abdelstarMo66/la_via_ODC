import 'package:flutter/material.dart';

Widget MyTextFormFields({
  @required String? lable,
  TextEditingController? controller,
  Icon? prefixIcon,
  Widget? suffixIcon,
  var radius = 16.0,
  @required TextInputType? type,
  FormFieldValidator<String>? validator,
  String? hintText,
  TextStyle? style,
  TextStyle? lableStyle,
  bool enabled = true,
  TextStyle? hintStyle,
  Color? fillColor,
  GestureTapCallback? onTap,
  ValueChanged<String>? onSubmet,
  bool showpassword = false,
}) =>
    TextFormField(
      obscureText: showpassword,
      controller: controller,
      style: style,
      decoration: InputDecoration(
        label: Text(lable!),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabled: enabled,
        hintStyle: hintStyle,
        labelStyle: lableStyle,
        fillColor: fillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      keyboardType: type,
      validator: validator,
      onTap: onTap,
      onFieldSubmitted: onSubmet,
    );
