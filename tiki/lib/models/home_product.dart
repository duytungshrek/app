// To parse this JSON data, do
//
//     final homeProduct = homeProductFromJson(jsonString);

import 'dart:convert';

HomeProduct homeProductFromJson(String str) => HomeProduct.fromJson(json.decode(str));

String homeProductToJson(HomeProduct data) => json.encode(data.toJson());

class HomeProduct {
  dynamic licenses;
  String token;
  List<Menu> menus;
  List<Slider> slider;
  Bestseller deal;
  Bestseller bestseller;
  Bestseller homeProductNew;
  Bestseller coffeeMaker;
  Bestseller cupOfCoffee;
  Bestseller coffee;
  List<TypicalCategory> typicalCategory;
  List<Post> post;
  List<Config> config;

  HomeProduct({
    this.licenses,
    this.token,
    this.menus,
    this.slider,
    this.deal,
    this.bestseller,
    this.homeProductNew,
    this.coffeeMaker,
    this.cupOfCoffee,
    this.coffee,
    this.typicalCategory,
    this.post,
    this.config,
  });

  factory HomeProduct.fromJson(Map<String, dynamic> json) => HomeProduct(
    licenses: json["licenses"],
    token: json["token"],
    menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
    slider: List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
    deal: Bestseller.fromJson(json["deal"]),
    bestseller: Bestseller.fromJson(json["bestseller"]),
    homeProductNew: Bestseller.fromJson(json["new"]),
    coffeeMaker: Bestseller.fromJson(json["coffee_maker"]),
    cupOfCoffee: Bestseller.fromJson(json["cup_of_coffee"]),
    coffee: Bestseller.fromJson(json["coffee"]),
    typicalCategory: List<TypicalCategory>.from(json["typical_category"].map((x) => TypicalCategory.fromJson(x))),
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
    config: List<Config>.from(json["config"].map((x) => Config.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "licenses": licenses,
    "token": token,
    "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
    "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
    "deal": deal.toJson(),
    "bestseller": bestseller.toJson(),
    "new": homeProductNew.toJson(),
    "coffee_maker": coffeeMaker.toJson(),
    "cup_of_coffee": cupOfCoffee.toJson(),
    "coffee": coffee.toJson(),
    "typical_category": List<dynamic>.from(typicalCategory.map((x) => x.toJson())),
    "post": List<dynamic>.from(post.map((x) => x.toJson())),
    "config": List<dynamic>.from(config.map((x) => x.toJson())),
  };
}

class Bestseller {
  String title;
  String description;
  List<BestsellerItem> items;
  List<Additional> additional;
  int totalCount;
  String showMoreUrl;
  int categoryId;
  List<String> banners;

  Bestseller({
    this.title,
    this.description,
    this.items,
    this.additional,
    this.totalCount,
    this.showMoreUrl,
    this.categoryId,
    this.banners,
  });

  factory Bestseller.fromJson(Map<String, dynamic> json) => Bestseller(
    title: json["title"],
    description: json["description"] == null ? null : json["description"],
    items: List<BestsellerItem>.from(json["items"].map((x) => BestsellerItem.fromJson(x))),
    additional: json["additional"] == null ? null : List<Additional>.from(json["additional"].map((x) => Additional.fromJson(x))),
    totalCount: json["total_count"],
    showMoreUrl: json["show_more_url"] == null ? null : json["show_more_url"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    banners: json["banners"] == null ? null : List<String>.from(json["banners"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description == null ? null : description,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "additional": additional == null ? null : List<dynamic>.from(additional.map((x) => x.toJson())),
    "total_count": totalCount,
    "show_more_url": showMoreUrl == null ? null : showMoreUrl,
    "category_id": categoryId == null ? null : categoryId,
    "banners": banners == null ? null : List<dynamic>.from(banners.map((x) => x)),
  };
}

class Additional {
  DateTime endDate;

  Additional({
    this.endDate,
  });

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    endDate: DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "end_date": endDate.toIso8601String(),
  };
}

class BestsellerItem {
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
  ItemExtensionAttributes extensionAttributes;
  List<ProductLink> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<TierPrice> tierPrices;
  List<CustomAttribute> customAttributes;
  double weight;

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
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
    this.weight,
  });

  factory BestsellerItem.fromJson(Map<String, dynamic> json) => BestsellerItem(
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
    extensionAttributes: ItemExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<ProductLink>.from(json["product_links"].map((x) => ProductLink.fromJson(x))),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<TierPrice>.from(json["tier_prices"].map((x) => TierPrice.fromJson(x))),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
    weight: json["weight"] == null ? null : json["weight"].toDouble(),
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

class ItemExtensionAttributes {
  List<int> websiteIds;
  List<CategoryLink> categoryLinks;
  Pricing pricing;
  bool isNew;

  ItemExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.pricing,
    this.isNew,
  });

  factory ItemExtensionAttributes.fromJson(Map<String, dynamic> json) => ItemExtensionAttributes(
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
  dynamic regularMinimalPrice;
  dynamic regularMaximalPrice;
  int finalPrice;
  dynamic finalMinimalPrice;
  dynamic finalMaximalPrice;

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
    regularMinimalPrice: json["regular_minimal_price"],
    regularMaximalPrice: json["regular_maximal_price"],
    finalPrice: json["final_price"],
    finalMinimalPrice: json["final_minimal_price"],
    finalMaximalPrice: json["final_maximal_price"],
  );

  Map<String, dynamic> toJson() => {
    "regular_price": regularPrice,
    "regular_minimal_price": regularMinimalPrice,
    "regular_maximal_price": regularMaximalPrice,
    "final_price": finalPrice,
    "final_minimal_price": finalMinimalPrice,
    "final_maximal_price": finalMaximalPrice,
  };
}

class MediaGalleryEntry {
  int id;
  Type mediaType;
  dynamic label;
  int position;
  bool disabled;
  List<Type> types;
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
    mediaType: typeValues.map[json["media_type"]],
    label: json["label"],
    position: json["position"],
    disabled: json["disabled"],
    types: List<Type>.from(json["types"].map((x) => typeValues.map[x])),
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": typeValues.reverse[mediaType],
    "label": label,
    "position": position,
    "disabled": disabled,
    "types": List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
    "file": file,
  };
}

enum Type { IMAGE, SMALL_IMAGE, THUMBNAIL }

final typeValues = EnumValues({
  "image": Type.IMAGE,
  "small_image": Type.SMALL_IMAGE,
  "thumbnail": Type.THUMBNAIL
});

class ProductLink {
  String sku;
  LinkType linkType;
  String linkedProductSku;
  TypeId linkedProductType;
  int position;
  ProductLinkExtensionAttributes extensionAttributes;

