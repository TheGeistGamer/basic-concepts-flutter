import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/src/providers/counter_provider.dart';
import 'package:widgets_app/src/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final toggleDarkMode = ref.watch(isDarkModeProvier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvier.notifier).update((state) => !state);
              },
              icon: !toggleDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Valor: $clickCounter',
            style: Theme.of(context).textTheme.titleLarge)
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
