class ReceiveTransactionDocumentModel {
  final int? id;
  final int receiveID;
  final double notes;
  final String? url;
  final DateTime createDate;

  // Constructor
  ReceiveTransactionDocumentModel({
    required this.id,
    required this.receiveID,
    required this.notes,
    required this.url,
    required this.createDate,
  });

  // fromMap
  factory ReceiveTransactionDocumentModel.fromMap(
      final Map<String, dynamic> document) {
    return ReceiveTransactionDocumentModel(
      id: (document.containsKey("id") ? document["id"] : null),
      receiveID:
          (document.containsKey("receive_id") ? document["receive_id"] : 0),
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
      "receive_id": receiveID,
      "notes": notes,
      "uel": url,
      "create_date": createDate,
    };
  }
}
