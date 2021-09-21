import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/pages/home/home.dart';

class MenuTopWidget extends StatelessWidget {
  const MenuTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 64,
              child: InkWell(
                child: CachedNetworkImage(
                  imageUrl: logoImage,
                  fit: BoxFit.fitHeight,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                onTap: () => Get.off(() => const HomePage()),
              ),
            ),
            const SizedBox(height: 64.0),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Hey,',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nwhat\'s up?',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      );
    });
  }
}
