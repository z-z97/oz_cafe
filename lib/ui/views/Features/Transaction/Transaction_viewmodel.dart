import 'package:stacked/stacked.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:oz_cofe/model/orderModel.dart';

class TransactionViewModel extends BaseViewModel {
  int selectedTab = 1;

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  List<TransactionModel> get transactions {
    if (selectedTab == 0) {
      return DummyData.transactions.where((t) => t.status == 'On Process').toList();
    } else {
      return DummyData.transactions.where((t) => t.status == 'Complete').toList();
    }
  }
}
