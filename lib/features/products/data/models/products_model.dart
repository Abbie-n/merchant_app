import 'dart:convert';

import 'package:merchant_app/features/products/domain/entities/products.dart';

class ProductsModel extends Products {
  const ProductsModel({
    final List<ProductModel>? products,
  }) : super(
          products: products,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      products: map['products'] != null
          ? List<ProductModel>.from(
              map['products']?.map((x) => ProductModel.fromMap(x)))
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

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
    final List<VariantModel>? variants,
    final List<OptionModel>? options,
    final List<ImageModel>? images,
    final ImageModel? image,
  }) : super(
          adminGraphqlApiId: adminGraphqlApiId,
          bodyHtml: bodyHtml,
          createdAt: createdAt,
          handle: handle,
          id: id,
          image: image,
          images: images,
          options: options,
          productType: productType,
          publishedAt: publishedAt,
          publishedScope: publishedScope,
          status: status,
          tags: tags,
          templateSuffix: templateSuffix,
          title: title,
          updatedAt: updatedAt,
          variants: variants,
          vendor: vendor,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body_html': bodyHtml,
      'vendor': vendor,
      'product_type': productType,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'handle': handle,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'published_at': publishedAt?.millisecondsSinceEpoch,
      'template_suffix': templateSuffix,
      'status': status,
      'published_scope': publishedScope,
      'tags': tags,
      'admin_graphql_api_id': adminGraphqlApiId,
      'variants': variants?.map((x) => x.toMap()).toList(),
      'options': options?.map((x) => x.toMap()).toList(),
      'images': images?.map((x) => x.toMap()).toList(),
      'image': image?.toMap(),
    };
  }

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
          ? List<ImageModel>.from(
              map['images']?.map((x) => ImageModel.fromMap(x)))
          : null,
      image: map['image'] != null ? ImageModel.fromMap(map['image']) : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

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
  }) : super(
          adminGraphqlApiId: adminGraphqlApiId,
          barcode: barcode,
          compareAtPrice: compareAtPrice,
          createdAt: createdAt,
          fulfillmentService: fulfillmentService,
          grams: grams,
          id: id,
          imageId: imageId,
          inventoryItemId: inventoryItemId,
          inventoryManagement: inventoryManagement,
          inventoryPolicy: inventoryPolicy,
          inventoryQuantity: inventoryQuantity,
          oldInventoryQuantity: oldInventoryQuantity,
          option1: option1,
          option2: option2,
          option3: option3,
          position: position,
          price: price,
          productId: productId,
          requiresShipping: requiresShipping,
          sku: sku,
          taxable: taxable,
          title: title,
          updatedAt: updatedAt,
          weight: weight,
          weightUnit: weightUnit,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'title': title,
      'price': price,
      'sku': sku,
      'position': position,
      'inventory_policy': inventoryPolicy,
      'compare_at_price': compareAtPrice,
      'fulfillment_service': fulfillmentService,
      'inventory_management': inventoryManagement,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'taxable': taxable,
      'barcode': barcode,
      'grams': grams,
      'image_id': imageId,
      'weight': weight,
      'weight_unit': weightUnit,
      'inventory_item_id': inventoryItemId,
      'inventory_quantity': inventoryQuantity,
      'old_inventory_quantity': oldInventoryQuantity,
      'requires_shipping': requiresShipping,
      'admin_graphql_api_id': adminGraphqlApiId,
    };
  }

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
      inventoryItemId: map['inventory_item_id']?.toInt(),
      inventoryQuantity: map['inventory_quantity']?.toInt(),
      oldInventoryQuantity: map['old_inventory_quantity']?.toInt(),
      requiresShipping: map['requires_shipping'],
      adminGraphqlApiId: map['admin_graphql_api_id'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

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
  }) : super(
          id: id,
          name: name,
          position: position,
          productId: productId,
          values: values,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'position': position,
      'values': values,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id']?.toInt(),
      productId: map['product_id']?.toInt(),
      name: map['name'],
      position: map['position']?.toInt(),
      values: List<String>.from(map['values']),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source));
}

class ImageModel extends Image {
  const ImageModel({
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
  }) : super(
          adminGraphqlApiId: adminGraphqlApiId,
          alt: alt,
          createdAt: createdAt,
          height: height,
          id: id,
          position: position,
          productId: productId,
          src: src,
          updatedAt: updatedAt,
          variantIds: variantIds,
          width: width,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'position': position,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'alt': alt,
      'width': width,
      'height': height,
      'src': src,
      'variant_ids': variantIds,
      'admin_graphql_api_id': adminGraphqlApiId,
    };
  }

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

  @override
  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));
}
