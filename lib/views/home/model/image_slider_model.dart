class BannerModel {
  final int bannerId;
  final int expiryDate;
  final String title;
  final String type;
  final String path;
  final String status;

  BannerModel({
    required this.bannerId,
    required this.expiryDate,
    required this.title,
    required this.type,
    required this.path,
    required this.status,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      bannerId: json['bannerId'],
      expiryDate: json['expiryDate'],
      title: json['title'],
      type: json['type'],
      path: json['path'],
      status: json['status'],
    );
  }
}
