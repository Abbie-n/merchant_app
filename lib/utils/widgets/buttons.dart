import 'package:flutter/material.dart';
import 'package:merchant_app/utils/utils.dart';
import 'package:merchant_app/utils/widgets/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.buttonColor,
    this.function,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  final String? text;
  final Color? buttonColor;
  final Function()? function;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      splashColor: AppColors.darkGrey,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: .5,
          ),
        ),
        child: Center(
          child: Styles.regular(
            text!,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
