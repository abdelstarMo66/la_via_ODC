/*
{
"type": "Success",
"message": "Logged in Successfully",
    "data": {
        "user": {
        "userId": "5f9e3635-5d48-4d2a-9639-6b83986a1413",
        "firstName": "Mohamed",
        "lastName": "Abdelstar",
        "email": "mohamedabdelstar@gmail.com",
        "imageUrl": "https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png",
        "address": null,
        "role": "user"
        },
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjllMzYzNS01ZDQ4LTRkMmEtOTYzOS02YjgzOTg2YTE0MTMiLCJpYXQiOjE2NjA2Njc0NTYsImV4cCI6MTY2MDg0MDI1Nn0.P7UU9dSBw_0bkyt85Ha0Sz1gkj3t5S7LDYG4TZz7MXc",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjllMzYzNS01ZDQ4LTRkMmEtOTYzOS02YjgzOTg2YTE0MTMiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjA2Njc0NTYsImV4cCI6MTY2MTI3MjI1Nn0.FzaKJncWXwTkK1AwsyT9-g-jDXkYHNCBcoMhuz0SVn0"
    }
}*/

class UserModel {
  String? type;
  String? message;
  Data? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }


}

////////////////////////////////////////////////////////////

class CurrentUser {
  String? type;
  String? message;
  CurrentUserData? data;


  CurrentUser.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new CurrentUserData.fromJson(json['data']) : null;
  }

}

class CurrentUserData {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  String? userPoints;


  CurrentUserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
  }

}
