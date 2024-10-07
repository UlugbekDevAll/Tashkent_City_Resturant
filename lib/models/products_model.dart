/// price : 80
/// id : "161"
/// created_at : "2024-09-10T11:03:48.286Z"
/// updated_at : "2024-09-10T11:03:48.286Z"
/// deleted_at : null
/// user_id : "1"
/// category_id : "15"
/// name : "Сметана, Аджика, Майонез, Кетчуп, Чесночный соус"
/// photo : "1725966228285-320474912.jpg"
/// description : "Классические соусы к блюдам (цена указана за 1 соус)"
/// on_shop : true
/// is_reccomend : false
/// createdAt : "2024-09-10T11:03:48.286Z"
/// updatedAt : "2024-09-10T11:03:48.286Z"
/// deletedAt : null

class ProductsModel {
  String? _id;
  num? _price;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _userId;
  String? _categoryId;
  String? _name;
  String? _photo;
  String? _description;
  bool? _onShop;
  bool? _isReccomend;

  // Konstruktor
  ProductsModel({
    String? id,
    num? price,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    String? userId,
    String? categoryId,
    String? name,
    String? photo,
    String? description,
    bool? onShop,
    bool? isReccomend,
  }) {
    _id = id;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _userId = userId;
    _categoryId = categoryId;
    _name = name;
    _photo = photo;
    _description = description;
    _onShop = onShop;
    _isReccomend = isReccomend;
  }

  // fromJson funksiyasi
  ProductsModel.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _userId = json['user_id'];
    _categoryId = json['category_id'];
    _name = json['name'];
    _photo = json['photo'];
    _description = json['description'];
    _onShop = json['on_shop'];
    _isReccomend = json['is_reccomend'];
  }

  // copyWith funksiyasi
  ProductsModel copyWith({
    String? id,
    num? price,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    String? userId,
    String? categoryId,
    String? name,
    String? photo,
    String? description,
    bool? onShop,
    bool? isReccomend,
  }) {
    return ProductsModel(
      id: id ?? _id,
      price: price ?? _price,
      createdAt: createdAt ?? _createdAt,
      updatedAt: updatedAt ?? _updatedAt,
      deletedAt: deletedAt ?? _deletedAt,
      userId: userId ?? _userId,
      categoryId: categoryId ?? _categoryId,
      name: name ?? _name,
      photo: photo ?? _photo,
      description: description ?? _description,
      onShop: onShop ?? _onShop,
      isReccomend: isReccomend ?? _isReccomend,
    );
  }

  // Getterlar
  String? get id => _id;
  num? get price => _price;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get userId => _userId;
  String? get categoryId => _categoryId;
  String? get name => _name;
  String? get photo => _photo;
  String? get description => _description;
  bool? get onShop => _onShop;
  bool? get isReccomend => _isReccomend;

  // toJson funksiyasi
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['user_id'] = _userId;
    map['category_id'] = _categoryId;
    map['name'] = _name;
    map['photo'] = _photo;
    map['description'] = _description;
    map['on_shop'] = _onShop;
    map['is_reccomend'] = _isReccomend;
    return map;
  }
}

