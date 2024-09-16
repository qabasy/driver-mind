import 'package:app/src/models/purchase_document_model.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/models/receive_transaction_document_model.dart';
import 'package:app/src/models/receive_transaction_model.dart';
import 'package:app/src/models/sale_document_model.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:app/src/models/send_transaction_document_model.dart';
import 'package:app/src/models/send_transaction_model.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class DatabaseHelper {
  static const String tbSales = "Sales";
  static const String tbPurchases = "Purchases";
  static const String tbSendTransactions = "SendTransactions";
  static const String tbReceiveTransactions = "ReceiveTransactions";

  static const String tbSalesDocuments = "SalesDocuments";
  static const String tbPurchasesDocuments = "PurchasesDocuments";
  static const String tbSendTransactionsDocuments = "SendTransactionsDocuments";
  static const String tbReceiveTransactionsDocuments =
      "ReceiveTransactionsDocuments";

  static final DatabaseHelper instance = DatabaseHelper._init();
  static sqflite.Database? _database;

  DatabaseHelper._init();

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<sqflite.Database> _initDB(String filePath) async {
    final dbPath = await sqflite.getDatabasesPath();
    final path = join(dbPath, filePath);

    return await sqflite.openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onOpen: (db) async {
        print("Database Opened Successfully");
      },
      onUpgrade: (db, oldVersion, newVersion) {
        _createDB(db, newVersion);

        print("Database Upgraded Successfully, $oldVersion, $newVersion");
      },
      onConfigure: (db) {
        print("Database Configured Successfully");
      },
      onDowngrade: (db, oldVersion, newVersion) {
        print("Database Downgraded Successfully, $oldVersion, $newVersion");
      },
    );
  }

  static Future _createDB(sqflite.Database db, int version) async {
    await db.execute(
      '''
          CREATE TABLE IF NOT EXISTS $tbPurchases (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_name TEXT NOT NULL,
            notes TEXT,
            amount float DEFAULT 0 NOT NULL,
            price float DEFAULT 0 NOT NULL,
            total float DEFAULT 0 NOT NULL,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbSales (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_name TEXT NOT NULL,
            notes TEXT,
            amount float DEFAULT 0 NOT NULL,
            price float DEFAULT 0 NOT NULL,
            total float DEFAULT 0 NOT NULL,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbSendTransactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            notes TEXT,
            customer_name TEXT,
            amount float DEFAULT 0 NOT NULL,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbReceiveTransactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            notes TEXT,
            customer_name TEXT,
            amount float DEFAULT 0 NOT NULL,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbPurchasesDocuments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            purchase_id INT NOT NULL,
            notes TEXT,
            url TEXT,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbSalesDocuments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sale_id INT NOT NULL,
            notes TEXT,
            url TEXT,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbSendTransactionsDocuments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            send_id INT NOT NULL,
            notes TEXT,
            url TEXT,
            create_date DATE DEFAULT CURRENT_DATE
          );
          CREATE TABLE IF NOT EXISTS $tbReceiveTransactionsDocuments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            receive_id INT NOT NULL,
            notes TEXT,
            url TEXT,
            create_date DATE DEFAULT CURRENT_DATE
          );
      ''',
    );

    if (kDebugMode) {
      print("Database Created Successfully");
    }
  }

  static Future close() async {
    final db = await instance.database;
    db.close();
  }
}

//  * Main

// Sales
class Sales {
  Sales._();

