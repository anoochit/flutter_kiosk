import 'dart:developer';

import 'package:get/get.dart';
import 'package:kiosk/models/food_model.dart' as food;
import 'package:kiosk/models/order_model.dart' as order;
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

  Future<List<food.Food>?> getFoodByCategory({required int id}) async {
    KioskService kioskService = KioskService();
    // sent post request to strapi
    Response<dynamic> response = await kioskService.getFoodByCategory(id: id);
    if (response.isOk) {
      var result = food.foodFromJson(response.bodyString.toString());
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

  Future<order.Order?> postOrder({required RxList<Map> orderItems, required String type, String status = "order", String table = "kiosk"}) async {
    KioskService kioskService = KioskService();

    // make a request data
    List<Map<String, dynamic>> dataItem = [];

    // calulate total
    double total = 0;
    for (var element in orderItems) {
      total = total + (element["price"] * element["qt"]);
      //log('$element');
      dataItem.add({
        "food": {"id": element["id"]},
        "qt": element["qt"],
        "price": element["price"]
      });
    }

    // request body
    var requestData = {"items": dataItem, "status": status, "table": table, "type": type, "total": total};
    log('$requestData');

    // sent post request to strapi
    Response<dynamic> response = await kioskService.postOrder(data: requestData);
    log('status code = ${response.statusCode}');

    // check http status
    if (response.isOk) {
      var result = order.orderFromJson(response.bodyString.toString());
      return result;
    } else {
      return null;
    }
  }
}
