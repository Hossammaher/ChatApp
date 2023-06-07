class Message {
  String message;
  String id ;



  Message({required this.message, required this.id});



  factory Message.fromJson(jsonData) {
    return Message(message: jsonData['message'],id: jsonData['id']);
  }
}
