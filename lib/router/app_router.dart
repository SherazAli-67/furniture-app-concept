import 'package:flutter/cupertino.dart';
import 'package:furniture_app/presentation/screens/home_screen.dart';
import 'package:furniture_app/presentation/screens/main_menu_page.dart';
import 'package:furniture_app/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.home.routeName,
    routes: [
      GoRoute(path: NamedRoutes.welcome.routeName, builder: (ctx, state) => WelcomeScreen()),
      StatefulShellRoute.indexedStack(branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.notifications.routeName, builder: (_, _)=> Center(child: Text("Notifications"),))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.favorite.routeName, builder: (_, _)=> Center(child: Text("Favorites"),))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.home.routeName, builder: (_, _)=> HomeScreen())
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.cart.routeName, builder: (_, _)=> Center(child: Text("Cart"),))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.profile.routeName, builder: (_, _)=> Center(child: Text("Profile"),))
        ]),

      ],
          builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell))
    ],
);

enum NamedRoutes {
  welcome('/welcome'),
  notifications('/notifications'),
  favorite('/favorite'),
  home('/home'),
  cart('/cart'),
  profile('/profile'),
  ;

  final String routeName;
  const NamedRoutes(this.routeName);
}