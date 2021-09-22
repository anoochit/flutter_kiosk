import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/controls/kiosk_controller.dart';
import 'package:kiosk/pages/menu/menu.dart';
import 'package:kiosk/widgets/curvecliper.dart';
import 'package:kiosk/widgets/menuitem_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  KioskController kioskController = Get.put(KioskController());

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft, DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //   super.dispose();
  // }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 255, 202, 64),
                ),
                ClipPath(
                  child: Container(
                    color: const Color.fromARGB(255, 239, 236, 229),
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  clipper: CurveClipper(),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02),
                  SizedBox(
                    width: constraints.maxWidth / 4,
                    child: CachedNetworkImage(
                      imageUrl: logoImage,
                      fit: BoxFit.fitHeight,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Where will you be ',
                      style: Theme.of(context).textTheme.headline3,
                      children: const <TextSpan>[
                        TextSpan(text: '\neating today?'),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth / 3.5,
                        height: constraints.maxWidth / 3.5,
                        child: MenuItemWidget(
                          title: "Eat In",
                          image: eatinIcon,
                          onTab: () {
                            // update order type and goto menu page
                            kioskController.orderType = RxString("eatin");
                            Get.off(() => const MenuPage());
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      SizedBox(
                        width: constraints.maxWidth / 3.5,
                        height: constraints.maxWidth / 3.5,
                        child: MenuItemWidget(
                          title: "Take Out",
                          image: "$urlEndpoint/uploads/h_mcdonalds_Hamburger_8b2ea1dadf.jpg",
                          onTab: () {
                            // update order type and goto menu page
                            kioskController.orderType = RxString("takeout");
                            Get.off(() => const MenuPage());
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.2),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
