import 'package:flutter/widgets.dart';

import '../../../features/feeds/event_details_ui.dart';
import '../../../features/feeds/feeds_ui.dart';
import '../../../features/feeds/qr_ui.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes(BuildContext context) => {
  '/feeds': (context) => const FeedsUI(),
  '/qr': (context) => const QrUI(),
  '/details': (context) => const EventDetailsUI(),
};