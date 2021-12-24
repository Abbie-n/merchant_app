import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart'
    as p;
import 'package:merchant_app/utils/utils.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    Key? key,
    this.product,
  }) : super(key: key);
  final p.Product? product;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  int? state = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (state == 0) {
          setState(() {
            state = 1;
          });
        } else {
          setState(() {
            state = 0;
          });
        }
      },
      child: Container(
        height: 350,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: state == 1
            ? flipCard()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 220,
                      child: Image.network(
                        widget.product!.image!.src!,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? progress) {
                          if (progress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: progress.expectedTotalBytes != null
                                  ? progress.cumulativeBytesLoaded /
                                      progress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const YMargin(20),
                  Styles.semiBold(widget.product!.title!),
                  const YMargin(5),
                  RichText(
                    text: TextSpan(
                      text: 'Status: ',
                      style: const TextStyle(color: AppColors.black),
                      children: [
                        Styles.spanSemiBold(
                          widget.product!.status!,
                          color:
                              widget.product!.status!.toLowerCase() == 'active'
                                  ? Colors.green
                                  : AppColors.textColor,
                        )
                      ],
                    ),
                  ),
                  const YMargin(5),
                  RichText(
                    text: TextSpan(
                      text: 'Created at: ',
                      style: const TextStyle(color: AppColors.black),
                      children: [
                        Styles.spanSemiBold(
                          DateFormat.yMMMMd()
                              .format(widget.product!.createdAt!),
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                  ),
                  const YMargin(5),
                  RichText(
                    text: TextSpan(
                      text: 'Last updated at: ',
                      style: const TextStyle(color: AppColors.black),
                      children: [
                        Styles.spanSemiBold(
                          DateFormat.yMMMMd()
                              .format(widget.product!.updatedAt!),
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget flipCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'No. of variants: ',
            style: const TextStyle(color: AppColors.black),
            children: [
              Styles.spanSemiBold(
                '${widget.product!.variants!.length}',
                color: AppColors.textColor,
              )
            ],
          ),
        ),
        const YMargin(20),
        RichText(
          text: TextSpan(
            text: 'Quantity in stock: ',
            style: const TextStyle(color: AppColors.black),
            children: widget.product!.variants!
                .map(
                  (e) => Styles.spanSemiBold(
                    '${e.title!} (${e.inventoryQuantity}), ',
                    color: AppColors.textColor,
                  ),
                )
                .toList(),
          ),
        ),
        const YMargin(5),
      ],
    );
  }
}
