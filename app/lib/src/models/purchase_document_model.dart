class PurchaseDocumentModel {
  final int? id;
  final int purchaseID;
  final double notes;
  final String? url;
  final DateTime createDate;

  // Constructor
  PurchaseDocumentModel({
    required this.id,
    required this.purchaseID,
    required this.notes,
    required this.url,
    required this.createDate,
  });

  // fromMap
  factory PurchaseDocumentModel.fromMap(final Map<String, dynamic> document) {
    return PurchaseDocumentModel(
      id: (document.containsKey("id") ? document["id"] : null),
      purchaseID:
          (document.containsKey("purchase_id") ? document["purchase_id"] : 0),
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
      "purchase_id": purchaseID,
      "notes": notes,
      "uel": url,
      "create_date": createDate,
    };
  }
}
