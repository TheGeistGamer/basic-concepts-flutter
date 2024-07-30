import 'package:widgets_app/src/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme changer'), actions: [
        IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvier.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
            icon: !isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined))
      ]),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    final selectedColor = ref.watch(themeNotifierProvider).selectColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              // ref.read(selectedColorProvider.notifier).state = index;
              ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            });
      },
    );
  }
}
