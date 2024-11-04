/// id : "1"
/// name : "Чайхана Ташкент сити"
/// city : "Москва, Минская ул., 6, корп. 3"
/// location : "55.734498, 37.488296"
/// phone_number : "998958006151"
/// image_list : ""
/// working_hours : ""
/// created_at : "2024-10-11T07:54:51.751Z"

class MarkerData {
  final String id;
  final String name;
  final String city;
  final double latitude;
  final double longitude;
  final String phoneNumber;
  final String? imageList; // Assuming it can be null
  final String? workingHours; // Assuming it can be null
  final DateTime createdAt;

  MarkerData({
    required this.id,
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    this.imageList,
    this.workingHours,
    required this.createdAt,
  });

  factory MarkerData.fromJson(Map<String, dynamic> json) {
    final location = json['location'].split(',');
    return MarkerData(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      latitude: double.parse(location[0].trim()),
      longitude: double.parse(location[1].trim()),
      phoneNumber: json['phone_number'],
      imageList: json['image_list'],
      workingHours: json['working_hours'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
