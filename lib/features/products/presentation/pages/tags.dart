import 'package:flutter/material.dart';
import 'package:merchant_app/features/products/presentation/pages/products.dart';
import 'package:merchant_app/features/products/presentation/widgets/tag_tile.dart';
import 'package:merchant_app/utils/utils.dart';

class TagsScreen extends StatelessWidget {
  TagsScreen({Key? key}) : super(key: key);
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
            itemBuilder: (context, index) => TagTile(
              tagName: 'Test tag',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => ProductsScreen(),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                        opacity: const AlwaysStoppedAnimation<double>(1),
                        child: ProductsScreen()),
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
