// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [ConversationDetailPage]
class ConversationDetailRoute
    extends PageRouteInfo<ConversationDetailRouteArgs> {
  ConversationDetailRoute({
    Key? key,
    required String conversationId,
    List<PageRouteInfo>? children,
  }) : super(
         ConversationDetailRoute.name,
         args: ConversationDetailRouteArgs(
           key: key,
           conversationId: conversationId,
         ),
         initialChildren: children,
       );

  static const String name = 'ConversationDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConversationDetailRouteArgs>();
      return ConversationDetailPage(
        key: args.key,
        conversationId: args.conversationId,
      );
    },
  );
}

class ConversationDetailRouteArgs {
  const ConversationDetailRouteArgs({this.key, required this.conversationId});

  final Key? key;

  final String conversationId;

  @override
  String toString() {
    return 'ConversationDetailRouteArgs{key: $key, conversationId: $conversationId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConversationDetailRouteArgs) return false;
    return key == other.key && conversationId == other.conversationId;
  }

  @override
  int get hashCode => key.hashCode ^ conversationId.hashCode;
}

/// generated route for
/// [ConversationListPage]
class ConversationListRoute extends PageRouteInfo<void> {
  const ConversationListRoute({List<PageRouteInfo>? children})
    : super(ConversationListRoute.name, initialChildren: children);

  static const String name = 'ConversationListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConversationListPage();
    },
  );
}

/// generated route for
/// [MathExplanationPage]
class MathExplanationRoute extends PageRouteInfo<void> {
  const MathExplanationRoute({List<PageRouteInfo>? children})
    : super(MathExplanationRoute.name, initialChildren: children);

  static const String name = 'MathExplanationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MathExplanationPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
