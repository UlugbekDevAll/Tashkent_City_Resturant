/// id : "13"
/// created_at : "2024-08-26T16:58:05.246Z"
/// updated_at : "2024-08-26T16:58:05.246Z"
/// deleted_at : null
/// name : "Шашлык"
/// description : "Шашлык"
/// sort_order : "1"
/// createdAt : "2024-08-26T16:58:05.246Z"
/// updatedAt : "2024-08-26T16:58:05.246Z"
/// deletedAt : null

class ProductsCategoryModel {

  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _name;
  String? _description;
  String? _sortOrder;

  // Konstruktor
  ProductsCategoryModel({
    String? id,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    String? name,
    String? description,
    String? sortOrder,
  }) {
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _name = name;
    _description = description;
    _sortOrder = sortOrder;
  }

  // fromJson funksiyasi
  ProductsCategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _name = json['name'];
    _description = json['description'];
    _sortOrder = json['sort_order'];
  }

  // copyWith funksiyasi
  ProductsCategoryModel copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    String? name,
    String? description,
    String? sortOrder,
  }) {
    return ProductsCategoryModel(
      id: id ?? _id,
      createdAt: createdAt ?? _createdAt,
      updatedAt: updatedAt ?? _updatedAt,
      deletedAt: deletedAt ?? _deletedAt,
      name: name ?? _name,
      description: description ?? _description,
      sortOrder: sortOrder ?? _sortOrder,
    );
  }

  // Getterlar
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get name => _name;
  String? get description => _description;
  String? get sortOrder => _sortOrder;

  // toJson funksiyasi
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['name'] = _name;
    map['description'] = _description;
    map['sort_order'] = _sortOrder;
    return map;
  }
}
