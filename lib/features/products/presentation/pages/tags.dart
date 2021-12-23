import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/features/products/presentation/bloc/bloc.dart';
import 'package:merchant_app/features/products/presentation/pages/products.dart';
import 'package:merchant_app/features/products/presentation/widgets/circular_loading_widget.dart';
import 'package:merchant_app/features/products/presentation/widgets/tag_tile.dart';
import 'package:merchant_app/utils/utils.dart';
import 'package:merchant_app/service_locator.dart' as sl;

class TagsScreen extends StatelessWidget {
  TagsScreen({Key? key}) : super(key: key);
  final TextEditingController tagSearchController = TextEditingController();
  SharedPreferenceLocalStorage localStorage = SharedPreferenceLocalStorage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => sl.sl<DataBloc>()..add(GetUniqueTags()),
      child: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {
          if (state is Loaded) {
            BlocProvider.of<DataBloc>(context, listen: false)
                .add(GetUniqueTags());
          } else if (state is CategorisedProductsLoaded) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => ProductsScreen(
                  product: state.data,
                ),
                transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                  opacity: const AlwaysStoppedAnimation<double>(1),
                  child: ProductsScreen(),
                ),
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          }
        },
        buildWhen: (context, state) {
          return state is Loading ||
              state is Loaded ||
              state is TagsLoading ||
              state is TagsLoaded;
        },
        builder: (context, state) {
          if (state is TagsLoaded) {
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
                GestureDetector(
                  onTap: () {
                    localStorage.clearStorage();
                  },
                  child: Styles.semiBold(
                    'All tags',
                    color: AppColors.darkGrey,
                  ),
                ),
                const YMargin(20),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 15,
                      childAspectRatio: (1 / .6),
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        BlocProvider.of<DataBloc>(context)
                            .add(GetCategorisedProducts(state.data[index]));
                      },
                      child: TagTile(
                        tagName: state.data[index],
                        onTap: () {},
                      ),
                    ),
                    itemCount: state.data.length,
                  ),
                )
              ],
            );
          }
          return const CircularLoadingWidget(height: 200);
        },
      ),
    );
  }
}
