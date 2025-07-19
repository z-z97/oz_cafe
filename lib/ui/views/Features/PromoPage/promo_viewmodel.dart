import 'package:oz_cofe/model/users.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:stacked/stacked.dart';
import 'package:oz_cofe/model/PromoModel.dart';
import 'package:oz_cofe/model/StoreModel.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';

class PromoViewModel extends BaseViewModel {
  List<PromoModel> get promos => DummyData.promos;

  List<StoreModel> getStoresForPromo(PromoModel promo) {
    return DummyData.stores
        .where((store) => promo.storeIds.contains(store.id))
        .toList();
  }
   // late Future<UserModel?> _userFuture;

  
    Future<UserModel?> userFuture = DummyUserService().getuser();
  
}
