import 'package:app/src/models/transaction_model.dart';

class ReceiveTransactionModel extends TransactionModel {
  // Constructor
  ReceiveTransactionModel({
    super.id,
    super.notes,
    required super.amount,
    required super.createDate,
    required super.customerName,
  });

  // fromMap
  factory ReceiveTransactionModel.fromMap(
      final Map<String, dynamic> transaction) {
    return ReceiveTransactionModel(
      id: (transaction.containsKey("id") ? transaction["id"] : null),
      customerName: (transaction.containsKey("customer_name")
          ? transaction["customer_name"]
          : "empty"),
      notes: (transaction.containsKey("notes") ? transaction["notes"] : null),
      amount: (transaction.containsKey("amount") ? transaction["amount"] : 0),
      createDate: (transaction.containsKey("create_date")
          ? DateTime.tryParse(transaction["create_date"]) ?? DateTime.now()
          : DateTime.now()),
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "amount": amount,
      "notes": notes,
      "create_date": createDate.toString(),
      "customer_name": customerName,
    };
  }

  // empty
  factory ReceiveTransactionModel.empty() {
    // var transaction = {
    //   "id": null,
    //   "amount": 0,
    //   "notes": null,
    //   "create_date": DateTime.now(),
    //   "customer_name": null,
    // };
    return ReceiveTransactionModel(
      id: null,
      amount: 0.0,
      customerName: "empty",
      createDate: DateTime.now(),
    );
  }
}
