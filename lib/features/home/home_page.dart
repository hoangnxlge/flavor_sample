import 'package:flavor_sample/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final appConfig = ref.read(appConfigProvider);

  // This getter is used in example 2
  double get appHeight {
    switch (appConfig.flavor) {
      case AppFlavor.tv:
        return 120;
      case AppFlavor.monitor:
        return 94;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'This is ${appConfig.flavor.name} flavor',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                appConfig.configTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app.png',
                          height: appConfig.appHeight,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Example 1: create appHeight property in appConfig\n'
                          'appConfig.appHeight = ${appConfig.appHeight}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app.png',
                          height: appHeight,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Example 2: use AppFlavor enum to detect flavor and set height\n'
                          'If flavor is tv, appHeight = 120\n'
                          'If flavor is monitor, appHeight = 94\n'
                          'current flavor is ${appConfig.flavor.name} => appHeight = $appHeight',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
