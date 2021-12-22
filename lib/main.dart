import 'package:flutter/material.dart';
import 'package:merchant_app/utils/widgets/base_widget.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseWidget(
        child: Container(),
      ),
    );
  }
}
