import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    // Limpiar el anterior snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog(BuildContext context) {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Dialogo de ejemplo'),
              content: const Text(
                  'Contenido del dialogo, que puede se de ayuda para que los usuarios tengan una mejor experiencia'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () {}, child: const Text('Mostrar dialogo')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar and Dialogs')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text('Aplicación de ejemplo'),
                const Text('Versión 1.0.0'),
              ]);
            },
            child: const Text('Licencias usadas'),
          ),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar dialogo'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbar'),
          onPressed: () => showCustomSnackBar(context)),
    );
  }
}
