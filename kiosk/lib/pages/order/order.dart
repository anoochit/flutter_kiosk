import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/pages/home/home.dart';
import 'package:kiosk/themes/theme.dart';
import 'package:kiosk/widgets/backbutton_widget.dart';
import 'package:kiosk/widgets/ordertype_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.total}) : super(key: key);

  final double total;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //KioskController kioskController = Get.find<KioskController>();

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    KioskController kioskController = Get.find<KioskController>();
    return Scaffold(
      backgroundColor: kMacGreen,
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BackButtonWidget(),
              ],
            ),

            // logo
            Center(
              child: SizedBox(
                width: constraints.maxWidth / 4,
                child: CachedNetworkImage(
                  imageUrl: logoImage,
                  fit: BoxFit.fitHeight,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),

            // FIXME : follow design layout
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Order",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Obx(
                    () => OrderTypeWidget(
                        title: '${kioskController.orderType}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            )),
                  ),
                ],
              ),
            ),

            // List order
            GetBuilder<KioskController>(
                id: 'order',
                init: KioskController(),
                builder: (controller) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: kioskController.orderData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var orderData = kioskController.orderData;
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(imageUrl: orderData[index]["image"]),
                          ),
                          title: Text(
                            '${orderData[index]["title"]}',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          subtitle: Text(
                            'X ${orderData[index]["qt"]}',
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                          ),
                          trailing: Text(
                            '${orderData[index]["qt"] * orderData[index]["price"]}',
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                  color: kMacYellow,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                }),

            // total and button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // total
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.grey.shade100,
                            ),
                      ),
                      Text(
                        '${widget.total}',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),

                  // Total / Checkout Button
                  InkWell(
                    child: Container(
                      width: 128,
                      height: 128 - 32,
                      child: Center(
                        child: Text(
                          "Done",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: kMacYellow,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onTap: () async {
                      // post order
                      var result = await kioskController.postOrder(orderItems: kioskController.orderData, type: '${kioskController.orderType}');
                      log('Order Id = ${result!.id}');
                      kioskController.orderData.clear();
                      kioskController.update();
                      Get.off(() => const HomePage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
