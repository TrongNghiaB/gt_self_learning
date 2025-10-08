import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend_chatbot/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../router/app_router.dart';

class AppWidget extends HookConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = useState(false);
    final user = useState<User?>(null);

    useEffect(() {
      _initializeApp(isInitialized);
      return null;
    }, []);

    useEffect(() {
      if (isInitialized.value) {
        _listenToAuthChanges(user);
      }
      return null;
    }, [isInitialized.value]);

    if (!isInitialized.value) {
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
  }

  Future<void> _initializeApp(ValueNotifier<bool> isInitialized) async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      isInitialized.value = true;
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
      isInitialized.value = true; // Continue anyway for development
    }
  }

  void _listenToAuthChanges(ValueNotifier<User?> user) {
    FirebaseAuth.instance.authStateChanges().listen((User? authUser) {
      user.value = authUser;
    });
  }
}
