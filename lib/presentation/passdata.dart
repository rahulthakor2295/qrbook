class ScreenArguments {
  String? title;
  String? message;

  ScreenArguments(this.title, this.message);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
    };
  }

  ScreenArguments.fromJson(Map json) {
    this.title = json["title"];
    this.message = json["message"];
  }
}
