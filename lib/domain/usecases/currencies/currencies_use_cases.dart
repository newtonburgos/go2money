// lib/domain/usecases/get_currencies.dart
import '../../repositories/currency_repository.dart';
import '../../../data/models/currency.dart';

class GetCurrencies {
  final CurrencyRepository r;
  GetCurrencies(this.r);
  Future<List<Currency>> call() => r.getCurrencies();
}

class SaveCurrency {
  final CurrencyRepository r;
  SaveCurrency(this.r);
  Future<void> call(Currency c) => r.save(c);
}

class SetPrimaryCurrency {
  final CurrencyRepository r;
  SetPrimaryCurrency(this.r);
  Future<void> call(String code) => r.setPrimary(code);
}

class FindCurrencyByCode {
  final CurrencyRepository r;
  FindCurrencyByCode(this.r);
  Future<Currency?> call(String code) => r.findByCode(code);
}

class FindCurrencyByName {
  final CurrencyRepository r;
  FindCurrencyByName(this.r);
  Future<List<Currency>> call(String txt) => r.findByName(txt);
}

class SetCurrencyInactive {
  final CurrencyRepository r;
  SetCurrencyInactive(this.r);
  Future<void> call(String code) => r.setInactive(code);
}

class DeleteCurrency {
  final CurrencyRepository r;
  DeleteCurrency(this.r);
  Future<void> call(String code) => r.delete(code);
}
