import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.image,
    this.lineColor,
    this.backgroundColor,
    required this.onTab,
  }) : super(key: key);

  final String title;
  final String image;
  final Color? lineColor;
  final Color? backgroundColor;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              border: Border.all(
                color: lineColor ?? Colors.white,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.8,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize! - 2,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          onTap: onTab,
        );
      },
    );
  }
}