  ProductLink({
    this.sku,
    this.linkType,
    this.linkedProductSku,
    this.linkedProductType,
    this.position,
    this.extensionAttributes,
  });

  factory ProductLink.fromJson(Map<String, dynamic> json) => ProductLink(
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
  int finalPrice;
  String name;
  String image;
  bool isNew;
  String rating;
  String reviewCounts;

  ProductLinkExtensionAttributes({
    this.id,
    this.price,
    this.finalPrice,
    this.name,
    this.image,
    this.isNew,
    this.rating,
    this.reviewCounts,
  });

  factory ProductLinkExtensionAttributes.fromJson(Map<String, dynamic> json) => ProductLinkExtensionAttributes(
    id: json["id"],
    price: json["price"],
    finalPrice: json["final_price"],
    name: json["name"],
    image: json["image"],
    isNew: json["is_new"],
    rating: json["rating"] == null ? null : json["rating"],
    reviewCounts: json["review_counts"] == null ? null : json["review_counts"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "final_price": finalPrice,
    "name": name,
    "image": image,
    "is_new": isNew,
    "rating": rating == null ? null : rating,
    "review_counts": reviewCounts == null ? null : reviewCounts,
  };
}

enum LinkType { RELATED, CROSSSELL, UPSELL }

final linkTypeValues = EnumValues({
  "crosssell": LinkType.CROSSSELL,
  "related": LinkType.RELATED,
  "upsell": LinkType.UPSELL
});

enum TypeId { SIMPLE }

final typeIdValues = EnumValues({
  "simple": TypeId.SIMPLE
});

class TierPrice {
  int customerGroupId;
  int qty;
  double value;
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
    value: json["value"].toDouble(),
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

class Config {
  Subscription subscription;

  Config({
    this.subscription,
  });

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    subscription: Subscription.fromJson(json["subscription"]),
  );

  Map<String, dynamic> toJson() => {
    "subscription": subscription.toJson(),
  };
}

class Subscription {
  bool frequencyDay;
  Map<String, FrequencyMonth> frequencyMonth;

  Subscription({
    this.frequencyDay,
    this.frequencyMonth,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    frequencyDay: json["frequency_day"],
    frequencyMonth: Map.from(json["frequency_month"]).map((k, v) => MapEntry<String, FrequencyMonth>(k, FrequencyMonth.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "frequency_day": frequencyDay,
    "frequency_month": Map.from(frequencyMonth).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class FrequencyMonth {
  String title;
  String cycle;

  FrequencyMonth({
    this.title,
    this.cycle,
  });

  factory FrequencyMonth.fromJson(Map<String, dynamic> json) => FrequencyMonth(
    title: json["title"],
    cycle: json["cycle"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "cycle": cycle,
  };
}

class Menu {
  Horizontal main;
  Horizontal horizontal;

  Menu({
    this.main,
    this.horizontal,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    main: Horizontal.fromJson(json["main"]),
    horizontal: Horizontal.fromJson(json["horizontal"]),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
    "horizontal": horizontal.toJson(),
  };
}

class Horizontal {
  List<MenuItemNest> menuItemNest;

  Horizontal({
    this.menuItemNest,
  });

  factory Horizontal.fromJson(Map<String, dynamic> json) => Horizontal(
    menuItemNest: List<MenuItemNest>.from(json["menu_item_nest"].map((x) => MenuItemNest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu_item_nest": List<dynamic>.from(menuItemNest.map((x) => x.toJson())),
  };
}

class MenuItemNest {
  String id;
  String menuId;
  String title;
  String level;
  String sort;
  String label;
  MainContentType mainContentType;
  String mainColumn;
  dynamic mainContentHtml;
  dynamic mainContentWidth;
  dynamic cssClass;
  dynamic leftClass;
  dynamic leftWidth;
  dynamic leftContentHtml;
  dynamic rightClass;
  dynamic rightWidth;
  String rightContentHtml;
  dynamic textColor;
  dynamic hoverTextColor;
  dynamic hoverIconColor;
  String mainEnable;
  String leftEnable;
  String rightEnable;
  String link;
  dynamic cssInline;
  String menuType;
  Icon icon;
  String footerEnable;
  dynamic footerContentHtml;
  dynamic footerClass;
  String headerEnable;
  dynamic headerClass;
  dynamic headerContentHtml;
  dynamic color;
  dynamic backgroundColor;
  dynamic backgroundRepeat;
  BackgroundSize backgroundSize;
  dynamic backgroundOpacity;
  dynamic backgroundPositionX;
  dynamic backgroundPositionY;
  dynamic animationDelayTime;
  dynamic animationSpeed;
  dynamic animationIn;
  String mainParentCategory;
  String itemEnable;
  LinkTarget linkTarget;
  String hideText;
  String objId;
  HasChild hasChild;
  String isNew;
  List<Children> childrens;

  MenuItemNest({
    this.id,
    this.menuId,
    this.title,
    this.level,
    this.sort,
    this.label,
    this.mainContentType,
    this.mainColumn,
    this.mainContentHtml,
    this.mainContentWidth,
    this.cssClass,
    this.leftClass,
    this.leftWidth,
    this.leftContentHtml,
    this.rightClass,
    this.rightWidth,
    this.rightContentHtml,
    this.textColor,
    this.hoverTextColor,
    this.hoverIconColor,
    this.mainEnable,
    this.leftEnable,
    this.rightEnable,
    this.link,
    this.cssInline,
    this.menuType,
    this.icon,
    this.footerEnable,
    this.footerContentHtml,
    this.footerClass,
    this.headerEnable,
    this.headerClass,
    this.headerContentHtml,
    this.color,
    this.backgroundColor,
    this.backgroundRepeat,
    this.backgroundSize,
    this.backgroundOpacity,
    this.backgroundPositionX,
    this.backgroundPositionY,
    this.animationDelayTime,
    this.animationSpeed,
    this.animationIn,
    this.mainParentCategory,
    this.itemEnable,
    this.linkTarget,
    this.hideText,
    this.objId,
    this.hasChild,
    this.isNew,
    this.childrens,
  });

  factory MenuItemNest.fromJson(Map<String, dynamic> json) => MenuItemNest(
    id: json["id"] == null ? null : json["id"],
    menuId: json["menu_id"] == null ? null : json["menu_id"],
    title: json["title"] == null ? null : json["title"],
    level: json["level"] == null ? null : json["level"],
    sort: json["sort"] == null ? null : json["sort"],
    label: json["label"] == null ? null : json["label"],
    mainContentType: json["mainContentType"] == null ? null : mainContentTypeValues.map[json["mainContentType"]],
    mainColumn: json["mainColumn"] == null ? null : json["mainColumn"],
    mainContentHtml: json["mainContentHtml"],
    mainContentWidth: json["mainContentWidth"],
    cssClass: json["cssClass"],
    leftClass: json["leftClass"],
    leftWidth: json["leftWidth"],
    leftContentHtml: json["leftContentHtml"],
    rightClass: json["rightClass"],
    rightWidth: json["rightWidth"],
    rightContentHtml: json["rightContentHtml"] == null ? null : json["rightContentHtml"],
    textColor: json["textColor"],
    hoverTextColor: json["hoverTextColor"],
    hoverIconColor: json["hoverIconColor"],
    mainEnable: json["mainEnable"] == null ? null : json["mainEnable"],
    leftEnable: json["leftEnable"] == null ? null : json["leftEnable"],
    rightEnable: json["rightEnable"] == null ? null : json["rightEnable"],
    link: json["link"] == null ? null : json["link"],
    cssInline: json["cssInline"],
    menuType: json["menu_type"] == null ? null : json["menu_type"],
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
    footerEnable: json["footerEnable"] == null ? null : json["footerEnable"],
    footerContentHtml: json["footerContentHtml"],
    footerClass: json["footerClass"],
    headerEnable: json["headerEnable"] == null ? null : json["headerEnable"],
    headerClass: json["headerClass"],
    headerContentHtml: json["headerContentHtml"],
    color: json["color"],
    backgroundColor: json["backgroundColor"],
    backgroundRepeat: json["backgroundRepeat"],
    backgroundSize: json["backgroundSize"] == null ? null : backgroundSizeValues.map[json["backgroundSize"]],
    backgroundOpacity: json["backgroundOpacity"],
    backgroundPositionX: json["backgroundPositionX"],
    backgroundPositionY: json["backgroundPositionY"],
    animationDelayTime: json["animationDelayTime"],
    animationSpeed: json["animationSpeed"],
    animationIn: json["animationIn"],
    mainParentCategory: json["mainParentCategory"] == null ? null : json["mainParentCategory"],
    itemEnable: json["itemEnable"] == null ? null : json["itemEnable"],
    linkTarget: json["linkTarget"] == null ? null : linkTargetValues.map[json["linkTarget"]],
    hideText: json["hideText"] == null ? null : json["hideText"],
    objId: json["obj_id"] == null ? null : json["obj_id"],
    hasChild: json["hasChild"] == null ? null : hasChildValues.map[json["hasChild"]],
    isNew: json["is_new"] == null ? null : json["is_new"],
    childrens: json["childrens"] == null ? null : List<Children>.from(json["childrens"].map((x) => Children.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "menu_id": menuId == null ? null : menuId,
    "title": title == null ? null : title,
    "level": level == null ? null : level,
    "sort": sort == null ? null : sort,
    "label": label == null ? null : label,
    "mainContentType": mainContentType == null ? null : mainContentTypeValues.reverse[mainContentType],
    "mainColumn": mainColumn == null ? null : mainColumn,
    "mainContentHtml": mainContentHtml,
    "mainContentWidth": mainContentWidth,
    "cssClass": cssClass,
    "leftClass": leftClass,
    "leftWidth": leftWidth,
    "leftContentHtml": leftContentHtml,
    "rightClass": rightClass,
    "rightWidth": rightWidth,
    "rightContentHtml": rightContentHtml == null ? null : rightContentHtml,
    "textColor": textColor,
    "hoverTextColor": hoverTextColor,
    "hoverIconColor": hoverIconColor,
    "mainEnable": mainEnable == null ? null : mainEnable,
    "leftEnable": leftEnable == null ? null : leftEnable,
    "rightEnable": rightEnable == null ? null : rightEnable,
    "link": link == null ? null : link,
    "cssInline": cssInline,
    "menu_type": menuType == null ? null : menuType,
    "icon": icon == null ? null : icon.toJson(),
    "footerEnable": footerEnable == null ? null : footerEnable,
    "footerContentHtml": footerContentHtml,
    "footerClass": footerClass,
    "headerEnable": headerEnable == null ? null : headerEnable,
    "headerClass": headerClass,
    "headerContentHtml": headerContentHtml,
    "color": color,
    "backgroundColor": backgroundColor,
    "backgroundRepeat": backgroundRepeat,
    "backgroundSize": backgroundSize == null ? null : backgroundSizeValues.reverse[backgroundSize],
    "backgroundOpacity": backgroundOpacity,
    "backgroundPositionX": backgroundPositionX,
    "backgroundPositionY": backgroundPositionY,
    "animationDelayTime": animationDelayTime,
    "animationSpeed": animationSpeed,
    "animationIn": animationIn,
    "mainParentCategory": mainParentCategory == null ? null : mainParentCategory,
    "itemEnable": itemEnable == null ? null : itemEnable,
    "linkTarget": linkTarget == null ? null : linkTargetValues.reverse[linkTarget],
    "hideText": hideText == null ? null : hideText,
    "obj_id": objId == null ? null : objId,
    "hasChild": hasChild == null ? null : hasChildValues.reverse[hasChild],
    "is_new": isNew == null ? null : isNew,
    "childrens": childrens == null ? null : List<dynamic>.from(childrens.map((x) => x.toJson())),
  };
}

enum BackgroundSize { AUTO }

final backgroundSizeValues = EnumValues({
  "auto": BackgroundSize.AUTO
});

class Children {
  String title;
  int level;
  int sort;
  int label;
  MainContentType mainContentType;
  int mainColumn;
  dynamic mainContentHtml;
  int mainEnable;
  int leftEnable;
  int rightEnable;
  String link;
  String categoryId;
  int footerEnable;
  int headerEnable;
  int animationIn;
  int itemEnable;
  LinkTarget linkTarget;
  int hideText;
  HasChild hasChild;
  List<Children> childrens;
  dynamic objId;

  Children({
    this.title,
    this.level,
    this.sort,
    this.label,
    this.mainContentType,
    this.mainColumn,
    this.mainContentHtml,
    this.mainEnable,
    this.leftEnable,
    this.rightEnable,
    this.link,
    this.categoryId,
    this.footerEnable,
    this.headerEnable,
    this.animationIn,
    this.itemEnable,
    this.linkTarget,
    this.hideText,
    this.hasChild,
    this.childrens,
    this.objId,
  });

  factory Children.fromJson(Map<String, dynamic> json) => Children(
    title: json["title"],
    level: json["level"],
    sort: json["sort"],
    label: json["label"],
    mainContentType: mainContentTypeValues.map[json["mainContentType"]],
    mainColumn: json["mainColumn"],
    mainContentHtml: json["mainContentHtml"],
    mainEnable: json["mainEnable"],
    leftEnable: json["leftEnable"],
    rightEnable: json["rightEnable"],
    link: json["link"],
    categoryId: json["categoryId"],
    footerEnable: json["footerEnable"],
    headerEnable: json["headerEnable"],
    animationIn: json["animationIn"],
    itemEnable: json["itemEnable"],
    linkTarget: linkTargetValues.map[json["linkTarget"]],
    hideText: json["hideText"],
    hasChild: hasChildValues.map[json["hasChild"]],
    childrens: List<Children>.from(json["childrens"].map((x) => Children.fromJson(x))),
    objId: json["obj_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "level": level,
    "sort": sort,
    "label": label,
    "mainContentType": mainContentTypeValues.reverse[mainContentType],
    "mainColumn": mainColumn,
    "mainContentHtml": mainContentHtml,
    "mainEnable": mainEnable,
    "leftEnable": leftEnable,
    "rightEnable": rightEnable,
    "link": link,
    "categoryId": categoryId,
    "footerEnable": footerEnable,
    "headerEnable": headerEnable,
    "animationIn": animationIn,
    "itemEnable": itemEnable,
    "linkTarget": linkTargetValues.reverse[linkTarget],
    "hideText": hideText,
    "hasChild": hasChildValues.reverse[hasChild],
    "childrens": List<dynamic>.from(childrens.map((x) => x.toJson())),
    "obj_id": objId,
  };
}

enum HasChild { NO, YES }

final hasChildValues = EnumValues({
  "no": HasChild.NO,
  "yes": HasChild.YES
});

enum LinkTarget { SELF }

final linkTargetValues = EnumValues({
  "_self": LinkTarget.SELF
});

enum MainContentType { CONTENT, GRID, SUB_CATEGORY }

final mainContentTypeValues = EnumValues({
  "content": MainContentType.CONTENT,
  "grid": MainContentType.GRID,
  "sub-category": MainContentType.SUB_CATEGORY
});

class Icon {
  String name;
  Type previewType;
  String url;

  Icon({
    this.name,
    this.previewType,
    this.url,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    name: json["name"],
    previewType: typeValues.map[json["previewType"]],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "previewType": typeValues.reverse[previewType],
    "url": url,
  };
}

class Post {
  String id;
  String postAuthor;
  DateTime postDate;
  DateTime postDateGmt;
  String postContent;
  String postTitle;
  String postExcerpt;
  String postStatus;
  String commentStatus;
  String pingStatus;
  String postPassword;
  String postName;
  String toPing;
  String pinged;
  DateTime postModified;
  DateTime postModifiedGmt;
  String postContentFiltered;
  String postParent;
  String guid;
  String menuOrder;
  String postType;
  String postMimeType;
  String commentCount;
  String postSortContent;
  String postImageRepresent;
  String permalink;
  Images typeInstance;
  String url;
  Images images;
  String image;

  Post({
    this.id,
    this.postAuthor,
    this.postDate,
    this.postDateGmt,
    this.postContent,
    this.postTitle,
    this.postExcerpt,
    this.postStatus,
    this.commentStatus,
    this.pingStatus,
    this.postPassword,
    this.postName,
    this.toPing,
    this.pinged,
    this.postModified,
    this.postModifiedGmt,
    this.postContentFiltered,
    this.postParent,
    this.guid,
    this.menuOrder,
    this.postType,
    this.postMimeType,
    this.commentCount,
    this.postSortContent,
    this.postImageRepresent,
    this.permalink,
    this.typeInstance,
    this.url,
    this.images,
    this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["ID"],
    postAuthor: json["post_author"],
    postDate: DateTime.parse(json["post_date"]),
    postDateGmt: DateTime.parse(json["post_date_gmt"]),
    postContent: json["post_content"],
    postTitle: json["post_title"],
    postExcerpt: json["post_excerpt"],
    postStatus: json["post_status"],
    commentStatus: json["comment_status"],
    pingStatus: json["ping_status"],
    postPassword: json["post_password"],
    postName: json["post_name"],
    toPing: json["to_ping"],
    pinged: json["pinged"],
    postModified: DateTime.parse(json["post_modified"]),
    postModifiedGmt: DateTime.parse(json["post_modified_gmt"]),
    postContentFiltered: json["post_content_filtered"],
    postParent: json["post_parent"],
    guid: json["guid"],
    menuOrder: json["menu_order"],
    postType: json["post_type"],
    postMimeType: json["post_mime_type"],
    commentCount: json["comment_count"],
    postSortContent: json["post_sort_content"],
    postImageRepresent: json["post_image_represent"],
    permalink: json["permalink"],
    typeInstance: Images.fromJson(json["type_instance"]),
    url: json["url"],
    images: Images.fromJson(json["images"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "post_author": postAuthor,
    "post_date": postDate.toIso8601String(),
    "post_date_gmt": postDateGmt.toIso8601String(),
    "post_content": postContent,
    "post_title": postTitle,
    "post_excerpt": postExcerpt,
    "post_status": postStatus,
    "comment_status": commentStatus,
    "ping_status": pingStatus,
    "post_password": postPassword,
    "post_name": postName,
    "to_ping": toPing,
    "pinged": pinged,
    "post_modified": postModified.toIso8601String(),
    "post_modified_gmt": postModifiedGmt.toIso8601String(),
    "post_content_filtered": postContentFiltered,
    "post_parent": postParent,
    "guid": guid,
    "menu_order": menuOrder,
    "post_type": postType,
    "post_mime_type": postMimeType,
    "comment_count": commentCount,
    "post_sort_content": postSortContent,
    "post_image_represent": postImageRepresent,
    "permalink": permalink,
    "type_instance": typeInstance.toJson(),
    "url": url,
    "images": images.toJson(),
    "image": image,
  };
}

class Images {
  Images();

  factory Images.fromJson(Map<String, dynamic> json) => Images(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Slider {
  String customClass;
  int numOfItemsShow;
  List<int> optionChooseNumOfItemShow;
  String sliderAnimate;
  String sliderAnimateOut;
  int sliderMargin;
  bool sliderArrows;
  bool sliderDots;
  int autoHeight;
  int sliderLoop;
  bool autoPlay;
  String autoPlaySpeed;
  bool pauseHover;
  int draggable;
  int centerMode;
  String customCss;
  String id;
  String status;
  String type;
  List<SliderItem> items;

  Slider({
    this.customClass,
    this.numOfItemsShow,
    this.optionChooseNumOfItemShow,
    this.sliderAnimate,
    this.sliderAnimateOut,
    this.sliderMargin,
    this.sliderArrows,
    this.sliderDots,
    this.autoHeight,
    this.sliderLoop,
    this.autoPlay,
    this.autoPlaySpeed,
    this.pauseHover,
    this.draggable,
    this.centerMode,
    this.customCss,
    this.id,
    this.status,
    this.type,
    this.items,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    customClass: json["customClass"],
    numOfItemsShow: json["numOfItemsShow"],
    optionChooseNumOfItemShow: List<int>.from(json["optionChooseNumOfItemShow"].map((x) => x)),
    sliderAnimate: json["sliderAnimate"],
    sliderAnimateOut: json["sliderAnimateOut"],
    sliderMargin: json["sliderMargin"],
    sliderArrows: json["sliderArrows"],
    sliderDots: json["sliderDots"],
    autoHeight: json["autoHeight"],
    sliderLoop: json["sliderLoop"],
    autoPlay: json["autoPlay"],
    autoPlaySpeed: json["autoPlaySpeed"],
    pauseHover: json["pauseHover"],
    draggable: json["draggable"],
    centerMode: json["centerMode"],
    customCss: json["customCss"],
    id: json["id"],
    status: json["status"],
    type: json["type"],
    items: List<SliderItem>.from(json["items"].map((x) => SliderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customClass": customClass,
    "numOfItemsShow": numOfItemsShow,
    "optionChooseNumOfItemShow": List<dynamic>.from(optionChooseNumOfItemShow.map((x) => x)),
    "sliderAnimate": sliderAnimate,
    "sliderAnimateOut": sliderAnimateOut,
    "sliderMargin": sliderMargin,
    "sliderArrows": sliderArrows,
    "sliderDots": sliderDots,
    "autoHeight": autoHeight,
    "sliderLoop": sliderLoop,
    "autoPlay": autoPlay,
    "autoPlaySpeed": autoPlaySpeed,
    "pauseHover": pauseHover,
    "draggable": draggable,
    "centerMode": centerMode,
    "customCss": customCss,
    "id": id,
    "status": status,
    "type": type,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class SliderItem {
  String id;
  String orderId;
  String itemName;
  CustomImageUrl customImageUrl;
  String bgImageType;
  String bgImage;
  String bgPosition;
  String bgRepeat;
  String bgSize;
  String itemCustomClass;
  String bgLink;
  int paddingTop;
  int paddingRight;
  int paddingBottom;
  int paddingLeft;
  int marginTop;
  int marginRight;
  int marginBottom;
  int marginLeft;
  int contentPaddingTop;
  int contentPaddingRight;
  int contentPaddingBottom;
  int contentPaddingLeft;
  int contentMarginTop;
  int contentMarginRight;
  int contentMarginBottom;
  int contentMarginLeft;
  int contentWidth;
  String contentWidthUnit;
  String contentHeight;
  String contentHeightUnit;
  String contentPosition;
  String contentBgColor;
  int contentOpacity;
  String contentAnimation;
  int contentAnimationDelay;
  List<dynamic> blocks;
  String categoryId;
  String imgCateUrl;
  String categoryTitle;
  dynamic categoryDesc;
  String categoryUrl;

  SliderItem({
    this.id,
    this.orderId,
    this.itemName,
    this.customImageUrl,
    this.bgImageType,
    this.bgImage,
    this.bgPosition,
    this.bgRepeat,
    this.bgSize,
    this.itemCustomClass,
    this.bgLink,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.paddingLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.marginLeft,
    this.contentPaddingTop,
    this.contentPaddingRight,
    this.contentPaddingBottom,
    this.contentPaddingLeft,
    this.contentMarginTop,
    this.contentMarginRight,
    this.contentMarginBottom,
    this.contentMarginLeft,
    this.contentWidth,
    this.contentWidthUnit,
    this.contentHeight,
    this.contentHeightUnit,
    this.contentPosition,
    this.contentBgColor,
    this.contentOpacity,
    this.contentAnimation,
    this.contentAnimationDelay,
    this.blocks,
    this.categoryId,
    this.imgCateUrl,
    this.categoryTitle,
    this.categoryDesc,
    this.categoryUrl,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json["id"],
    orderId: json["orderId"],
    itemName: json["itemName"],
    customImageUrl: CustomImageUrl.fromJson(json["customImageUrl"]),
    bgImageType: json["bgImageType"],
    bgImage: json["bgImage"],
    bgPosition: json["bgPosition"],
    bgRepeat: json["bgRepeat"],
    bgSize: json["bgSize"],
    itemCustomClass: json["itemCustomClass"],
    bgLink: json["bgLink"],
    paddingTop: json["paddingTop"],
    paddingRight: json["paddingRight"],
    paddingBottom: json["paddingBottom"],
    paddingLeft: json["paddingLeft"],
    marginTop: json["marginTop"],
    marginRight: json["marginRight"],
    marginBottom: json["marginBottom"],
    marginLeft: json["marginLeft"],
    contentPaddingTop: json["contentPaddingTop"],
    contentPaddingRight: json["contentPaddingRight"],
    contentPaddingBottom: json["contentPaddingBottom"],
    contentPaddingLeft: json["contentPaddingLeft"],
    contentMarginTop: json["contentMarginTop"],
    contentMarginRight: json["contentMarginRight"],
    contentMarginBottom: json["contentMarginBottom"],
    contentMarginLeft: json["contentMarginLeft"],
    contentWidth: json["contentWidth"],
    contentWidthUnit: json["contentWidthUnit"],
    contentHeight: json["contentHeight"],
    contentHeightUnit: json["contentHeightUnit"],
    contentPosition: json["contentPosition"],
    contentBgColor: json["contentBgColor"],
    contentOpacity: json["contentOpacity"],
    contentAnimation: json["contentAnimation"],
    contentAnimationDelay: json["contentAnimationDelay"],
    blocks: List<dynamic>.from(json["blocks"].map((x) => x)),
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    imgCateUrl: json["imgCateUrl"] == null ? null : json["imgCateUrl"],
    categoryTitle: json["categoryTitle"] == null ? null : json["categoryTitle"],
    categoryDesc: json["categoryDesc"],
    categoryUrl: json["categoryUrl"] == null ? null : json["categoryUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "itemName": itemName,
    "customImageUrl": customImageUrl.toJson(),
    "bgImageType": bgImageType,
    "bgImage": bgImage,
    "bgPosition": bgPosition,
    "bgRepeat": bgRepeat,
    "bgSize": bgSize,
    "itemCustomClass": itemCustomClass,
    "bgLink": bgLink,
    "paddingTop": paddingTop,
    "paddingRight": paddingRight,
    "paddingBottom": paddingBottom,
    "paddingLeft": paddingLeft,
    "marginTop": marginTop,
    "marginRight": marginRight,
    "marginBottom": marginBottom,
    "marginLeft": marginLeft,
    "contentPaddingTop": contentPaddingTop,
    "contentPaddingRight": contentPaddingRight,
    "contentPaddingBottom": contentPaddingBottom,
    "contentPaddingLeft": contentPaddingLeft,
    "contentMarginTop": contentMarginTop,
    "contentMarginRight": contentMarginRight,
    "contentMarginBottom": contentMarginBottom,
    "contentMarginLeft": contentMarginLeft,
    "contentWidth": contentWidth,
    "contentWidthUnit": contentWidthUnit,
    "contentHeight": contentHeight,
    "contentHeightUnit": contentHeightUnit,
    "contentPosition": contentPosition,
    "contentBgColor": contentBgColor,
    "contentOpacity": contentOpacity,
    "contentAnimation": contentAnimation,
    "contentAnimationDelay": contentAnimationDelay,
    "blocks": List<dynamic>.from(blocks.map((x) => x)),
    "categoryId": categoryId == null ? null : categoryId,
    "imgCateUrl": imgCateUrl == null ? null : imgCateUrl,
    "categoryTitle": categoryTitle == null ? null : categoryTitle,
    "categoryDesc": categoryDesc,
    "categoryUrl": categoryUrl == null ? null : categoryUrl,
  };
}

class CustomImageUrl {
  String name;
  String type;
  String tmpName;
  int error;
  int size;
  String file;
  String url;
  Type previewType;
  String id;
  int previewWidth;
  int previewHeight;

  CustomImageUrl({
    this.name,
    this.type,
    this.tmpName,
    this.error,
    this.size,
    this.file,
    this.url,
    this.previewType,
    this.id,
    this.previewWidth,
    this.previewHeight,
  });

  factory CustomImageUrl.fromJson(Map<String, dynamic> json) => CustomImageUrl(
    name: json["name"],
    type: json["type"],
    tmpName: json["tmp_name"],
    error: json["error"],
    size: json["size"],
    file: json["file"],
    url: json["url"],
    previewType: json["previewType"] == null ? null : typeValues.map[json["previewType"]],
    id: json["id"] == null ? null : json["id"],
    previewWidth: json["previewWidth"] == null ? null : json["previewWidth"],
    previewHeight: json["previewHeight"] == null ? null : json["previewHeight"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "tmp_name": tmpName,
    "error": error,
    "size": size,
    "file": file,
    "url": url,
    "previewType": previewType == null ? null : typeValues.reverse[previewType],
    "id": id == null ? null : id,
    "previewWidth": previewWidth == null ? null : previewWidth,
    "previewHeight": previewHeight == null ? null : previewHeight,
  };
}

class TypicalCategory {
  int id;
  String label;
  String icon;

  TypicalCategory({
    this.id,
    this.label,
    this.icon,
  });

  factory TypicalCategory.fromJson(Map<String, dynamic> json) => TypicalCategory(
    id: json["id"],
    label: json["label"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "icon": icon,
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
