class ProductModel {
  String? type;
  String? message;
  List<DataProduct>? data;


  ProductModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataProduct>[];
      json['data'].forEach((v) {
        data!.add(new DataProduct.fromJson(v));
      });
    }
  }

}

class DataProduct {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  Seed? seed;
  Plant? plant;
  Tool? tool;


  DataProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = json['seed'] != null ? new Seed.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? new Tool.fromJson(json['tool']) : null;
  }

}

class Seed {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

class Plant {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;


  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}

class Tool {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;


  Tool.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}
