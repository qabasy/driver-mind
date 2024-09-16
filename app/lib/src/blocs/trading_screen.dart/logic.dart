import 'package:app/src/blocs/trading_screen.dart/state.dart';
import 'package:app/src/models/database_model.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:app/src/models/trading_model.dart';
import 'package:bloc/bloc.dart';

class TradingScreenLogic extends Cubit<TradingScreenState> {
  List<SaleModel> sales = [];
  List<PurchaseModel> purchases = [];
  TradingModel? currentModel;

  TradingScreenLogic() : super(TradingScreenInitState());

  Future<void> getSales() async {
    await Sales.read(null).then((value) {
      sales = value;
    });
    emit(TradingScreenReadSalesState());
  }

  Future<void> getPurchases() async {
    await Purchases.read(null).then((value) {
      purchases = value;
    });
    emit(TradingScreenReadPurchaseState());
  }

  Future<void> insertPurchase(final PurchaseModel model) async {
    await Purchases.insert(model);
    emit(TradingScreenInsertState());
    await getPurchases();
    // emit(TradingScreenReadPurchaseState());
  }

  Future<void> insertSale(final SaleModel model) async {
    await Sales.insert(model);
    emit(TradingScreenInsertState());
    await getSales();
  }

  Future<void> deletePurchase(final PurchaseModel model) async {
    await Purchases.delete(model);
    emit(TradingScreenDeleteState());
    await getPurchases();
  }

  Future<void> deleteSale(final SaleModel model) async {
    await Sales.delete(model);
    emit(TradingScreenDeleteState());
    await getSales();
  }

  Future<void> updatePurchase(final PurchaseModel model) async {
    await Purchases.update(model);
    emit(TradingScreenUpdateState());
    await getPurchases();
  }

  Future<void> updateSale(final SaleModel model) async {
    await Sales.update(model);
    emit(TradingScreenUpdateState());
    await getSales();
  }
}
