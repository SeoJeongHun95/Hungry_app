import 'package:baegopa/src/Home/data/model/fasting_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/router/router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FastingRecordAdapter());
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
