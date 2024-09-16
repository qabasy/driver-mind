abstract class TradingModel {
  final int? id;
  DateTime createDate;
  final String? notes;
  final String customerName;
  final double price, amount, total;
  // TradingModel
  TradingModel({
    this.id,
    this.notes,
    required this.customerName,
    required this.price,
    required this.total,
    required this.amount,
    required this.createDate,
  });

  // fromMap
  
}
