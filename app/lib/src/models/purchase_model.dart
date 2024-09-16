import 'package:app/src/models/trading_model.dart';

class PurchaseModel extends TradingModel {
  // Constructor
  PurchaseModel({
    super.id,
    super.notes,
    required super.amount,
    required super.price,
    required super.total,
    required super.createDate,
    required super.customerName,
  });

  // fromMap
  factory PurchaseModel.fromMap(final Map<String, dynamic> sale) {
    return PurchaseModel(
      id: (sale.containsKey("id") ? sale["id"] : null),
      customerName:
          (sale.containsKey("customer_name") ? sale["customer_name"] : "empty"),
      amount: (sale.containsKey("amount") ? sale["amount"] : 0),
      price: (sale.containsKey("price") ? sale["price"] : 0),
      total: (sale.containsKey("total") ? sale["total"] : 0),
      createDate: (sale.containsKey("create_date")
          ? DateTime.tryParse(sale["create_date"]) ?? DateTime.now()
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
      "create_date": createDate.toString(),
      "customer_name": customerName,
    };
  }
}
