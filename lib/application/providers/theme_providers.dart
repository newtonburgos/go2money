import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
