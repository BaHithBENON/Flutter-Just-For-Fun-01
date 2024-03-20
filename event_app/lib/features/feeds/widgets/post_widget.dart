import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../../commons/ui/widgets/separator_widget.dart';
import '../../../commons/ui/widgets/widgets_functions.dart';
import '../../../core/utilities/config/text_config.dart';
import '../../../core/utilities/variables/fonts_names.dart';
import '../../../core/utilities/variables/images_sources.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        decoration: getBoxDecoration(
          color: Theme.of(context).highlightColor,
          gradient: LinearGradient(
            colors: [
              Colors.white12,
              Colors.white10,
              Theme.of(context).highlightColor.withGreen(100),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: getBoxDecoration(
                    color: Colors.transparent,
                    image: const DecorationImage(
                      image: AssetImage(ImagesSources.post1),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                //
                Positioned(
                  top: 20, 
                  left: 20,
                  child: Container(
                    decoration: getBoxDecoration(color: Colors.white30),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 10),
                        Text("4.5",
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10, bold: true),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Djakarta Warehouse Project",
                    style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                  ),
                  Text.rich(const TextSpan(
                    children: [
                      TextSpan(
                        text: "Music Festival ° 22-24 May 2024",
                      )
                    ]),
                    style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SeparatorWidget(width: double.maxFinite, height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("DWP",
                      style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Book now",
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                        ),
                        const SizedBox(width: 10),
                        const Icon(TablerIcons.arrow_right, size: 10),
                      ],
                    ),
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