import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizenkode_test/features/chat/domain/model.dart';
import 'package:kaizenkode_test/features/chat/presentation/widgets/chat.dart';
import 'package:kaizenkode_test/features/create_post/presentation/widgets/create_post.dart';
import 'package:kaizenkode_test/features/main_feed/presentation/widgets/main_feed.dart';
import 'package:kaizenkode_test/features/profile/presentation/widgets/profile.dart';
import 'package:kaizenkode_test/features/search/presentation/widgets/search.dart';
import '../features/chat/presentation/widgets/single_chate.dart';
import '../features/home/presentation/widgets/home.dart';

class RoutesPaths {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String chatRoute = '/chat';
  static const String profileRoute = '/profile';
  static const String createPostRoute = '/create_post';
  static const String singleChatRoute = 'singleChat';
}

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RoutesPaths.homeRoute,
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (_, GoRouterState state, child) {
          return MainFeedView(child: child);
        },
        routes: [
          GoRoute(
            name: RoutesPaths.homeRoute,
            path: RoutesPaths.homeRoute,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomeView());
            },
          ),
          GoRoute(
            name: RoutesPaths.searchRoute,
            path: RoutesPaths.searchRoute,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: SearchView());
            },
          ),
          GoRoute(
            name: RoutesPaths.chatRoute,
            path: RoutesPaths.chatRoute,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ChatView());
            },
            routes: [
              GoRoute(
                name: RoutesPaths.singleChatRoute,
                path: RoutesPaths.singleChatRoute,
                builder: (context, state) =>
                SingleChatView(messageModel: state.extra as MessageModel,),
              ),
            ]
          ),
          GoRoute(
            name: RoutesPaths.profileRoute,
            path: RoutesPaths.profileRoute,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileView()),
          ),
        ],
      ),
      GoRoute(
        name: RoutesPaths.createPostRoute,
        path: RoutesPaths.createPostRoute,
        builder: (context, state) => CreatePostView(),
      ),
    ],
  );
}
