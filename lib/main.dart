import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2money/application/providers/theme_providers.dart';
import 'package:go2money/presentation/theme/theme.dart';
import 'package:go2money/presentation/widgets/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Go2Money',
      theme: AppTheme().getThemelightTheme(),
      darkTheme: AppTheme().getThemeDarkTheme(),
      themeMode: themeMode,
      routerConfig: appRouter,
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Español
      ],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
    );
  }
}
