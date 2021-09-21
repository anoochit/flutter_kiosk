import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            const SizedBox(height: 64 + 16),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              "Back",
              style: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.headline5!.fontSize),
            )
          ],
        ),
      ),
      onTap: () => Get.back(),
    );
  }
}
