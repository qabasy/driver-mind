import 'package:app/src/models/trading_model.dart';

class SaleModel extends TradingModel {
  // Constructor
  SaleModel({
    super.id,
    super.notes,
    required super.price,
    required super.total,
    required super.amount,
    required super.createDate,
    required super.customerName,
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
// DateFormat.yMd().format(DateTime.tryParse(createDate) ?? DateTime.now());
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
