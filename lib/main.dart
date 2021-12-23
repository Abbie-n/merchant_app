import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/products/presentation/pages/tags.dart';
import 'package:merchant_app/simple_bloc_observer.dart';
import 'package:merchant_app/utils/colors.dart';
import 'package:merchant_app/utils/widgets/base_widget.dart';
import 'package:merchant_app/service_locator.dart' as sl;

import 'features/products/presentation/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider<DataBloc>(
      lazy: false,
      create: (context) => sl.sl<DataBloc>()..add(GetAllProducts()),
      child: const App(),
    ),
  );
}

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
        child: TagsScreen(),
      ),
    );
  }
}
