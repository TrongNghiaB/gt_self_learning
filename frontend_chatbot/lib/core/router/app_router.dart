import 'package:auto_route/auto_route.dart';
import '../../features/math_explanation/presentation/pages/math_explanation_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, path: "/auth", initial: true),
    AutoRoute(page: MathExplanationRoute.page, path: "/math_explanation"),
  ];
}

final appRouter = AppRouter();
