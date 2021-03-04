

import 'dart:convert';

List<Getanimals> getanimalsFromMap(String str) => List<Getanimals>.from(json.decode(str).map((x) => Getanimals.fromMap(x)));

String getanimalsToMap(List<Getanimals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Getanimals {
  Getanimals({
    this.id,
    this.age,
    this.sex,
    this.name,
    this.type,
    this.breed,
    this.image,
    this.distance,
    this.description,
  });

  int id;
  Age age;
  Sex sex;
  String name;
  Type type;
  String breed;
  String image;
  int distance;
  String description;

  factory Getanimals.fromMap(Map<String, dynamic> json) => Getanimals(
    id: json["id"] == null ? null : json["id"],
    age: json["age"] == null ? null : ageValues.map[json["age"]],
    sex: json["sex"] == null ? null : sexValues.map[json["sex"]],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    breed: json["breed"] == null ? null : json["breed"],
    image: json["image"] == null ? null : json["image"],
    distance: json["distance"] == null ? null : json["distance"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "age": age == null ? null : ageValues.reverse[age],
    "sex": sex == null ? null : sexValues.reverse[sex],
    "name": name == null ? null : name,
    "type": type == null ? null : typeValues.reverse[type],
    "breed": breed == null ? null : breed,
    "image": image == null ? null : image,
    "distance": distance == null ? null : distance,
    "description": description == null ? null : description,
  };
}

enum Age { ADULT, SENIOR, YOUNG }

final ageValues = EnumValues({
  "Adult": Age.ADULT,
  "Senior": Age.SENIOR,
  "Young": Age.YOUNG
});

enum Sex { MALE, FEMALE }

final sexValues = EnumValues({
  "Female": Sex.FEMALE,
  "Male": Sex.MALE
});

enum Type { DOG }

final typeValues = EnumValues({
  "dog": Type.DOG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
