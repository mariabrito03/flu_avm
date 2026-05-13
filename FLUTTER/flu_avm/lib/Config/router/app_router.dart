import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DomusScreen(),
    ),
  
      GoRoute(
      path: '/numerator-river',
      builder: (context, state) => const NumeratorScreens(),
    ),

     GoRoute(
      path: '/bands',
      builder: (context, state) => const BandsScreen(),
    ),


     GoRoute(
      path: '/charta',
      builder: (context, state) => const ChartaScreen(),
    )
],
);