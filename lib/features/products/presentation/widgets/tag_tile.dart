import 'package:flutter/material.dart';
import 'package:merchant_app/utils/utils.dart';

class TagTile extends StatelessWidget {
  const TagTile({
    Key? key,
    this.tagName,
    this.onTap,
  }) : super(key: key);

  final String? tagName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.tagColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Styles.semiBold(
                tagName!,
                color: AppColors.textColor,
                maxLines: 1,
              ),
            ),
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                  color: Colors.purple, shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
