import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/math_explanation/presentation/pages/math_explanation_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/conversations/presentation/pages/conversation_list_page.dart';
import '../../features/conversations/presentation/pages/conversation_detail_page.dart';
import '../bloc/app/app_bloc.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, path: "/auth"),
    AutoRoute(page: MathExplanationRoute.page, path: "/math_explanation"),
    AutoRoute(page: ConversationListRoute.page, path: "/conversations"),
    AutoRoute(
      page: ConversationDetailRoute.page,
      path: "/conversations/:conversationId",
    ),
    AutoRoute(page: SplashRoute.page, path: "/", initial: true),
  ];
}

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (!state.isInitialized) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Navigate based on authentication state
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.isAuthenticated) {
            context.router.pushAndPopUntil(
              const MathExplanationRoute(),
              predicate: (route) => false,
            );
          } else {
            context.router.pushAndPopUntil(
              const AuthRoute(),
              predicate: (route) => false,
            );
          }
        });

        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

final appRouter = AppRouter();
