import 'package:riverpod/riverpod.dart';
import '../../data/models/currency.dart';
import '../providers/currency_providers.dart';
import 'currency_list_notifier.dart';

/// Patrón: cada acción es un AsyncNotifier void>
/// —su state indica idle / loading / error / data void> (= success)
/// —tras éxito invalida la lista para refrescar la UI

/* --------- SaveCurrency ----------------------- */
class SaveCurrencyNotifier extends AsyncNotifier<void> {
  @override
  void build() async {}

  Future<void> save(Currency c) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(saveCurrencyUc)(c);
      // refresca lista global
      await ref.read(currencyListProvider.notifier).refreshList();
    });
  }
}

final saveCurrencyProvider = AsyncNotifierProvider<SaveCurrencyNotifier, void>(
  SaveCurrencyNotifier.new,
);

/* --------- SetPrimaryCurrency ----------------- */
class SetPrimaryNotifier extends AsyncNotifier<void> {
  @override
  void build() async {}

  Future<void> setPrimary(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(setPrimaryUc)(code);
      await ref.read(currencyListProvider.notifier).refreshList();
    });
  }
}

final setPrimaryProvider = AsyncNotifierProvider<SetPrimaryNotifier, void>(
  SetPrimaryNotifier.new,
);

/* --------- SetCurrencyInactive ---------------- */
class SetInactiveNotifier extends AsyncNotifier<void> {
  @override
  void build() async {}

  Future<void> setInactive(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(setInactiveUc)(code);
      await ref.read(currencyListProvider.notifier).refreshList();
    });
  }
}

final setInactiveProvider = AsyncNotifierProvider<SetInactiveNotifier, void>(
  SetInactiveNotifier.new,
);

/* --------- DeleteCurrency --------------------- */
class DeleteCurrencyNotifier extends AsyncNotifier<void> {
  @override
  void build() async {}

  Future<void> delete(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(deleteCurrencyUc)(code);
      await ref.read(currencyListProvider.notifier).refreshList();
    });
  }
}

final deleteCurrencyProvider =
    AsyncNotifierProvider<DeleteCurrencyNotifier, void>(
      DeleteCurrencyNotifier.new,
    );

/* --------- FindCurrencyByCode ----------------- */
final findByCodeProvider = FutureProvider.family.autoDispose(
  (ref, String code) => ref.read(findByCodeUc)(code),
);

/* --------- FindCurrencyByName ----------------- */
final findByNameProvider = FutureProvider.family.autoDispose(
  (ref, String text) => ref.read(findByNameUc)(text),
);
