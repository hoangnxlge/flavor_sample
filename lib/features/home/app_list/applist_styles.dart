import 'package:flavor_sample/config/app_config.dart';
import 'package:flavor_sample/features/home/app_list/monitor_applist_styles.dart';
import 'package:flavor_sample/features/home/app_list/standbyme_applist_styles.dart';
import 'package:flavor_sample/features/home/app_list/tv_applist_styles.dart';

abstract class ApplistStyles {
  ApplistStyles();

  factory ApplistStyles.setup({required AppFlavor flavor}) {
   switch (flavor) {
      case AppFlavor.tv:
        return TvApplistStyles();
      case AppFlavor.monitor:
        return MonitorApplistStyles();
      case AppFlavor.standbyme:
        return StandByMeApplistStyles();
    }
  }

  double get appSize;
  double get appIconSize;
}
