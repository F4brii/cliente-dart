class BrandModel {
  int id;
  String brand;
  String owner;

  BrandModel({this.id, this.brand, this.owner});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      brand: json['brand'],
      owner: json['owner'],
    );
  }
}
