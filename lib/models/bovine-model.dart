class BovineModel {
  int id;
  String name;
  String weight;
  String date_birth;
  String image;
  int brand;

  BovineModel(
      {this.id,
      this.name,
      this.weight,
      this.date_birth,
      this.image,
      this.brand});

  factory BovineModel.fromJson(Map<String, dynamic> json) {
    return BovineModel(
        id: json['id'],
        name: json['name'],
        weight: json['weight'],
        date_birth: json['date_birth'],
        image: json['image'],
        brand: json['brand']);
  }
}
