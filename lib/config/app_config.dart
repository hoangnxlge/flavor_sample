import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppFlavor { tv, monitor } // Add more flavors here

class AppConfig {
  final AppFlavor flavor;
  final String configTitle;
  // Add more config properties here
  final double appHeight;

  AppConfig._internal({
    required this.flavor,
    required this.configTitle,
    required this.appHeight,
  });

  factory AppConfig.tv() {
    return AppConfig._internal(
      configTitle: 'Config for 16:9 screen',
      flavor: AppFlavor.tv,
      appHeight: 120,
    );
  }

  factory AppConfig.monitor() {
    return AppConfig._internal(
      configTitle: 'Config for 21:9 screen',
      flavor: AppFlavor.monitor,
      appHeight: 94,
    );
  }
}

final appConfigProvider = Provider<AppConfig>(
  (ref) {
    // Read flavor string that will be provided when run the app
    // Default flavor here is setted for TV
    const flavorString = String.fromEnvironment('flavor', defaultValue: 'tv');
    AppFlavor flavor = AppFlavor.tv;
    for (var fl in AppFlavor.values) {
      if (fl.name == flavorString) {
        flavor = fl;
      }
    }
    switch (flavor) {
      case AppFlavor.tv:
        return AppConfig.tv();
      case AppFlavor.monitor:
        return AppConfig.monitor();
    }
  },
);
