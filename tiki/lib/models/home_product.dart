// To parse this JSON data, do
//
//     final homeProduct = homeProductFromJson(jsonString);

import 'dart:convert';

HomeProduct homeProductFromJson(String str) => HomeProduct.fromJson(json.decode(str));

String homeProductToJson(HomeProduct data) => json.encode(data.toJson());

class HomeProduct {
  Bestseller bestseller;
  New homeProductNew;
  Bestseller cupOfCoffee;
  Coffee coffee;

  HomeProduct({
    this.bestseller,
    this.homeProductNew,
    this.cupOfCoffee,
    this.coffee,
  });

  factory HomeProduct.fromJson(Map<String, dynamic> json) => HomeProduct(
    bestseller: Bestseller.fromJson(json["bestseller"]),
    homeProductNew: New.fromJson(json["new"]),
    cupOfCoffee: Bestseller.fromJson(json["cup_of_coffee"]),
    coffee: Coffee.fromJson(json["coffee"]),
  );

  Map<String, dynamic> toJson() => {
    "bestseller": bestseller.toJson(),
    "new": homeProductNew.toJson(),
    "cup_of_coffee": cupOfCoffee.toJson(),
    "coffee": coffee.toJson(),
  };
}

class Bestseller {
  String title;
  String description;
  List<BestsellerItem> items;
  dynamic additional;
  int totalCount;
  String showMoreUrl;
  int categoryId;
  dynamic banner;

  Bestseller({
    this.title,
    this.description,
    this.items,
    this.additional,
    this.totalCount,
    this.showMoreUrl,
    this.categoryId,
    this.banner,
  });

  factory Bestseller.fromJson(Map<String, dynamic> json) => Bestseller(
    title: json["title"],
    description: json["description"] == null ? null : json["description"],
    items: List<BestsellerItem>.from(json["items"].map((x) => BestsellerItem.fromJson(x))),
    additional: json["additional"],
    totalCount: json["total_count"],
    showMoreUrl: json["show_more_url"] == null ? null : json["show_more_url"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description == null ? null : description,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "additional": additional,
    "total_count": totalCount,
    "show_more_url": showMoreUrl == null ? null : showMoreUrl,
    "category_id": categoryId == null ? null : categoryId,
    "banner": banner,
  };
}

class BestsellerItem {
  int id;
  String sku;
  String name;
  int attributeSetId;
  int price;
  int status;
  int visibility;
  TypeId typeId;
  DateTime createdAt;
  DateTime updatedAt;
  int weight;
  PurpleExtensionAttributes extensionAttributes;
  List<dynamic> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<TierPrice> tierPrices;
  List<CustomAttribute> customAttributes;

  BestsellerItem({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
  });

  factory BestsellerItem.fromJson(Map<String, dynamic> json) => BestsellerItem(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: typeIdValues.map[json["type_id"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"] == null ? null : json["weight"],
    extensionAttributes: PurpleExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<dynamic>.from(json["product_links"].map((x) => x)),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<TierPrice>.from(json["tier_prices"].map((x) => TierPrice.fromJson(x))),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeIdValues.reverse[typeId],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "weight": weight == null ? null : weight,
    "extension_attributes": extensionAttributes.toJson(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x)),
    "options": List<dynamic>.from(options.map((x) => x)),
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x.toJson())),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  String attributeCode;
  String value;

  CustomAttribute({
    this.attributeCode,
    this.value,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}

class PurpleExtensionAttributes {
  List<int> websiteIds;
  List<CategoryLink> categoryLinks;
  List<BundleProductOption> bundleProductOptions;
  Pricing pricing;
  bool isNew;

  PurpleExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.bundleProductOptions,
    this.pricing,
    this.isNew,
  });

  factory PurpleExtensionAttributes.fromJson(Map<String, dynamic> json) => PurpleExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
    bundleProductOptions: json["bundle_product_options"] == null ? null : List<BundleProductOption>.from(json["bundle_product_options"].map((x) => BundleProductOption.fromJson(x))),
    pricing: Pricing.fromJson(json["pricing"]),
    isNew: json["is_new"],
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
    "bundle_product_options": bundleProductOptions == null ? null : List<dynamic>.from(bundleProductOptions.map((x) => x.toJson())),
    "pricing": pricing.toJson(),
    "is_new": isNew,
  };
}

