import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/pages/menu/menu_top_widget.dart';
import 'package:kiosk/widgets/menuitem_widget.dart';

class MenuCategoryWidget extends StatefulWidget {
  const MenuCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuCategoryWidget> createState() => _MenuCategoryWidgetState();
}

class _MenuCategoryWidgetState extends State<MenuCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var scWidth = maxWidth * 0.66;

    return SizedBox(
      width: scWidth,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MenuTopWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: (scWidth == maxWidth) ? 3 : 2,
                children: listMenuItem
                    .map(
                      (item) => SizedBox(
                        width: (scWidth / 2) - 24,
                        height: (scWidth / 2) - 24,
                        child: MenuItemWidget(
                          title: item.title,
                          image: item.image,
                          lineColor: Colors.grey.shade200,
                          onTab: () {
                            showProductByCategory(context: context, title: item.title, id: item.id);
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showProductByCategory({required BuildContext context, required int id, required String title}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        //  TODO: Show product in category
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: InkWell(
                      child: const Icon(Icons.close, size: 32),
                      onTap: () => Get.back(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              //  TODO: Show product in category from REST API
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                  crossAxisCount: 3,
                  children: <Widget>[
                    MenuItemWidget(
                      title: "Big Mac®",
                      image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg',
                      onTab: () {
                        Get.back();
                        // show product
                        showProduct(context: context, id: 2, title: "Big Mac®", image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg', price: 5.25);
                      },
                    ),
                    MenuItemWidget(
                      title: "Burger",
                      image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg',
                      onTab: () {
                        Get.back();
                        // show product
                        showProduct(context: context, id: 3, title: "Burger", image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg', price: 5.25);
                      },
                    ),
                    MenuItemWidget(
                      title: "Sandwitch",
                      image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg',
                      onTab: () {
                        Get.back();
                        // show product
                        showProduct(context: context, id: 4, title: "Sandwitch", image: '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg', price: 5.25);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showProduct({required BuildContext context, required String title, required double price, required int id, required String image}) {
    KioskController kioskController = Get.find<KioskController>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        // TODO: Show product
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Column(
            children: [
              // close button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: InkWell(
                      child: const Icon(Icons.close, size: 32),
                      onTap: () => Get.back(),
                    ),
                  ),
                ],
              ),

              // product title
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),

              // done button
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: kMacYellow, borderRadius: BorderRadius.circular(16.0)),
                  child: Text(
                    "Done",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                onTap: () {
                  //  TODO: add and update product qt
                  var data = kioskController.orderData;
                  log('add -> total items ${data.length}');

                  if (data.isEmpty) {
                    log('first add !');
                    kioskController.addOrderItemQt(id: id, title: title, image: image, price: price, qt: 1);
                  } else {
                    // FIXME: check data exist
                    bool found = false;
                    for (var element in data) {
                      if (element["id"] == id) {
                        log('found!');
                        element["qt"] = element["qt"] + 1;
                        found = true;
                        break;
                      }
                    }
                    // if not found add a new onec
                    if (!found) {
                      log('not found!');
                      kioskController.addOrderItemQt(id: id, title: title, image: image, price: price, qt: 1);
                    }
                  }
                  kioskController.update(['order']);
                  Get.back();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
