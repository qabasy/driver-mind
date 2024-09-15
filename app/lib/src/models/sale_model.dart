class SaleModel {
  final int? id;
  final String customerName;
  final DateTime createDate;
  final double amount, price, total;

  // Constructor
  SaleModel({
    required this.id,
    required this.customerName,
    required this.amount,
    required this.price,
    required this.total,
    required this.createDate,
  });

  // fromMap
  factory SaleModel.fromMap(final Map<String, dynamic> sale) {
    return SaleModel(
      id: (sale.containsKey("id") ? sale["id"] : null),
      customerName:
          (sale.containsKey("customer_name") ? sale["customer_name"] : "empty"),
      amount: (sale.containsKey("amount") ? sale["amount"] : 0),
      price: (sale.containsKey("price") ? sale["price"] : 0),
      total: (sale.containsKey("total") ? sale["total"] : 0),
      createDate: (sale.containsKey("create_date")
          ? sale["create_date"]
          : DateTime.now()),
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "total": total,
      "price": price,
      "amount": amount,
      "create_date": createDate,
      "customer_name": customerName,
    };
  }

  // // toUpdateMap
  // Map<String, dynamic> toUpdateMap() {
  //   return {
  //     "total": total,
  //     "price": price,
  //     "amount": amount,
  //     "create_date": createDate,
  //     "customer_name": customerName,
  //   };
  // }
}
