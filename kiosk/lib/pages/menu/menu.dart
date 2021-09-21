import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/models/category_model.dart';
import 'package:kiosk/pages/home/home.dart';
import 'package:kiosk/pages/menu/menu_category_widget.dart';
import 'package:kiosk/pages/menu/menu_order_widget.dart';
import 'package:kiosk/pages/menu/menu_top_widget.dart';
import 'package:kiosk/widgets/menuitem_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  KioskController kioskController = Get.find<KioskController>();

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MenuCategoryWidget(),
          MenuOrderList(),
        ],
      ),
    ));
  }
}
