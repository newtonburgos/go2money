// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go2money/presentation/screens/settings/currencies/currency_list_page.dart';
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
              name: CurrencyListPage.routeName,
              builder: (context, state) => CurrencyListPage(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.child});
  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
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
    var currentIndex = _getBottomNavBarIndex(context);
    final colors = Theme.of(context).colorScheme;
    // final iconList = <IconData>[
    //   Icons.account_balance_wallet,
    //   Icons.receipt_long,
    //   Icons.bar_chart,
    //   Icons.pie_chart_outline,
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Go2Money'),
        // backgroundColor: colors.primary,
      ),
      body: widget.child,
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: currentIndex,
        //activeColor: colors.primary,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // colors.primary,
            // colors.primary.withValues(alpha: 0.75),
            // colors.primary.withValues(alpha: 0.5),
            Color.fromRGBO(5, 150, 105, 1), // verde intenso
            Color.fromRGBO(16, 185, 129, 1), // verde medio
            Color.fromRGBO(52, 211, 153, 1), // verde claro
          ],
        ),
        color: Colors.white,
        style: TabStyle.react,
        // activeColor: Colors.yellow,
        items: [
          TabItem(icon: Icons.account_balance_wallet, title: 'Cuentas'),
          TabItem(icon: Icons.receipt_long, title: 'Facturas'),
          TabItem(icon: Icons.dashboard, title: 'Dashboard'),
          TabItem(icon: Icons.bar_chart, title: 'Reportes'),
          TabItem(icon: Icons.pie_chart_outline, title: 'Presupuesto'),
        ],
        onTap:
            (index) => _onItemTapped(
              context,
              index,
            ), // Implementar lógica de navegación
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: colors.primary,
      //   shape: const StadiumBorder(),
      //   onPressed: () => _onItemTapped(context, 4),
      //   child: Icon(
      //     Icons.dashboard,
      //     color: currentIndex == 4 ? Colors.white : colors.onPrimaryContainer,
      //   ),
      //   //params
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   backgroundColor: colors.primary,
      //   inactiveColor: colors.onPrimaryContainer,

      //   activeColor: Colors.white,
      //   gapLocation: GapLocation.center,
      //   icons: iconList,
      //   activeIndex: currentIndex,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   leftCornerRadius: 5,
      //   rightCornerRadius: 5,
      //   // notchMargin: 10,
      //   //onTap: (int) {},
      //   //onTap: (index) => setState(() => _onItemTapped(context, index), //currentIndex = index),
      //   onTap:
      //       (index) => _onItemTapped(
      //         context,
      //         index,
      //       ), // Implementar lógica de navegación
      //   //other params
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_balance_wallet),
      //       label: 'Cuentas',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.receipt_long),
      //       label: 'Facturas',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard),
      //       label: 'Dashboard',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart),
      //       label: 'Reportes',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.pie_chart_outline),
      //       label: 'Presupuesto',
      //     ),
      //   ],
      //   currentIndex: currentIndex, // Usar el índice calculado
      //   onTap:
      //       (index) => _onItemTapped(
      //         context,
      //         index,
      //       ), // Implementar lógica de navegación
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: colors.primary),
              child: Column(
                // Usar Column para foto y nombre
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    // Placeholder para foto de usuario
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: colors.primary),
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
              leading: Icon(
                Icons.account_balance_wallet,
                color: colors.primary,
              ),
              title: const Text('Cuentas'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/accounts',
                  ), // Navegar a /accounts
            ),
            ListTile(
              leading: Icon(Icons.receipt_long, color: colors.primary),
              title: const Text('Facturas'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/invoices',
                  ), // Navegar a /invoices
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: colors.primary),
              title: const Text('Reportes'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/reports',
                  ), // Navegar a /reports
            ),
            ListTile(
              leading: Icon(Icons.pie_chart_outline, color: colors.primary),
              title: const Text('Presupuesto'),
              onTap:
                  () => _onDrawerItemTapped(
                    context,
                    '/budgets',
                  ), // Navegar a /budgets
            ),
            ListTile(
              leading: Icon(Icons.settings, color: colors.primary),
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
