import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/features/products/presentation/bloc/bloc.dart';
import 'package:merchant_app/features/products/presentation/pages/products.dart';
import 'package:merchant_app/features/products/presentation/widgets/tag_tile.dart';
import 'package:merchant_app/utils/utils.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({Key? key, this.tags}) : super(key: key);
  final List<String>? tags;

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  final TextEditingController tagSearchController = TextEditingController();
  List<String>? tags = <String>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      tags = widget.tags;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: tagSearchController,
            hintText: 'Search tags',
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.darkGrey,
            ),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                setState(() {
                  tags = Helper()
                      .searchTags(tagSearchController.text, widget.tags!);
                });
              } else {
                setState(() {
                  tags = widget.tags!;
                });
              }
            },
          ),
          const YMargin(20),
          Styles.semiBold(
            'All tags',
            color: AppColors.darkGrey,
          ),
          const YMargin(20),
          BlocListener<DataBloc, DataState>(
            bloc: BlocProvider.of<DataBloc>(context),
            listener: (BuildContext context, DataState state) {
              if (state is CategorisedProductsLoaded) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                        products: state.data,
                        // tag: tags![index],
                      ),
                    ),
                  );
                });
              }
            },
            child: BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 15,
                      childAspectRatio: (1 / .6),
                    ),
                    itemBuilder: (context, index) => TagTile(
                      tagName: tags![index],
                      onTap: () {
                        BlocProvider.of<DataBloc>(context)
                            .add(GetCategorisedProducts(tags![index]));
                      },
                    ),
                    itemCount: tags!.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
