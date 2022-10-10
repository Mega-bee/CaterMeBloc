class HomePageModel {
  HomePageModel({
    required this.ads,
    required this.packages,
    required this.addons,
    required this.orderSettings,
    required this.notificationCount,
  });
  late final List<Ads> ads;
  late final Packages packages;
  late final List<Addons> addons;
  late final OrderSettings orderSettings;
  late final int notificationCount;

  HomePageModel.fromJson(Map<String, dynamic> json){
    ads = List.from(json['ads']).map((e)=>Ads.fromJson(e)).toList();
    packages = Packages.fromJson(json['packages']);
    addons = List.from(json['addons']).map((e)=>Addons.fromJson(e)).toList();
    orderSettings = OrderSettings.fromJson(json['orderSettings']);
    notificationCount = json['notificationCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ads'] = ads.map((e)=>e.toJson()).toList();
    _data['packages'] = packages.toJson();
    _data['addons'] = addons.map((e)=>e.toJson()).toList();
    _data['orderSettings'] = orderSettings.toJson();
    _data['notificationCount'] = notificationCount;
    return _data;
  }
}

class Ads {
  Ads({
    required this.id,
    required this.image,
  });
  late final int id;
  late final String image;

  Ads.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    return _data;
  }
}

class Packages {
  Packages({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.items,
  });
  late final int id;
  late final String name;
  late final String nameAR;
  late final List<Items> items;

  Packages.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    nameAR = json['nameAR'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nameAR'] = nameAR;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.id,
    required this.image,
    required this.imageAR,
    required this.title,
    required this.titleAR,
    required this.description,
    required this.descriptionAR,
    required this.price,
    required this.tax,
    required this.isFavorite,
    required this.min,
    required this.max,
    required this.increment,
    required this.isShisha,
    required this.isSoldPerPackage,
    required this.itemDetails,
  });
  late final int id;
  late final String image;
  late final String imageAR;
  late final String title;
  late final String titleAR;
  late final String description;
  late final String descriptionAR;
  late final int price;
  late final int tax;
  late final bool isFavorite;
  late final int min;
  late final int max;
  late final int increment;
  late final bool isShisha;
  late final bool isSoldPerPackage;
  late final List<dynamic> itemDetails;

  Items.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    imageAR = json['imageAR'];
    title = json['title'];
    titleAR = json['titleAR'];
    description = json['description'];
    descriptionAR = json['descriptionAR'];
    price = json['price'];
    tax = json['tax'];
    isFavorite = json['isFavorite'];
    min = json['min'];
    max = json['max'];
    increment = json['increment'];
    isShisha = json['isShisha'];
    isSoldPerPackage = json['isSoldPerPackage'];
    itemDetails = List.castFrom<dynamic, dynamic>(json['itemDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['imageAR'] = imageAR;
    _data['title'] = title;
    _data['titleAR'] = titleAR;
    _data['description'] = description;
    _data['descriptionAR'] = descriptionAR;
    _data['price'] = price;
    _data['tax'] = tax;
    _data['isFavorite'] = isFavorite;
    _data['min'] = min;
    _data['max'] = max;
    _data['increment'] = increment;
    _data['isShisha'] = isShisha;
    _data['isSoldPerPackage'] = isSoldPerPackage;
    _data['itemDetails'] = itemDetails;
    return _data;
  }
}

class Addons {
  Addons({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.items,
  });
  late final int id;
  late final String name;
  late final String nameAR;
  late final List<Items> items;

  Addons.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    nameAR = json['nameAR'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nameAR'] = nameAR;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OrderSettings {
  OrderSettings({
    required this.isDabberniOn,
    required this.hoursOfDaberni,
    required this.tax,
    required this.numberOfGuests,
    this.events,
    required this.setupItems,
  });
  late final bool isDabberniOn;
  late final int hoursOfDaberni;
  late final int tax;
  late final List<NumberOfGuests> numberOfGuests;
  late final Null events;
  late final List<SetupItems> setupItems;

  OrderSettings.fromJson(Map<String, dynamic> json){
    isDabberniOn = json['isDabberniOn'];
    hoursOfDaberni = json['hoursOfDaberni'];
    tax = json['tax'];
    numberOfGuests = List.from(json['numberOfGuests']).map((e)=>NumberOfGuests.fromJson(e)).toList();
    events = null;
    setupItems = List.from(json['setupItems']).map((e)=>SetupItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isDabberniOn'] = isDabberniOn;
    _data['hoursOfDaberni'] = hoursOfDaberni;
    _data['tax'] = tax;
    _data['numberOfGuests'] = numberOfGuests.map((e)=>e.toJson()).toList();
    _data['events'] = events;
    _data['setupItems'] = setupItems.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class NumberOfGuests {
  NumberOfGuests({
    required this.id,
    required this.title,
    required this.titleAR,
  });
  late final int id;
  late final String title;
  late final String titleAR;

  NumberOfGuests.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    titleAR = json['titleAR'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['titleAR'] = titleAR;
    return _data;
  }
}

class SetupItems {
  SetupItems({
    required this.id,
    required this.title,
    required this.titleAR,
  });
  late final int id;
  late final String title;
  late final String titleAR;

  SetupItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    titleAR = json['titleAR'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['titleAR'] = titleAR;
    return _data;
  }
}