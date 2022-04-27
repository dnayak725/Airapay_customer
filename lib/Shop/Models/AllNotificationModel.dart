class AllNotification {
  AllNotification({
    required this.id,
    required this.userId,
    required this.type,
    required this.data,
    required this.url,
    required this.readAt,
    required this.createdAt,
    required this.headtitle,
    required this.message,
    required this.readNotify,
  });
  late int id;
  late int userId;
  late String type;
  late String data;
  late String url;
  late String readAt;
  late String createdAt;
  late String headtitle;
  late String message;
  late List<ReadNotification> readNotify;
}

class ReadNotification {
  ReadNotification({
    required this.read,
  });
  late String read;
}
