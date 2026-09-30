import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar and Dialogs')),
      body: _Dialogs(),
      floatingActionButton: _Snackbar(),
    );
  }
}

class _Dialogs extends StatelessWidget {
  void openAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      //oblia al usuario unicamente a salir cuando presione una opcion
      barrierDismissible: false,
      applicationIcon: const Icon(Icons.info),
      applicationName: 'Widget App',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2026 Widget App',
      children: [const Text('Widget App es una aplicación de ejemplo')],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton(
            onPressed: () {
              openAboutDialog(context);
            },
            child: const Text('licencias'),
          ),
        ],
      ),
    );
  }
}

class _Snackbar extends StatelessWidget {
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Snackbar'),
        action: SnackBarAction(label: 'ok!', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dialog'),
          content: const Text('Dialog'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('mostrar Snackbar'),
      icon: const Icon(Icons.remove),
      onPressed: () => showCustomSnackbar(context),
    );
  }
}
