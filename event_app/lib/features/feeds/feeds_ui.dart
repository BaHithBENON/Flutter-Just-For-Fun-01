import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../commons/ui/widgets/widgets_functions.dart';
import '../../core/utilities/config/text_config.dart';
import '../../core/utilities/variables/fonts_names.dart';
import '../../core/utilities/variables/images_sources.dart';
import 'widgets/post_widget.dart';

class FeedsUI extends StatelessWidget {
  const FeedsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(TablerIcons.category),
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(TablerIcons.notification),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  const SizedBox(height: 10),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                          Container(
                            height: 40, width: 40,
                            clipBehavior: Clip.hardEdge,
                            decoration: getBoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage(ImagesSources.post2),
                                fit: BoxFit.cover
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amberAccent.withOpacity(.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Close events reminder".toUpperCase(),
                                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                                ),
                                Text("Jakarta Snakers Day",
                                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                //
                ...[
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Recommended Events",
                          textAlign: TextAlign.start,
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text("Show all",
                          textAlign: TextAlign.end,
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //
                  const PostWidget(),
                ],
                //
                ...[
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Events Nearby you",
                          textAlign: TextAlign.start,
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text("Show all",
                          textAlign: TextAlign.end,
                          style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const PostWidget(),
                  const SizedBox(height: 100),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}