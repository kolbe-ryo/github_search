// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/url_launcher/exception/url_launcher_exception.dart';
import '../application/url_launcher/state/url_launch_data.dart';
import '../application/url_launcher/state/url_launch_result.dart';
import '../util/extention.dart';
import '../util/logger.dart';
import 'theme.dart';

class GitHubSearchApp extends StatelessWidget {
  const GitHubSearchApp({
    super.key,
    this.home,
  });

  /// 初期表示画面（テスト用）
  @visibleForTesting
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    // TODO TranslationProvider
    return _GitHubSearchApp(home);
  }
}

class _GitHubSearchApp extends ConsumerWidget {
  const _GitHubSearchApp(this.home);

  final Widget? home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    // URL起動状態を監視してエラーが起きたらSnackBarを表示する
    // どの画面でURL起動してもここで一括でエラーハンドリングできるようにしている
    ref.listen<AsyncValue<UrlLaunchData?>>(
      urlLaunchResultProvider,
      (previous, next) {
        logger.i('Updated UrlLaunchData: $next');
        next.whenError((error, stackTrace) {
          if (error is! UrlLauncherException) {
            return;
          }
          // エラーの場合snackbarを表示する
          scaffoldMessengerKey.currentState!.showSnackBar(
            const SnackBar(
              content: Text(
                // TODO: l18n
                // i18n.cantLaunchUrl(url: error.data.urlString),
                'Fail to launch url ><',
              ),
            ),
          );
        });
      },
    );

    final lightTheme = ref.watch(themeProvider(Brightness.light));
    final darkTheme = ref.watch(themeProvider(Brightness.dark));

    if (home != null) {}

    return Container();
  }
}
