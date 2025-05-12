// lib/data/repositories/currency_repository_impl.dart
import 'package:go2money/data/dao/currency_dao.dart';
import 'package:go2money/data/models/currency.dart';

import '../../domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyDao _dao;
  CurrencyRepositoryImpl(this._dao);

  @override
  Future<List<Currency>> getCurrencies() => _dao.getAll();
  @override
  Future<void> save(Currency c) => _dao.insert(c);
  @override
  Future<void> setPrimary(String code) => _dao.setPrimary(code);
  @override
  Future<void> setInactive(String code) => _dao.setInactive(code);
  @override
  Future<Currency?> findByCode(String code) => _dao.findByCode(code);
  @override
  Future<List<Currency>> findByName(String t) => _dao.findByName(t);
  @override
  Future<void> delete(String code) => _dao.delete(code);
}
