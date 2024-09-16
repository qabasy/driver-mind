import 'package:app/src/models/receive_transaction_model.dart';
import 'package:app/src/models/send_transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:app/src/models/database_model.dart';
import 'package:app/src/blocs/transactions_screen.dart/state.dart';

class TransactionsScreenLogic extends Cubit<TransactionsScreenState> {
  int selectedTabIndex = 0;
  double totalPaid = 0, totalReceived = 0;
  List<SendTransactionModel> sendTransactions = [];
  List<ReceiveTransactionModel> receiveTransactions = [];

  TransactionsScreenLogic() : super(TransactionsScreenInitState());

  // void getData
  // logic
  void getTotalPaid() async {
    await SendTransactions.total().then(
      (value) {
        totalPaid = value;
      },
    ).onError(
      (e, s) {
        if (kDebugMode) {
          print("error:[$s], $s");
        }
      },
    );
    emit(TransactionsScreenReadTotalPaidState());
  }

  void getTotalReceived() async {
    await ReceiveTransactions.total().then((value) {
      totalReceived = value;
    }).onError((e, s) {
      if (kDebugMode) {
        print("error:[$s], $s");
      }
    });
    emit(TransactionsScreenReadTotalReceivedState());
  }

  void getSendTransactions() async {
    await SendTransactions.read(null).then((value) {
      sendTransactions = value;
    }).onError((error, s) {
      if (kDebugMode) {
        print("error:[$s], $error");
      }
    });
    emit(TransactionsScreenReadSendState());
    getTotalPaid();
  }

  void getReceiveTransactions() async {
    await ReceiveTransactions.read(null).then((value) {
      receiveTransactions = value;
    }).onError((error, s) {
      if (kDebugMode) {
        print("error:[$s], $error");
      }
    });
    emit(TransactionsScreenReadReceiveState());
    getTotalReceived();
  }

  Future insertSendTransaction(final SendTransactionModel model) async {
    await SendTransactions.insert(model).whenComplete(() {
      emit(TransactionsScreenInsertState());
    }).onError((error, s) {
      if (kDebugMode) {
        print("error:[$s], $error");
      }
    });
    getSendTransactions();
    getTotalPaid();
  }

  Future insertReceiveTransaction(final ReceiveTransactionModel model) async {
    await ReceiveTransactions.insert(model).whenComplete(() {
      emit(TransactionsScreenInsertState());
    }).onError((error, s) {
      if (kDebugMode) {
        print("error:[$s], $error");
      }
    });
    getReceiveTransactions();
    getTotalReceived();
  }

  Future toggleTransactionType() async {
    selectedTabIndex = (selectedTabIndex == 0) ? 1 : 0;
    emit(TransactionsScreenToggleTransactionTypeState());
    getReceiveTransactions();
    getSendTransactions();
  }

  Future removeSendTransaction(final SendTransactionModel model) async {
    await SendTransactions.delete(model).whenComplete(() {
      emit(TransactionsScreenDeleteState());
    });
    getSendTransactions();
    getTotalPaid();
  }

  Future removeReceiveTransaction(final ReceiveTransactionModel model) async {
    await ReceiveTransactions.delete(model).whenComplete(() {
      emit(TransactionsScreenDeleteState());
    });
    getReceiveTransactions();
    getTotalReceived();
  }

  Future updateReceiveTransaction(final ReceiveTransactionModel model) async {
    await ReceiveTransactions.update(model).whenComplete(() {
      emit(TransactionsScreenUpdateState());
    });
    getReceiveTransactions();
    getTotalReceived();
  }

  Future updateSendTransaction(final SendTransactionModel model) async {
    await SendTransactions.update(model).whenComplete(() {
      emit(TransactionsScreenUpdateState());
    });
    getSendTransactions();
    getTotalPaid();
  }
}
