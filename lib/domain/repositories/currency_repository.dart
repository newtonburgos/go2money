// lib/domain/repositories/currency_repository.dart
import '../../data/models/currency.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getCurrencies();
  Future<void> save(Currency c);
  Future<void> setPrimary(String code);
  Future<void> setInactive(String code);
  Future<Currency?> findByCode(String code);
  Future<List<Currency>> findByName(String text);
  Future<void> delete(String code);
}
