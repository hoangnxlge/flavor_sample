import 'package:flavor_sample/config/app_config.dart';
import 'package:flavor_sample/features/home/app_list/applist_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final appConfig = ref.read(appConfigProvider);

  late final styles =  ApplistStyles.setup(flavor: appConfig.flavor);

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
                          height: styles.appIconSize,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'appSize = ${styles.appSize}',
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
