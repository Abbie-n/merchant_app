import 'package:flutter/material.dart';
import 'package:merchant_app/features/home/presentation/pages/home.dart';
import 'package:merchant_app/utils/colors.dart';
import 'package:merchant_app/utils/widgets/base_widget.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.black,
      ),
      home: BaseWidget(
        child: HomeScreen(),
      ),
    );
  }
}
