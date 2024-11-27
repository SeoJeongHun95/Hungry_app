import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouteProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: 'BaeGoPa',
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
