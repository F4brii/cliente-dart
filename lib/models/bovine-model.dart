class BovineModel {
  int id;
  String name;
  String weight;
  DateTime dateBirth;
  String image;
  int brand;

  BovineModel(
      {this.id,
      this.name,
      this.weight,
      this.dateBirth,
      this.image,
      this.brand});

  factory BovineModel.fromJson(Map<String, dynamic> json) {
    return BovineModel(
        id: json['id'],
        name: json['name'],
        weight: json['weight'],
        dateBirth: json['dateBirth'],
        image: json['image'],
        brand: json['brand']);
  }
}
