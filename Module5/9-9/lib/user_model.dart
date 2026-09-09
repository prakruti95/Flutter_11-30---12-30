class UserModel {
  final String? id;
  final String name;
  final int age;

  UserModel({this.id, required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory UserModel.fromJson(String id, Map<dynamic, dynamic> json) {
    return UserModel(
      id: id,
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
    );
  }
}
