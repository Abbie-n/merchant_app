import 'package:flutter/material.dart';
import 'package:merchant_app/features/home/presentation/widgets/tag_tile.dart';
import 'package:merchant_app/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController tagSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: tagSearchController,
          hintText: 'Search tags',
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.darkGrey,
          ),
        ),
        const YMargin(20),
        Styles.semiBold(
          'All tags',
          color: AppColors.darkGrey,
        ),
        const YMargin(20),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 15,
              childAspectRatio: (1 / .6),
            ),
            itemBuilder: (context, index) => const TagTile(
              tagName: 'Test tag',
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
