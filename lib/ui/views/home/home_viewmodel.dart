import 'package:stacked/stacked.dart';
import '../../../services/api_service.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  List<Map<String, dynamic>> products = [];

  Future<void> init() async {
    setBusy(true);
    products = await _apiService.fetchProducts();
    setBusy(false);
  }
}
