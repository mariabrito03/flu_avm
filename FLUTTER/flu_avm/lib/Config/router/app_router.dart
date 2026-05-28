// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),

    GoRoute(
      path: '/home',
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
    ),

      GoRoute(
      path: '/request',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
        path: ':id',
        builder: (context, state) {
          // ignore: unused_local_variable
          final id = state.pathParameters ['id'] ?? '1';
          return PokemonScreen(pokemonId: id);
         }
        ), // GoRoute
      ],
    ),
      GoRoute(
    path: '/juegos-chicas',
    builder: (context, state) => const JuegosChicasScreen(),
  ),

  ],
);


