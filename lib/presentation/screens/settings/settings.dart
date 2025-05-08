import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2money/application/providers/theme_providers.dart';
import 'package:go_router/go_router.dart';

// I
class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
            ),
            title: const Text('Modo oscuro'),
            trailing: Switch(
              value: themeMode == ThemeMode.dark,
              onChanged: (bool isDark) {
                ref.read(themeModeProvider.notifier).state =
                    isDark ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.currency_exchange),
            title: Text('Monedas'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              GoRouter.of(context).go('/settings/currencies');
            },
          ),
        ],
      ),
    );
  }
}
