class DataModel {
  String brandName;
  String brandLogo;
  int status;
  String dueInfo;
  String due;
  int brandId;

  DataModel(
      {required this.brandLogo,
      required this.brandName,
      required this.status,
      required this.dueInfo,
      required this.due, required this.brandId});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      brandName: json["brand_name"],
      brandLogo: json["brand_logo"] ?? "images/brand1.png",
      status: json["status"],
      due: json["due"].toString(),
      dueInfo: json["due_info"],
      brandId: json["brand_id"]);
}
