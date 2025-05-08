import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Currencies extends ConsumerWidget {
  const Currencies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monedas')),
      body: const Center(child: Text('Currencies')),
    );
  }
}
