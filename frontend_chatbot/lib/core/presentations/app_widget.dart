import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend_chatbot/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/app_router.dart';
import '../bloc/app/app_bloc.dart';
import '../bloc/auth/auth_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (mounted) {
        context.read<AppBloc>().add(const AppInitialized());
        _listenToAuthChanges();
      }
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
      if (mounted) {
        context.read<AppBloc>().add(const AppInitialized());
        _listenToAuthChanges();
      }
    }
  }

  void _listenToAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? authUser) {
      if (mounted) {
        context.read<AppBloc>().add(AuthStateChanged(authUser));
        // Only check auth status if user is authenticated and not null
        // This prevents checking auth status during sign out process
        if (authUser != null && authUser.uid.isNotEmpty) {
          context.read<AuthBloc>().add(const CheckAuthStatus());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        // Navigate when authentication state changes
        if (state.isInitialized) {
          final router = appRouter;
          if (state.isAuthenticated &&
              router.current.name != MathExplanationRoute.name) {
            router.pushAndPopUntil(
              const MathExplanationRoute(),
              predicate: (route) => false,
            );
          } else if (!state.isAuthenticated &&
              router.current.name != AuthRoute.name) {
            router.pushAndPopUntil(
              const AuthRoute(),
              predicate: (route) => false,
            );
          }
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (!state.isInitialized) {
            return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }

          return MaterialApp.router(
            title: 'Math Explainer',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
            ),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
