import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/widgets/backbutton_widget.dart';
import 'package:kiosk/widgets/ordertype_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //KioskController kioskController = Get.find<KioskController>();

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    KioskController kioskController = Get.find<KioskController>();
    return Scaffold(
      backgroundColor: kMacGreen,
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BackButtonWidget(),
              ],
            ),
            SizedBox(
              width: constraints.maxWidth / 4,
              child: CachedNetworkImage(
                imageUrl: logoImage,
                fit: BoxFit.fitHeight,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),

            // FIXME : follow design layout
            const Text("My Order"),

            Obx(() => OrderTypeWidget(title: '${kioskController.orderType}', style: Theme.of(context).textTheme.headline5)),

            // List order

            // Total / Checkout Button
            InkWell(
              child: Container(
                width: constraints.maxWidth * 0.6,
                height: constraints.maxWidth * 0.6,
                child: Center(
                  child: Text(
                    "Done",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 202, 64),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onTap: () {
                // post order
                //kioskController.testPostOrder(orderItems: kioskController.orderData, type: '${kioskController.orderType}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
