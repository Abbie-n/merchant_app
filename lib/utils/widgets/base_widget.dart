import 'package:flutter/material.dart';
import 'package:merchant_app/utils/utils.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 25,
          ),
          child: child,
        ),
      ),
    );
  }
}
