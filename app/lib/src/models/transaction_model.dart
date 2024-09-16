abstract class TransactionModel {
  final int? id;
  final double amount;
  final String? notes;
  final String customerName;
  final DateTime createDate;
  TransactionModel({
    this.notes,
    required this.id,
    required this.amount,
    required this.customerName,
    required this.createDate,
  });

  Map<String, dynamic> toUpdateMap() {
    // Map<String, dynamic> result = {};
    // if(amount != null)
    // result.add

    return {
      "amount": amount,
      "notes": notes,
      "customer_name": customerName,
      "create_date": createDate.toString(),
    };
  }
}
