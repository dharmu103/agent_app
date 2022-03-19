class JobModel {
  String? id;
  String? name;
  String? age;
  String? description;

  String? category;
  String? location;
  String? price;
  String? userId;
  String? userName;

  JobModel({
    this.id,
    this.name,
    this.age,
    this.description,
    this.category,
    this.location,
    this.price,
    this.userId,
    this.userName,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        description: json["description"],
        category: json["category"],
        location: json["location"],
        price: json["price"],
        userId: json["userId"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "description": description,
        "category": category,
        "location": location,
        "price": price,
        "userId": userId,
        "userName": userName,
      };
}
