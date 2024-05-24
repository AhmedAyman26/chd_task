class ApiProductModel {
  final String? id;
  final String? name;
  final String? description;

  ApiProductModel({this.id, this.name, this.description});

  factory ApiProductModel.fromJson(Map<String, dynamic> json) {
    return ApiProductModel(
        id: json['id'], name: json['name'], description: json['description']);
  }
}