  // create
  static Future insert(final SaleModel sale) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbSales,
        sale.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final SaleModel sale) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbSales,
        where: "id = ?",
        whereArgs: [sale.id],
      );
    });
  }

  // update
  static Future update(final SaleModel sale) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbSales,
        sale.toUpdateMap(),
        where: "id = ?",
        whereArgs: [sale.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<SaleModel>> read(
    final SaleModel? sale, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<SaleModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      // String where =
      await db
          .query(
        DatabaseHelper.tbSales,
        // where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        // whereArgs: [sale.id],
      )
          .then((value) {
        for (var element in value) {
          result.add(SaleModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// Purchases
class Purchases {
  Purchases._();

  // create
  static Future insert(final PurchaseModel purchase) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbPurchases,
        purchase.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final PurchaseModel purchase) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbPurchases,
        where: "id = ?",
        whereArgs: [purchase.id],
      );
    });
  }

  // update
  static Future update(final PurchaseModel purchase) async {
    await DatabaseHelper.instance.database.then((db) async {
      print(purchase.toMap());
      await db.update(
        DatabaseHelper.tbPurchases,
        purchase.toUpdateMap(),
        where: "id = ?",
        whereArgs: [purchase.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<PurchaseModel>> read(
    final PurchaseModel? purchase, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<PurchaseModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db
          .query(
        DatabaseHelper.tbPurchases,
        // where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        // whereArgs: [purchase.id],
      )
          .then((value) {
        for (var element in value) {
          result.add(PurchaseModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// SendTransactions
class SendTransactions {
  SendTransactions._();
  static Future<double> total() async {
    double total = 0;
    await DatabaseHelper.instance.database.then(
      (db) async {
        await db
            .rawQuery(
          "SELECT SUM(amount) AS total FROM ${DatabaseHelper.tbSendTransactions} AS total",
        )
            .then((value) {
          if (value.isNotEmpty) {
            if (value[0].containsKey("total")) {
              total = double.tryParse(value[0]["total"].toString()) ?? 0;
            }
          }
        });
      },
    );
    return total;
  }

  // create
  static Future insert(final SendTransactionModel sendTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbSendTransactions,
        sendTransaction.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final SendTransactionModel sendTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbSendTransactions,
        where: "id = ?",
        whereArgs: [sendTransaction.id],
      );
    });
  }

  // update
  static Future update(final SendTransactionModel sendTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      print(sendTransaction.toMap());
      await db.update(
        DatabaseHelper.tbSendTransactions,
        sendTransaction.toUpdateMap(),
        where: "id = ?",
        whereArgs: [sendTransaction.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<SendTransactionModel>> read(
    final SendTransactionModel? sendTransaction, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<SendTransactionModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db
          .query(
        DatabaseHelper.tbSendTransactions,
        // where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        // whereArgs: [sendTransaction.id],
      )
          .then((value) {
        for (var element in value) {
          result.add(SendTransactionModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// ReceiveTransactions
class ReceiveTransactions {
  ReceiveTransactions._();

  // total
  static Future<double> total() async {
    double total = 0;
    await DatabaseHelper.instance.database.then(
      (db) async {
        await db
            .rawQuery(
          "SELECT SUM(amount) AS total FROM ${DatabaseHelper.tbReceiveTransactions};",
        )
            .then((value) {
          if (value.isNotEmpty) {
            if (value[0].containsKey("total")) {
              total = double.tryParse(value[0]["total"].toString()) ?? 0;
            }
          }
        });
      },
    );
    // print("GetTotal: $total");
    return total;
  }

  // create
  static Future insert(final ReceiveTransactionModel receiveTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbReceiveTransactions,
        receiveTransaction.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final ReceiveTransactionModel receiveTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbReceiveTransactions,
        where: "id = ?",
        whereArgs: [receiveTransaction.id],
      );
    });
  }

  // update
  static Future update(final ReceiveTransactionModel receiveTransaction) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbReceiveTransactions,
        receiveTransaction.toUpdateMap(),
        where: "id = ?",
        whereArgs: [receiveTransaction.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<ReceiveTransactionModel>> read(
    final ReceiveTransactionModel? receiveTransaction, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<ReceiveTransactionModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db
          .query(
        DatabaseHelper.tbReceiveTransactions,
        // where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        // whereArgs: [receiveTransaction.id],
      )
          .then((value) {
        for (var element in value) {
          result.add(ReceiveTransactionModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

/// * DOCUMENTS

// SalesDocuments
class SalesDocuments {
  SalesDocuments._();

  // create
  static Future insert(final SaleDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbSalesDocuments,
        model.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final SaleDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbSalesDocuments,
        where: "id = ?",
        whereArgs: [model.id],
      );
    });
  }

  // update
  static Future update(final SaleDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbSalesDocuments,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<SaleDocumentModel>> read(
    final SaleDocumentModel model, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<SaleDocumentModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db.query(
        DatabaseHelper.tbSalesDocuments,
        where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        whereArgs: [model.id],
      ).then((value) {
        for (var element in value) {
          result.add(SaleDocumentModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// PurchasesDocuments
class PurchasesDocuments {
  PurchasesDocuments._();

  // create
  static Future insert(final PurchaseDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbPurchasesDocuments,
        model.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final PurchaseDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbPurchasesDocuments,
        where: "id = ?",
        whereArgs: [model.id],
      );
    });
  }

  // update
  static Future update(final PurchaseDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbPurchasesDocuments,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<PurchaseDocumentModel>> read(
    final PurchaseDocumentModel model, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<PurchaseDocumentModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db.query(
        DatabaseHelper.tbPurchasesDocuments,
        where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        whereArgs: [model.id],
      ).then((value) {
        for (var element in value) {
          result.add(PurchaseDocumentModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// SendTransactionsDocuments
class SendTransactionsDocuments {
  SendTransactionsDocuments._();

  // create
  static Future insert(final SendTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbSendTransactionsDocuments,
        model.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final SendTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbSendTransactionsDocuments,
        where: "id = ?",
        whereArgs: [model.id],
      );
    });
  }

  // update
  static Future update(final SendTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbSendTransactionsDocuments,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<SendTransactionDocumentModel>> read(
    final SendTransactionDocumentModel model, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<SendTransactionDocumentModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db.query(
        DatabaseHelper.tbSendTransactionsDocuments,
        where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        whereArgs: [model.id],
      ).then((value) {
        for (var element in value) {
          result.add(SendTransactionDocumentModel.fromMap(element));
        }
      });
    });
    return result;
  }
}

// ReceiveTransactionsDocuments
class ReceiveTransactionsDocuments {
  ReceiveTransactionsDocuments._();

  // create
  static Future insert(final ReceiveTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.insert(
        DatabaseHelper.tbReceiveTransactionsDocuments,
        model.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // delete
  static Future delete(final ReceiveTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.delete(
        DatabaseHelper.tbReceiveTransactionsDocuments,
        where: "id = ?",
        whereArgs: [model.id],
      );
    });
  }

  // update
  static Future update(final ReceiveTransactionDocumentModel model) async {
    await DatabaseHelper.instance.database.then((db) async {
      await db.update(
        DatabaseHelper.tbReceiveTransactionsDocuments,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    });
  }

  // read
  static Future<List<ReceiveTransactionDocumentModel>> read(
    final ReceiveTransactionDocumentModel model, {
    final int? limit,
    final String? groupBy,
    final String? having,
    final String? orderBy,
  }) async {
    List<ReceiveTransactionDocumentModel> result = [];
    await DatabaseHelper.instance.database.then((db) async {
      await db.query(
        DatabaseHelper.tbReceiveTransactionsDocuments,
        where: "id = ?",
        limit: limit,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        whereArgs: [model.id],
      ).then((value) {
        for (var element in value) {
          result.add(ReceiveTransactionDocumentModel.fromMap(element));
        }
      });
    });
    return result;
  }
}




