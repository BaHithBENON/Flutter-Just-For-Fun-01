import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'core/utilities/config/route_config.dart';
import 'core/utilities/config/theme_config.dart';
import 'core/utilities/variables/app_texts.dart';
import 'core/utilities/variables/enums.dart';
import 'core/utilities/variables/fonts_names.dart';

/// Initializes the app and runs the main function.
///
/// This function is responsible for initializing the GetStorage, setting up the
/// widgets binding, initializing the theme manager, setting the system UI
/// overlay style, and running the app.
///
/// Returns a `Future<void>` that represents the asynchronous execution of the
/// function.
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // Builds and returns the main application widget based on the current theme settings.
  @override
  /// Builds and returns the main application widget.
  ///
  /// This function builds and returns the main application widget, which is a
  /// [ThemeBuilder] widget that builds the application's theme based on the
  /// current theme settings.
  @override
  Widget build(BuildContext context) {
    // The ThemeBuilder widget builds the application's theme based on the
    // current theme settings.
    return ThemeBuilder(
      // The function that builds the status bar color.
      statusBarColorBuilder: (theme) => theme!.primaryColor,
      // The default theme mode.
      defaultThemeMode: ThemeConfig.getActualThemeMode() == AppThemeMode.Dark
        ? ThemeMode.dark : ThemeMode.dark,
      // The dark theme.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        fontFamily: FontsNames.fontMono,
        highlightColor: const Color.fromARGB(100, 56, 55, 55),
        primaryColor: Colors.grey[900],
        cardColor: const Color.fromARGB(255, 56, 55, 55),
        canvasColor: const Color.fromARGB(255, 56, 55, 55),
      ),
      // The light theme.
      lightTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: FontsNames.fontMono,
        primaryColor: Colors.white,
        highlightColor: Colors.grey[200],
        cardColor: const Color.fromARGB(255, 245, 245, 245),
        canvasColor: const Color.fromARGB(255, 245, 245, 245),
        focusColor: const Color.fromARGB(246, 243, 237, 237),
      ),
      // The builder function that builds the application widget.
      builder: (context, regularTheme, darkTheme, themeMode) => GetMaterialApp(
        // The title of the application.
        title: AppStrings.appName,
        // Whether to show the checked mode banner.
        debugShowCheckedModeBanner: false,
        // The regular theme.
        theme: regularTheme,
        // The dark theme.
        darkTheme: darkTheme,
        // The theme mode.
        themeMode: themeMode as ThemeMode,
        // The initial route of the application.
        initialRoute: '/feeds',
        // The routes of the application.
        routes: getAppRoutes(context),
      ),
    );
  }
}
