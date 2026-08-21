import 'package:flutter/cupertino.dart';
import 'package:furniture_app/core/models/product_model.dart';
import 'package:furniture_app/presentation/screens/cart_screen.dart';
import 'package:furniture_app/presentation/screens/home_screen.dart';
import 'package:furniture_app/presentation/screens/main_menu_page.dart';
import 'package:furniture_app/presentation/screens/product_detail_screen.dart';
import 'package:furniture_app/presentation/screens/profile_screen.dart';
import 'package:furniture_app/presentation/screens/welcome_screen.dart';
import 'package:furniture_app/providers/home_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.welcome.routeName,
    routes: [
      GoRoute(path: NamedRoutes.welcome.routeName, builder: (ctx, state) => WelcomeScreen()),
      StatefulShellRoute.indexedStack(
          branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.notifications.routeName, builder: (_, _)=> Center(child: Text("Notifications"),))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.favorite.routeName, builder: (_, _)=> Center(child: Text("Favorites"),))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.home.routeName, builder: (_, _)=> ChangeNotifierProvider(
            create: (_)=> HomeProvider(),
            builder: (context, state) => HomeScreen()
          ))
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.cart.routeName, builder: (_, _)=> CartScreen())
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.profile.routeName, builder: (_, _)=> ProfileScreen())
        ]),

      ],
          builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell)),

      GoRoute(path: NamedRoutes.productDetail.routeName, builder: (ctx, state) => ProductDetailScreen(product: state.extra as ProductModel)),
    ],
);

enum NamedRoutes {
  welcome('/welcome'),
  notifications('/notifications'),
  favorite('/favorite'),
  home('/home'),
  cart('/cart'),
  profile('/profile'),
  productDetail('/product-detail')
  ;

  final String routeName;
  const NamedRoutes(this.routeName);
}