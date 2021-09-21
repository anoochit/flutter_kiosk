import 'dart:developer';

import 'package:get/get.dart';
import 'package:kiosk/models/food_model.dart';
import 'package:kiosk/services/kiosk_service.dart';

class KioskController extends GetxController {
  RxList<Map> orderData = [{}].obs;

  RxString orderType = "eatin".obs;

  /*
   RxList<dynamic> favoriteFoods = [].obs;
   
  getFavoriteFood({int id = 1}) async {
    KioskService kioskService = KioskService();
    Response<dynamic> response = await kioskService.getFoodByCategory(id: id);
    if (response.isOk) {
      var result = foodFromJson(response.bodyString.toString());
      favoriteFoods.clear();
      favoriteFoods.addAll(result);
      log('total in favorite =  ${favoriteFoods.length}');
    }
  }
  */

  Future<List<Food>?> getFoodByCategory({required int id}) async {
    KioskService kioskService = KioskService();
    Response<dynamic> response = await kioskService.getFoodByCategory(id: id);
    if (response.isOk) {
      var result = foodFromJson(response.bodyString.toString());
      log('total in favorite =  ${result.length}');
      return result;
    } else {
      return null;
    }
  }

  updateOrderItemQt({required int index, required int qt}) {
    orderData[index]["qt"] = qt;
  }

  addOrderItemQt({required String title, required int id, required String image, required double price, required int qt}) {
    orderData.add({'title': title, 'id': id, 'image': image, 'price': price, 'qt': qt});
  }

  removeOrderItemAt(int index) {
    orderData.removeAt(index);
  }
}
