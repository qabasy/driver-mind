class SaleDocumentModel {
  final int? id;
  final int saleID;
  final double notes;
  final String? url;
  final DateTime createDate;

  // Constructor
  SaleDocumentModel({
    required this.id,
    required this.saleID,
    required this.notes,
    required this.url,
    required this.createDate,
  });

  // fromMap
  factory SaleDocumentModel.fromMap(final Map<String, dynamic> document) {
    return SaleDocumentModel(
      id: (document.containsKey("id") ? document["id"] : null),
      saleID: (document.containsKey("sale_id") ? document["sale_id"] : 0),
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
      "sale_id": saleID,
      "notes": notes,
      "uel": url,
      "create_date": createDate,
    };
  }
}
