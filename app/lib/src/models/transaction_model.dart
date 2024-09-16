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
}
