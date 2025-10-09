import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app_bloc.dart';
import 'auth/auth_bloc.dart';
import 'math_explanation/math_explanation_bloc.dart';
import 'conversations/conversations_bloc.dart';
import '../network/api_service.dart';

class BlocProviders {
  static List<BlocProvider> get providers => [
    BlocProvider<AppBloc>(create: (context) => AppBloc()),
    BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
    BlocProvider<MathExplanationBloc>(
      create: (context) => MathExplanationBloc(),
    ),
    BlocProvider<ConversationsBloc>(
      create: (context) => ConversationsBloc(apiService: ApiService()),
    ),
  ];
}
