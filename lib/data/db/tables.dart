const List<String> createTablesV1 = [
  createCurrencyTableSql, // Usar la nueva constante para la tabla currency
  // createCategoriesTableSql,
  // createAccountsTableSql,
  // createTransactionsTableSql,
  // createTransactionsIndexSql,
  // createInvoicesTableSql,
  // createBudgetsTableSql, // Usar la constante con el nombre de columna corregido
  // createSettingsTableSql,
];

const String createCurrencyTableSql = '''
  CREATE TABLE currency (
    code TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    rate_to_primary REAL NOT NULL,
    is_primary INTEGER NOT NULL DEFAULT 0,
    status INTEGER NOT NULL DEFAULT 1   -- 1=activa,0=inactiva
  );
  ''';
