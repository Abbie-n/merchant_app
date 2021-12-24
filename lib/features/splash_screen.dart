import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/products/presentation/pages/tags.dart';
import 'package:merchant_app/utils/utils.dart';

import 'products/presentation/bloc/bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<DataBloc>(context).add(GetUniqueTags());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is TagsLoaded) {
              if (state.data.isNotEmpty) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TagsScreen(
                        tags: state.data,
                      ),
                    ),
                  );
                });
              }
            }
            return Center(
              child: Styles.semiBold('Loading....'),
            );
          },
        ),
      ),
    );
  }
}
