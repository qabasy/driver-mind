class SendTransactionDocumentModel {
  final int? id;
  final int sendID;
  final double notes;
  final String? url;
  final DateTime createDate;

  // Constructor
  SendTransactionDocumentModel({
    required this.id,
    required this.sendID,
    required this.notes,
    required this.url,
    required this.createDate,
  });

  // fromMap
  factory SendTransactionDocumentModel.fromMap(
      final Map<String, dynamic> document) {
    return SendTransactionDocumentModel(
      id: (document.containsKey("id") ? document["id"] : null),
      sendID: (document.containsKey("send_id") ? document["send_id"] : 0),
      notes: (document.containsKey("notes") ? document["notes"] : null),
      url: (document.containsKey("url") ? document["url"] : null),
      createDate: (document.containsKey("create_date")
          ? document["create_date"]
          : DateTime.now()),
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "send_id": sendID,
      "notes": notes,
      "uel": url,
      "create_date": createDate,
    };
  }
}
