// lib/presentation/providers/currency_providers.dart
import 'package:go2money/domain/repositories/currency_repository_impl.dart';
import 'package:go2money/domain/usecases/currencies/currencies_use_cases.dart';
import 'package:riverpod/riverpod.dart';
import '../../data/dao/currency_dao.dart';

/* DAO ---------------------------------------------------------------- */
final currencyDaoProvider = Provider((_) => CurrencyDao());

/* Repository --------------------------------------------------------- */
final currencyRepoProvider = Provider(
  (ref) => CurrencyRepositoryImpl(ref.read(currencyDaoProvider)),
);

/* Use‑cases ---------------------------------------------------------- */
final getCurrenciesUc = Provider(
  (ref) => GetCurrencies(ref.read(currencyRepoProvider)),
);
final saveCurrencyUc = Provider(
  (ref) => SaveCurrency(ref.read(currencyRepoProvider)),
);
final setPrimaryUc = Provider(
  (ref) => SetPrimaryCurrency(ref.read(currencyRepoProvider)),
);
final findByCodeUc = Provider(
  (ref) => FindCurrencyByCode(ref.read(currencyRepoProvider)),
);
final findByNameUc = Provider(
  (ref) => FindCurrencyByName(ref.read(currencyRepoProvider)),
);
final setInactiveUc = Provider(
  (ref) => SetCurrencyInactive(ref.read(currencyRepoProvider)),
);
final deleteCurrencyUc = Provider(
  (ref) => DeleteCurrency(ref.read(currencyRepoProvider)),
);
