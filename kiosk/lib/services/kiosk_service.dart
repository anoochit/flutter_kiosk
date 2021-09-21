import 'package:get/get_connect/connect.dart';
import 'package:kiosk/const.dart';

class KioskService extends GetConnect {
  Future<Response> getFoodByCategory({required int id}) => get(
        '$urlEndpoint/foods?categories.id=$id',
      );

  Future<Response> postOrder({required Map data}) => post(
        '$urlEndpoint/orders',
        data,
        contentType: "application/json",
      );
}
