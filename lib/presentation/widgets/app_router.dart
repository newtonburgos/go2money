import 'package:flutter/material.dart';
import 'package:go2money/presentation/screens/settings/currencies/currencies.dart';
import 'package:go2money/presentation/screens/settings/settings.dart';
import 'package:go2money/presentation/screens/tabs/accounts/accounts.dart';
import 'package:go2money/presentation/screens/tabs/budgets/budgets.dart';
import 'package:go2money/presentation/screens/tabs/dashboard/dashboard.dart';
import 'package:go2money/presentation/screens/tabs/invoices/invoices.dart';
import 'package:go2money/presentation/screens/tabs/reports/reports.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: (context, state) => Dashboard(),
        ),
        GoRoute(
          path: '/accounts',
          name: 'accounts',
          builder: (context, state) => Accounts(),
        ),
        GoRoute(
          path: '/budgets',
          name: 'budgets',
          builder: (context, state) => Budgets(),
        ),
        GoRoute(
          path: '/invoices',
          name: 'invoices',
          builder: (context, state) => Invoices(),
        ),
        GoRoute(
          path: '/reports',
          name: 'reports',
          builder: (context, state) => Reports(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => Settings(),
          routes: [
            GoRoute(
              path: '/currencies',
              name: 'currencies',
              builder: (context, state) => Currencies(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});
  final Widget child;

  int _getBottomNavBarIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/accounts')) return 0;
    if (location.startsWith('/invoices')) return 1;
    if (location.startsWith('/dashboard')) return 2;
    if (location.startsWith('/reports')) return 3;
    if (location.startsWith('/budgets')) return 4;
    return 2;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/accounts');
        break;
      case 1:
        GoRouter.of(context).go('/invoices');
        break;
      case 2:
        GoRouter.of(context).go('/dashboard');
        break;
      case 3:
        GoRouter.of(context).go('/reports');
        break;
      case 4:
        GoRouter.of(context).go('/budgets');
        break;
    }
  }

  void _onDrawerItemTapped(BuildContext context, String route) {
    GoRouter.of(context).go(route);
    Navigator.of(context).pop(); // Cerrar el drawer después de navegar
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getBottomNavBarIndex(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Go2Money')),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cuentas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Facturas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: 'Presupuesto',
          ),
        ],
        currentIndex: currentIndex, // Usar el índice calculado
        selectedItemColor: Colors.amber[800],
        unselectedItemColor:
            Colors.grey, // Añadir color para items no seleccionados
        onTap:
            (index) => _onItemTapped(
              context,
              index,
            ), // Implementar lógica de navegación
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                // Usar Column para foto y nombre
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    // Placeholder para foto de usuario
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // Placeholder para nombre de usuario
                    'Nombre de Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Cuentas'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/accounts',
                  ), // Navegar a /accounts
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Facturas'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/invoices',
                  ), // Navegar a /invoices
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Reportes'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/reports',
                  ), // Navegar a /reports
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart_outline),
              title: const Text('Presupuesto'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/budgets',
                  ), // Navegar a /budgets
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/settings',
                  ), // Navegar a /settings
            ),
            const Divider(),
            ListTile(
              title: const Text('Ayuda & Feedback'),
              onTap: () {
                // Acción para Ayuda & Feedback
              },
            ),
          ],
        ),
      ),
    );
  }
}
