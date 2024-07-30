import 'package:widgets_app/src/providers/theme_provider.dart';
import 'package:widgets_app/src/config/router/app_router.dart';
import 'package:widgets_app/src/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final isDarkMode = ref.watch(isDarkModeProvier);
    // final isToggleColor = ref.watch(selectedColorProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme.getTheme(),
    );
  }
}