class BundleProductOption {
  int optionId;
  String title;
  bool required;
  BundleProductOptionType type;
  int position;
  String sku;
  List<BundleProductOptionProductLink> productLinks;

  BundleProductOption({
    this.optionId,
    this.title,
    this.required,
    this.type,
    this.position,
    this.sku,
    this.productLinks,
  });

  factory BundleProductOption.fromJson(Map<String, dynamic> json) => BundleProductOption(
    optionId: json["option_id"],
    title: json["title"],
    required: json["required"],
    type: bundleProductOptionTypeValues.map[json["type"]],
    position: json["position"],
    sku: json["sku"],
    productLinks: List<BundleProductOptionProductLink>.from(json["product_links"].map((x) => BundleProductOptionProductLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "option_id": optionId,
    "title": title,
    "required": required,
    "type": bundleProductOptionTypeValues.reverse[type],
    "position": position,
    "sku": sku,
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
  };
}

class BundleProductOptionProductLink {
  String selectionId;
  String qty;
  bool canApplyMsrp;
  String canChangeQuantity;
  String optionId;
  String priceType;
  String name;
  String image;
  Prices prices;

  BundleProductOptionProductLink({
    this.selectionId,
    this.qty,
    this.canApplyMsrp,
    this.canChangeQuantity,
    this.optionId,
    this.priceType,
    this.name,
    this.image,
    this.prices,
  });

  factory BundleProductOptionProductLink.fromJson(Map<String, dynamic> json) => BundleProductOptionProductLink(
    selectionId: json["selection_id"],
    qty: json["qty"],
    canApplyMsrp: json["canApplyMsrp"],
    canChangeQuantity: json["can_change_quantity"],
    optionId: json["optionId"],
    priceType: json["priceType"],
    name: json["name"],
    image: json["image"],
    prices: Prices.fromJson(json["prices"]),
  );

  Map<String, dynamic> toJson() => {
    "selection_id": selectionId,
    "qty": qty,
    "canApplyMsrp": canApplyMsrp,
    "can_change_quantity": canChangeQuantity,
    "optionId": optionId,
    "priceType": priceType,
    "name": name,
    "image": image,
    "prices": prices.toJson(),
  };
}

class Prices {
  Price oldPrice;
  Price basePrice;
  Price finalPrice;

  Prices({
    this.oldPrice,
    this.basePrice,
    this.finalPrice,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    oldPrice: Price.fromJson(json["oldPrice"]),
    basePrice: Price.fromJson(json["basePrice"]),
    finalPrice: Price.fromJson(json["finalPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "oldPrice": oldPrice.toJson(),
    "basePrice": basePrice.toJson(),
    "finalPrice": finalPrice.toJson(),
  };
}

class Price {
  int amount;

  Price({
    this.amount,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}

enum BundleProductOptionType { SELECT, RADIO }

final bundleProductOptionTypeValues = EnumValues({
  "radio": BundleProductOptionType.RADIO,
  "select": BundleProductOptionType.SELECT
});

class CategoryLink {
  int position;
  String categoryId;

  CategoryLink({
    this.position,
    this.categoryId,
  });

  factory CategoryLink.fromJson(Map<String, dynamic> json) => CategoryLink(
    position: json["position"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "category_id": categoryId,
  };
}

class Pricing {
  int regularPrice;
  int regularMinimalPrice;
  int regularMaximalPrice;
  int finalPrice;
  int finalMinimalPrice;
  int finalMaximalPrice;

  Pricing({
    this.regularPrice,
    this.regularMinimalPrice,
    this.regularMaximalPrice,
    this.finalPrice,
    this.finalMinimalPrice,
    this.finalMaximalPrice,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
    regularPrice: json["regular_price"],
    regularMinimalPrice: json["regular_minimal_price"] == null ? null : json["regular_minimal_price"],
    regularMaximalPrice: json["regular_maximal_price"] == null ? null : json["regular_maximal_price"],
    finalPrice: json["final_price"],
    finalMinimalPrice: json["final_minimal_price"] == null ? null : json["final_minimal_price"],
    finalMaximalPrice: json["final_maximal_price"] == null ? null : json["final_maximal_price"],
  );

  Map<String, dynamic> toJson() => {
    "regular_price": regularPrice,
    "regular_minimal_price": regularMinimalPrice == null ? null : regularMinimalPrice,
    "regular_maximal_price": regularMaximalPrice == null ? null : regularMaximalPrice,
    "final_price": finalPrice,
    "final_minimal_price": finalMinimalPrice == null ? null : finalMinimalPrice,
    "final_maximal_price": finalMaximalPrice == null ? null : finalMaximalPrice,
  };
}

class MediaGalleryEntry {
  int id;
  MediaTypeEnum mediaType;
  dynamic label;
  int position;
  bool disabled;
  List<MediaTypeEnum> types;
  String file;

  MediaGalleryEntry({
    this.id,
    this.mediaType,
    this.label,
    this.position,
    this.disabled,
    this.types,
    this.file,
  });

  factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) => MediaGalleryEntry(
    id: json["id"],
    mediaType: mediaTypeEnumValues.map[json["media_type"]],
    label: json["label"],
    position: json["position"],
    disabled: json["disabled"],
    types: List<MediaTypeEnum>.from(json["types"].map((x) => mediaTypeEnumValues.map[x])),
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaTypeEnumValues.reverse[mediaType],
    "label": label,
    "position": position,
    "disabled": disabled,
    "types": List<dynamic>.from(types.map((x) => mediaTypeEnumValues.reverse[x])),
    "file": file,
  };
}

enum MediaTypeEnum { IMAGE, SMALL_IMAGE, THUMBNAIL, SWATCH_IMAGE, MAGENEST_HOVER_IMAGE }

final mediaTypeEnumValues = EnumValues({
  "image": MediaTypeEnum.IMAGE,
  "magenest_hover_image": MediaTypeEnum.MAGENEST_HOVER_IMAGE,
  "small_image": MediaTypeEnum.SMALL_IMAGE,
  "swatch_image": MediaTypeEnum.SWATCH_IMAGE,
  "thumbnail": MediaTypeEnum.THUMBNAIL
});

class TierPrice {
  int customerGroupId;
  int qty;
  int value;
  TierPriceExtensionAttributes extensionAttributes;

  TierPrice({
    this.customerGroupId,
    this.qty,
    this.value,
    this.extensionAttributes,
  });

  factory TierPrice.fromJson(Map<String, dynamic> json) => TierPrice(
    customerGroupId: json["customer_group_id"],
    qty: json["qty"],
    value: json["value"],
    extensionAttributes: TierPriceExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_group_id": customerGroupId,
    "qty": qty,
    "value": value,
    "extension_attributes": extensionAttributes.toJson(),
  };
}

class TierPriceExtensionAttributes {
  int websiteId;

  TierPriceExtensionAttributes({
    this.websiteId,
  });

  factory TierPriceExtensionAttributes.fromJson(Map<String, dynamic> json) => TierPriceExtensionAttributes(
    websiteId: json["website_id"],
  );

  Map<String, dynamic> toJson() => {
    "website_id": websiteId,
  };
}

enum TypeId { BUNDLE, SIMPLE, CONFIGURABLE }

final typeIdValues = EnumValues({
  "bundle": TypeId.BUNDLE,
  "configurable": TypeId.CONFIGURABLE,
  "simple": TypeId.SIMPLE
});

class Coffee {
  String title;
  String description;
  List<CoffeeItem> items;
  dynamic additional;
  int totalCount;
  dynamic showMoreUrl;
  int categoryId;
  dynamic banner;

  Coffee({
    this.title,
    this.description,
    this.items,
    this.additional,
    this.totalCount,
    this.showMoreUrl,
    this.categoryId,
    this.banner,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
    title: json["title"],
    description: json["description"],
    items: List<CoffeeItem>.from(json["items"].map((x) => CoffeeItem.fromJson(x))),
    additional: json["additional"],
    totalCount: json["total_count"],
    showMoreUrl: json["show_more_url"],
    categoryId: json["category_id"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "additional": additional,
    "total_count": totalCount,
    "show_more_url": showMoreUrl,
    "category_id": categoryId,
    "banner": banner,
  };
}

class CoffeeItem {
  int id;
  String sku;
  String name;
  int attributeSetId;
  int price;
  int status;
  int visibility;
  TypeId typeId;
  DateTime createdAt;
  DateTime updatedAt;
  FluffyExtensionAttributes extensionAttributes;
  List<ItemProductLink> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<TierPrice> tierPrices;
  List<CustomAttribute> customAttributes;

  CoffeeItem({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
  });

  factory CoffeeItem.fromJson(Map<String, dynamic> json) => CoffeeItem(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: typeIdValues.map[json["type_id"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    extensionAttributes: FluffyExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<ItemProductLink>.from(json["product_links"].map((x) => ItemProductLink.fromJson(x))),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<TierPrice>.from(json["tier_prices"].map((x) => TierPrice.fromJson(x))),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeIdValues.reverse[typeId],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "extension_attributes": extensionAttributes.toJson(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
    "options": List<dynamic>.from(options.map((x) => x)),
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x.toJson())),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class FluffyExtensionAttributes {
  List<int> websiteIds;
  List<CategoryLink> categoryLinks;
  Pricing pricing;
  bool isNew;

  FluffyExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.pricing,
    this.isNew,
  });

  factory FluffyExtensionAttributes.fromJson(Map<String, dynamic> json) => FluffyExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
    pricing: Pricing.fromJson(json["pricing"]),
    isNew: json["is_new"],
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
    "pricing": pricing.toJson(),
    "is_new": isNew,
  };
}

class ItemProductLink {
  String sku;
  LinkType linkType;
  String linkedProductSku;
  TypeId linkedProductType;
  int position;
  ProductLinkExtensionAttributes extensionAttributes;

  ItemProductLink({
    this.sku,
    this.linkType,
    this.linkedProductSku,
    this.linkedProductType,
    this.position,
    this.extensionAttributes,
  });

  factory ItemProductLink.fromJson(Map<String, dynamic> json) => ItemProductLink(
    sku: json["sku"],
    linkType: linkTypeValues.map[json["link_type"]],
    linkedProductSku: json["linked_product_sku"],
    linkedProductType: typeIdValues.map[json["linked_product_type"]],
    position: json["position"],
    extensionAttributes: ProductLinkExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "link_type": linkTypeValues.reverse[linkType],
    "linked_product_sku": linkedProductSku,
    "linked_product_type": typeIdValues.reverse[linkedProductType],
    "position": position,
    "extension_attributes": extensionAttributes.toJson(),
  };
}

class ProductLinkExtensionAttributes {
  int id;
  int price;
  double finalPrice;
  String name;
  String image;
  bool isNew;

  ProductLinkExtensionAttributes({
    this.id,
    this.price,
    this.finalPrice,
    this.name,
    this.image,
    this.isNew,
  });

  factory ProductLinkExtensionAttributes.fromJson(Map<String, dynamic> json) => ProductLinkExtensionAttributes(
    id: json["id"],
    price: json["price"],
    finalPrice: json["final_price"].toDouble(),
    name: json["name"],
    image: json["image"],
    isNew: json["is_new"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "final_price": finalPrice,
    "name": name,
    "image": image,
    "is_new": isNew,
  };
}

enum LinkType { RELATED, UPSELL }

final linkTypeValues = EnumValues({
  "related": LinkType.RELATED,
  "upsell": LinkType.UPSELL
});

class New {
  String title;
  dynamic description;
  List<NewItem> items;
  dynamic additional;
  int totalCount;
  String showMoreUrl;
  dynamic categoryId;
  dynamic banner;

  New({
    this.title,
    this.description,
    this.items,
    this.additional,
    this.totalCount,
    this.showMoreUrl,
    this.categoryId,
    this.banner,
  });

  factory New.fromJson(Map<String, dynamic> json) => New(
    title: json["title"],
    description: json["description"],
    items: List<NewItem>.from(json["items"].map((x) => NewItem.fromJson(x))),
    additional: json["additional"],
    totalCount: json["total_count"],
    showMoreUrl: json["show_more_url"],
    categoryId: json["category_id"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "additional": additional,
    "total_count": totalCount,
    "show_more_url": showMoreUrl,
    "category_id": categoryId,
    "banner": banner,
  };
}

class NewItem {
  int id;
  String sku;
  String name;
  int attributeSetId;
  double price;
  int status;
  int visibility;
  TypeId typeId;
  DateTime createdAt;
  DateTime updatedAt;
  TentacledExtensionAttributes extensionAttributes;
  List<ItemProductLink> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<TierPrice> tierPrices;
  List<CustomAttribute> customAttributes;
  int weight;

  NewItem({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
    this.weight,
  });

  factory NewItem.fromJson(Map<String, dynamic> json) => NewItem(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"].toDouble(),
    status: json["status"],
    visibility: json["visibility"],
    typeId: typeIdValues.map[json["type_id"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    extensionAttributes: TentacledExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<ItemProductLink>.from(json["product_links"].map((x) => ItemProductLink.fromJson(x))),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<TierPrice>.from(json["tier_prices"].map((x) => TierPrice.fromJson(x))),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
    weight: json["weight"] == null ? null : json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeIdValues.reverse[typeId],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "extension_attributes": extensionAttributes.toJson(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
    "options": List<dynamic>.from(options.map((x) => x)),
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x.toJson())),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
    "weight": weight == null ? null : weight,
  };
}

class TentacledExtensionAttributes {
  List<int> websiteIds;
  List<CategoryLink> categoryLinks;
  Pricing pricing;
  bool isNew;
  List<BundleProductOption> bundleProductOptions;
  List<ConfigurableProductOption> configurableProductOptions;
  List<int> configurableProductLinks;

  TentacledExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.pricing,
    this.isNew,
    this.bundleProductOptions,
    this.configurableProductOptions,
    this.configurableProductLinks,
  });

  factory TentacledExtensionAttributes.fromJson(Map<String, dynamic> json) => TentacledExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: json["category_links"] == null ? null : List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
    pricing: Pricing.fromJson(json["pricing"]),
    isNew: json["is_new"],
    bundleProductOptions: json["bundle_product_options"] == null ? null : List<BundleProductOption>.from(json["bundle_product_options"].map((x) => BundleProductOption.fromJson(x))),
    configurableProductOptions: json["configurable_product_options"] == null ? null : List<ConfigurableProductOption>.from(json["configurable_product_options"].map((x) => ConfigurableProductOption.fromJson(x))),
    configurableProductLinks: json["configurable_product_links"] == null ? null : List<int>.from(json["configurable_product_links"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": categoryLinks == null ? null : List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
    "pricing": pricing.toJson(),
    "is_new": isNew,
    "bundle_product_options": bundleProductOptions == null ? null : List<dynamic>.from(bundleProductOptions.map((x) => x.toJson())),
    "configurable_product_options": configurableProductOptions == null ? null : List<dynamic>.from(configurableProductOptions.map((x) => x.toJson())),
    "configurable_product_links": configurableProductLinks == null ? null : List<dynamic>.from(configurableProductLinks.map((x) => x)),
  };
}

class ConfigurableProductOption {
  int id;
  String attributeId;
  String label;
  int position;
  List<Value> values;
  int productId;

  ConfigurableProductOption({
    this.id,
    this.attributeId,
    this.label,
    this.position,
    this.values,
    this.productId,
  });

  factory ConfigurableProductOption.fromJson(Map<String, dynamic> json) => ConfigurableProductOption(
    id: json["id"],
    attributeId: json["attribute_id"],
    label: json["label"],
    position: json["position"],
    values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attribute_id": attributeId,
    "label": label,
    "position": position,
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
    "product_id": productId,
  };
}

class Value {
  String valueIndex;
  String label;
  String productSuperAttributeId;
  String defaultLabel;
  String storeLabel;
  bool useDefaultValue;
  String value;
  String type;

  Value({
    this.valueIndex,
    this.label,
    this.productSuperAttributeId,
    this.defaultLabel,
    this.storeLabel,
    this.useDefaultValue,
    this.value,
    this.type,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    valueIndex: json["value_index"],
    label: json["label"],
    productSuperAttributeId: json["product_super_attribute_id"],
    defaultLabel: json["default_label"],
    storeLabel: json["store_label"],
    useDefaultValue: json["use_default_value"],
    value: json["value"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "value_index": valueIndex,
    "label": label,
    "product_super_attribute_id": productSuperAttributeId,
    "default_label": defaultLabel,
    "store_label": storeLabel,
    "use_default_value": useDefaultValue,
    "value": value,
    "type": type,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
