class CreatePost {
  String? type;
  String? message;
  PostData? data;

  CreatePost.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new PostData.fromJson(json['data']) : null;
  }
}

class PostData {
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;

  PostData.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
  }
}
