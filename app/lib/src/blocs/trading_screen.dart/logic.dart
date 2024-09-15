import 'package:app/src/blocs/trading_screen.dart/state.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:bloc/bloc.dart';

class TradingScreenLogic extends Cubit<TradingScreenState> {
  List<SaleModel> sendTrading = [];
  List<PurchaseModel> receiveTrading = [];
  double totalPaid = 0, totalReceived = 0;

  TradingScreenLogic() : super(TradingScreenInitState());
}
