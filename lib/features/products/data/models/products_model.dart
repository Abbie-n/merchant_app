import 'dart:convert';

import 'package:merchant_app/features/products/domain/entities/products.dart';

class ProductsModel extends Products {
  const ProductsModel({
    final List<ProductModel>? products,
  }) : super(
          products: products,
        );

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      products: List<ProductModel>.from(
        map['products']?.map(
          (x) => ProductModel.fromMap(x),
        ),
      ),
    );
  }

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source));
}

class ProductModel extends Product {
  const ProductModel({
    final int? id,
    final String? title,
    final String? bodyHtml,
    final String? vendor,
    final String? productType,
    final DateTime? createdAt,
    final String? handle,
    final DateTime? updatedAt,
    final DateTime? publishedAt,
    final dynamic templateSuffix,
    final String? status,
    final String? publishedScope,
    final String? tags,
    final String? adminGraphqlApiId,
    final List<Variant>? variants,
    final List<Option>? options,
    final List<Image>? images,
    final Image? image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      title: map['title'],
      bodyHtml: map['body_html'],
      vendor: map['vendor'],
      productType: map['product_type'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      handle: map['handle'],
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      publishedAt: map['published_at'] != null
          ? DateTime.parse(map['published_at'])
          : null,
      templateSuffix: map['template_suffix'],
      status: map['status'],
      publishedScope: map['published_scope'],
      tags: map['tags'],
      adminGraphqlApiId: map['admin_graphql_api_id'],
      variants: map['variants'] != null
          ? List<VariantModel>.from(
              map['variants']?.map((x) => VariantModel.fromMap(x)))
          : null,
      options: map['options'] != null
          ? List<OptionModel>.from(
              map['options']?.map((x) => OptionModel.fromMap(x)))
          : null,
      images: map['images'] != null
          ? List<Image>.from(map['images']?.map((x) => ImageModel.fromMap(x)))
          : null,
      image: map['image'] != null ? ImageModel.fromMap(map['image']) : null,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}

class VariantModel extends Variant {
  const VariantModel({
    final int? id,
    final int? productId,
    final String? title,
    final String? price,
    final String? sku,
    final int? position,
    final String? inventoryPolicy,
    final dynamic compareAtPrice,
    final String? fulfillmentService,
    final dynamic inventoryManagement,
    final String? option1,
    final dynamic option2,
    final dynamic option3,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final bool? taxable,
    final dynamic barcode,
    final int? grams,
    final dynamic imageId,
    final double? weight,
    final String? weightUnit,
    final int? inventoryItemId,
    final int? inventoryQuantity,
    final int? oldInventoryQuantity,
    final bool? requiresShipping,
    final String? adminGraphqlApiId,
  });

  factory VariantModel.fromMap(Map<String, dynamic> map) {
    return VariantModel(
      id: map['id']?.toInt(),
      productId: map['product_id']?.toInt(),
      title: map['title'],
      price: map['price'],
      sku: map['sku'],
      position: map['position']?.toInt(),
      inventoryPolicy: map['inventory_policy'],
      compareAtPrice: map['compare_at_price'],
      fulfillmentService: map['fulfillment_service'],
      inventoryManagement: map['inventory_management'],
      option1: map['option1'],
      option2: map['option2'],
      option3: map['option3'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      taxable: map['taxable'],
      barcode: map['barcode'],
      grams: map['grams']?.toInt(),
      imageId: map['image_id'],
      weight: map['weight']?.toDouble(),
      weightUnit: map['weight_unit'],
      inventoryItemId: map['inventory_itemId']?.toInt(),
      inventoryQuantity: map['inventory_quantity']?.toInt(),
      oldInventoryQuantity: map['old_inventory_quantity']?.toInt(),
      requiresShipping: map['requires_shipping'],
      adminGraphqlApiId: map['admin_graphql_api_id'],
    );
  }

  factory VariantModel.fromJson(String source) =>
      VariantModel.fromMap(json.decode(source));
}

class OptionModel extends Option {
  const OptionModel({
    final int? id,
    final int? productId,
    final String? name,
    final int? position,
    final List<String>? values,
  });

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id']?.toInt(),
      productId: map['product_id']?.toInt(),
      name: map['name'],
      position: map['position']?.toInt(),
      values: List<String>.from(map['values']),
    );
  }

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source));
}

class ImageModel extends Image {
  ImageModel({
    final int? id,
    final int? productId,
    final int? position,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final dynamic alt,
    final int? width,
    final int? height,
    final String? src,
    final List<dynamic>? variantIds,
    final String? adminGraphqlApiId,
  });

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id']?.toInt(),
      productId: map['product_id']?.toInt(),
      position: map['position']?.toInt(),
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      alt: map['alt'],
      width: map['width']?.toInt(),
      height: map['height']?.toInt(),
      src: map['src'],
      variantIds: List<dynamic>.from(map['variant_ids']),
      adminGraphqlApiId: map['admin_graphql_api_id'],
    );
  }

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));
}
