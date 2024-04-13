class Message {
  String full_name;
  String id;
  Message({required this.full_name,required this.id});

  factory Message.fromJson(jsonData) {
    return Message(full_name: jsonData['full_name'],id:jsonData['id'] );
  }
}
