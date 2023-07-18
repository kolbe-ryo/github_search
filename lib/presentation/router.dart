import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/repo/state/current_repo.dart';
import '../domain/repositories/repo/entity/repo.dart';
import '../domain/repositories/repo/entity/repo_param.dart';
import 'page/error/error_page.dart';
import 'page/repo/avatar_preview_page.dart';
import 'page/repo/repo_index_page.dart';
import 'page/repo/repo_view_page.dart';
import 'repo_search_page.dart';

// part 'router.g.dart';

/// リポジトリ一覧画面
class RepoIndexRoute extends GoRouteData {
  const RepoIndexRoute();

  static const name = 'repo-index';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
        name: name,
        child: const RepoIndexPage(),
      );
}

/// リポジトリ検索画面
class RepoSearchRoute extends GoRouteData {
  const RepoSearchRoute();

  static const name = 'repo-search';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
        name: name,
        child: const RepoSearchPage(),
      );
}

/// リポジトリ詳細画面
///
/// 下記の go_router_builder のバグ？があるため、$extra でキャッシュされた Repo
/// を受け取るのをやめている。バグが直ったら元に戻したい。
///
/// ＜バグの内容＞
/// https://github.com/flutter/flutter/issues/106121
/// $extra を含むルートがネストしていて、ネストしたページを開いたときにエラーが発生する。
/// アバター画面表示時に $extra に AvatarPreviewRoute インスタンスがきて
/// 型不一致でエラーになってしまう。
///
/// ＜回避方法＞
/// $extra をやめること。
class RepoViewRoute extends GoRouteData {
  const RepoViewRoute(
    this.ownerName,
    this.repoName,
  );

  factory RepoViewRoute.from({required Repo repo}) => RepoViewRoute(
        repo.ownerName,
        repo.repoName,
      );

  final String ownerName;
  final String repoName;

  static const name = 'repo-view';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
        name: name,
        child: ProviderScope(
          overrides: [
            currentRepoParamProvider.overrideWith(
              (_) => RepoParam(
                ownerName: ownerName,
                repoName: repoName,
              ),
            ),
          ],
          child: const RepoViewPage(),
        ),
      );
}

/// アバタープレビュー画面
class AvatarPreviewRoute extends GoRouteData {
  const AvatarPreviewRoute(
    this.ownerName,
    this.repoName, {
    this.$extra,
  });

  factory AvatarPreviewRoute.from(Repo repo) => AvatarPreviewRoute(
        repo.ownerName,
        repo.repoName,
        $extra: repo,
      );

  final String ownerName;
  final String repoName;
  final Repo? $extra;

  static const name = 'avatar';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.none(
        name: name,
        child: ProviderScope(
          overrides: [
            currentRepoParamProvider.overrideWith(
              (_) => RepoParam(
                ownerName: ownerName,
                repoName: repoName,
              ),
            ),
          ],
          child: const AvatarPreviewPage(),
        ),
      );
}

/// エラー画面
class ErrorRoute extends GoRouteData {
  const ErrorRoute(
    this.error,
  );

  final Exception? error;

  static const name = 'error';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
        name: name,
        child: ErrorPage(error: error),
      );
}

/// ルートオブザーバー
///
/// 画面のpush/popのイベント検知に使用する。ダイアログは検知したく
/// ないのでModalRouteではなくPageRouteにしている
final pageRouteObserver = PageRouteObserver();

/// RouteAware ではなくて PageRouteAware を扱える RouteObserver
///
/// RouteObserver とほぼ実装は同じ
class PageRouteObserver extends NavigatorObserver {
  final Map<PageRoute<void>, Set<PageRouteAware>> _listeners = <PageRoute<void>, Set<PageRouteAware>>{};

  @visibleForTesting
  bool debugObservingRoute(PageRoute<void> route) {
    late bool contained;
    assert(
      () {
        contained = _listeners.containsKey(route);
        return true;
      }(),
    );
    return contained;
  }

  void subscribe(PageRouteAware routeAware, PageRoute<void> route) {
    final subscribers = _listeners.putIfAbsent(route, () => <PageRouteAware>{});
    if (subscribers.add(routeAware)) {
      routeAware.didPush();
    }
  }

  void unsubscribe(PageRouteAware routeAware) {
    final routes = _listeners.keys.toList();
    for (final route in routes) {
      final subscribers = _listeners[route];
      if (subscribers != null) {
        subscribers.remove(routeAware);
        if (subscribers.isEmpty) {
          _listeners.remove(route);
        }
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute<void> && previousRoute is PageRoute<void>) {
      final previousSubscribers = _listeners[previousRoute]?.toList();

      if (previousSubscribers != null) {
        for (final routeAware in previousSubscribers) {
          routeAware.didPopNext(route);
        }
      }

      final subscribers = _listeners[route]?.toList();

      if (subscribers != null) {
        for (final routeAware in subscribers) {
          routeAware.didPop(previousRoute);
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute<void> && previousRoute is PageRoute<void>) {
      final previousSubscribers = _listeners[previousRoute];

      if (previousSubscribers != null) {
        for (final routeAware in previousSubscribers) {
          routeAware.didPushNext(route);
        }
      }
    }
  }
}

/// RouteAware の I/F に遷移元/遷移先の Route を加えた I/F
abstract class PageRouteAware {
  void didPopNext(Route<dynamic> nextRoute) {}
  void didPush() {}
  void didPop(Route<dynamic> previousRoute) {}
  void didPushNext(Route<dynamic> nextRoute) {}
}

/// デフォルトのTransitionPage
class TransitionPage extends CustomTransitionPage<void> {
  const TransitionPage({
    required String name,
    required super.child,
    required super.transitionsBuilder,
    super.transitionDuration,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.key,
    super.arguments,
    super.restorationId,
  }) : super(name: name);

  factory TransitionPage.none({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _noneTransitionsBuilder,
      );

  factory TransitionPage.fade({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _fadeTransitionsBuilder,
      );

  static Widget _fadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  static Widget _noneTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}
