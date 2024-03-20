import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../commons/ui/widgets/separator_widget.dart';
import '../../commons/ui/widgets/widgets_functions.dart';
import '../../core/utilities/config/text_config.dart';
import '../../core/utilities/variables/fonts_names.dart';
import '../../core/utilities/variables/images_sources.dart';

class EventDetailsUI extends StatelessWidget {
  const EventDetailsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.canPop(context);
          },
          child: const Icon(TablerIcons.arrow_left),
        ),
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(TablerIcons.dots),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...[
                  //
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                    child: Container(
                      width: double.maxFinite,
                      height: 200,
                      clipBehavior: Clip.none,
                      decoration: getBoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: Image.asset(ImagesSources.post4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Victoria Fashion Week",
                    textAlign: TextAlign.center,
                    style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                  ),
                  Text("Fashion Show - March 31, 2025",
                    textAlign: TextAlign.center,
                    style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
                  ),
                ],
                //
                const SizedBox(height: 20),
                const SeparatorWidget(width: double.maxFinite, height: 1),
                //
                ...[
                  const SizedBox(height: 20),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: getBoxDecoration(
                        color: Theme.of(context).highlightColor,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white12,
                            Colors.white10,
                            Theme.of(context).highlightColor.withGreen(100),
                          ]
                        ),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(TablerIcons.hand_grab, color: Colors.amber),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Refer a friend via QR code",
                                  textAlign: TextAlign.center,
                                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, bold: true, size: 10),
                                ),
                                Text("Get 50% Discount Coupon!",
                                  textAlign: TextAlign.center,
                                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(TablerIcons.arrow_right),
                        ],
                      ),
                    ),
                  ),
                ],
                //
                const SizedBox(height: 10),
                Text("The atmosphere is so incredible! "
                  "Came with my friends and the models was so good. "
                  "We got a look book and merchandise! Definitely coming back!",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
                ),
                const SizedBox(height: 10),
                //
                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(5, (index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(TablerIcons.star_filled, color: Colors.amberAccent)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("Excellent Event!",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10, bold: true),
                ),
                const SizedBox(height: 20),
                const SeparatorWidget(width: double.maxFinite, height: 1),
                const SizedBox(height: 10),
                Text("Buy Tickets",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10, bold: true),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}