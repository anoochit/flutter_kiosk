import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/pages/order/order.dart';
import 'package:kiosk/widgets/ordertype_widget.dart';

class MenuOrderList extends StatefulWidget {
  const MenuOrderList({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuOrderList> createState() => _MenuOrderListState();
}

class _MenuOrderListState extends State<MenuOrderList> {
  @override
  Widget build(BuildContext context) {
    KioskController kioskController = Get.find<KioskController>();
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: kMacGrey,
          child: Column(
            children: [
              const SizedBox(height: 128 + 8),
              // my order title
              Text(
                "My Order",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Obx(() => OrderTypeWidget(title: '${kioskController.orderType}', style: Theme.of(context).textTheme.headline6)),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                  thickness: 2.0,
                ),
              ),

              // TODO : order item layout
              GetBuilder<KioskController>(
                id: 'order',
                init: KioskController(),
                builder: (controller) {
                  log('total items ${controller.orderData.length}');
                  // FIXME : remove 1st one on list
                  try {
                    if (controller.orderData.first.isEmpty) {
                      controller.orderData.removeAt(0);
                    }
                  } catch (e) {
                    log('order list is empty');
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: kioskController.orderData.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CachedNetworkImage(width: constraints.maxWidth * 0.6, imageUrl: kioskController.orderData[index]["image"]),
                            Text('${kioskController.orderData[index]["title"]}'),
                            Text('${kioskController.orderData[index]["qt"]}'),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),

              // TODO : Change code on total calculation
              GetBuilder<KioskController>(
                  id: 'order',
                  init: KioskController(),
                  builder: (controller) {
                    var data = controller.orderData;
                    double total = 0;
                    for (var element in data) {
                      total = total + (element["price"] * element["qt"]);
                    }
                    return Column(
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '${total}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
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
                            if (total > 0) {
                              Get.to(() => const OrderPage());
                            }
                          },
                        ),
                        const SizedBox(height: 32.0),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
