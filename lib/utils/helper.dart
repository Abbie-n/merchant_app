import 'package:merchant_app/features/products/domain/entities/products.dart';

class Helper {
  List<String> searchTags(String text, List<String> list) {
    List<String> filteredList = <String>[];
    for (String s in list) {
      if (s.toLowerCase().contains(text.toLowerCase())) {
        filteredList.add(s);
      }
    }

    return filteredList;
  }

  List<Product> searchProducts(String text, List<Product> list) {
    List<Product> filteredList = <Product>[];

    for (Product s in list) {
      if (s.title!.toLowerCase().contains(text.toLowerCase())) {
        filteredList.add(s);
      }
    }
    return filteredList;
  }
}
