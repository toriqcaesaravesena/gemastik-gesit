import 'package:gesit/main.dart';
import 'package:gesit/views/auth/signin_page.dart';
import 'package:gesit/views/homepage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation : '/' ,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Wrapper(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => const SignInPage(),
    ),
  ],
);
