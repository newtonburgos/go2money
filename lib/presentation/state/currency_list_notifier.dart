// lib/presentation/state/currency_list_notifier.dart
import 'package:riverpod/riverpod.dart';
import '../../data/models/currency.dart';
import '../providers/currency_providers.dart';

/// Lista completa de monedas (solo activas)
class CurrencyListNotifier extends AsyncNotifier<List<Currency>> {
  @override
  Future<List<Currency>> build() async {
    // Carga inicial
    final get = ref.read(getCurrenciesUc);
    return await get();
  }

  /* Métodos utilitarios para refrescar desde acciones externas */
  Future<void> refreshList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(getCurrenciesUc)());
  }
}

/// Provider que la UI consumirá
final currencyListProvider =
    AsyncNotifierProvider<CurrencyListNotifier, List<Currency>>(
      CurrencyListNotifier.new,
    );
