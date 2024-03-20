import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../commons/ui/widgets/separator_widget.dart';
import '../../commons/ui/widgets/widgets_functions.dart';
import '../../core/utilities/config/text_config.dart';
import '../../core/utilities/variables/fonts_names.dart';

class QrUI extends StatelessWidget {
  const QrUI({super.key});

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
                //
                Text("Victoria Fashion Week",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono),
                ),
                const SizedBox(height: 10),
                Text("Scan this QR code to get 50% Discount Coupon! "
                  "Have a good day!",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
                ),
                const SizedBox(height: 20),
                const SeparatorWidget(width: double.maxFinite, height: 1),
                const SizedBox(height: 50),
                //
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    decoration: getBoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.qr_code, size: 200, color: Colors.black),
                  ),
                ),
                //
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(TablerIcons.camera, color: Colors.greenAccent),
                ),
                const SizedBox(height: 10),
                Text("Direct the camera of your \n"
                  "phone for the QR Code",
                  textAlign: TextAlign.center,
                  style: TextConfig.getGoogleStyle(FontsNames.fontSpaceMono, size: 10),
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