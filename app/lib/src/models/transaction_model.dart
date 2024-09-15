abstract class TransactionModel {
  final int? id;
  final double amount;
  final String? notes;
  final String customerName;
  final DateTime createDate;
  TransactionModel({
    required this.id,
    required this.amount,
    this.notes,
    required this.customerName,
    required this.createDate,
  });
}
