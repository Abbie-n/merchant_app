import 'package:flutter/material.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';
import 'package:merchant_app/features/products/presentation/widgets/product_tile.dart';
import 'package:merchant_app/utils/utils.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    this.products,
    this.tag,
  }) : super(key: key);
  final List<Product>? products;
  final String? tag;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController productSearchController = TextEditingController();
  List<Product>? products = <Product>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      products = widget.products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            ),
          ),
          CustomTextField(
            controller: productSearchController,
            hintText: 'Search products',
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.darkGrey,
            ),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                setState(() {
                  products = Helper().searchProducts(
                      productSearchController.text, widget.products!);
                });
              } else {
                setState(() {
                  products = widget.products!;
                });
              }
            },
          ),
          const YMargin(20),
          Styles.semiBold(
            'All products',
            color: AppColors.darkGrey,
          ),
          const YMargin(20),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ProductTile(
                product: products![index],
              ),
              itemCount: products!.length,
            ),
          )
        ],
      ),
    );
  }
}
