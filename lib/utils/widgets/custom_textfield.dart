import 'package:flutter/material.dart';
import 'package:merchant_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Function(String)? validator;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;

  const CustomTextField({
    Key? key,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.white,
      cursorWidth: 2,
      style: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: AppColors.black,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
