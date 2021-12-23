import 'dart:convert';

import 'package:equatable/equatable.dart';

class Products extends Equatable {
  const Products({
    this.products,
  });

  final List<Product>? products;

  @override
  List<Object?> get props => [products];

  Map<String, dynamic> toMap() {
    return {
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class Product extends Equatable {
  const Product({
    this.id,
    this.title,
    this.bodyHtml,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.status,
    this.publishedScope,
    this.tags,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
  });

  final int? id;
  final String? title;
  final String? bodyHtml;
  final String? vendor;
  final String? productType;
  final DateTime? createdAt;
  final String? handle;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic templateSuffix;
  final String? status;
  final String? publishedScope;
  final String? tags;
  final String? adminGraphqlApiId;
  final List<Variant>? variants;
  final List<Option>? options;
  final List<Image>? images;
  final Image? image;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      bodyHtml,
      vendor,
      productType,
      createdAt,
      handle,
      updatedAt,
      publishedAt,
      templateSuffix,
      status,
      publishedScope,
      tags,
      adminGraphqlApiId,
      variants,
      options,
      images,
      image,
    ];
  }

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

  String toJson() => json.encode(toMap());
}

class Image extends Equatable {
  const Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  final int? id;
  final int? productId;
  final int? position;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic alt;
  final int? width;
  final int? height;
  final String? src;
  final List<dynamic>? variantIds;
  final String? adminGraphqlApiId;

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      position,
      createdAt,
      updatedAt,
      alt,
      width,
      height,
      src,
      variantIds,
      adminGraphqlApiId,
    ];
  }

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

  String toJson() => json.encode(toMap());
}

class Option extends Equatable {
  const Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  final int? id;
  final int? productId;
  final String? name;
  final int? position;
  final List<String>? values;

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      name,
      position,
      values,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'position': position,
      'values': values,
    };
  }

  String toJson() => json.encode(toMap());
}

class Variant extends Equatable {
  const Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
  });

  final int? id;
  final int? productId;
  final String? title;
  final String? price;
  final String? sku;
  final int? position;
  final String? inventoryPolicy;
  final dynamic compareAtPrice;
  final String? fulfillmentService;
  final dynamic inventoryManagement;
  final String? option1;
  final dynamic option2;
  final dynamic option3;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? taxable;
  final dynamic barcode;
  final int? grams;
  final dynamic imageId;
  final double? weight;
  final String? weightUnit;
  final int? inventoryItemId;
  final int? inventoryQuantity;
  final int? oldInventoryQuantity;
  final bool? requiresShipping;
  final String? adminGraphqlApiId;

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      title,
      price,
      sku,
      position,
      inventoryPolicy,
      compareAtPrice,
      fulfillmentService,
      inventoryManagement,
      option1,
      option2,
      option3,
      createdAt,
      updatedAt,
      taxable,
      barcode,
      grams,
      imageId,
      weight,
      weightUnit,
      inventoryItemId,
      inventoryQuantity,
      oldInventoryQuantity,
      requiresShipping,
      adminGraphqlApiId,
    ];
  }

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

  String toJson() => json.encode(toMap());
}
