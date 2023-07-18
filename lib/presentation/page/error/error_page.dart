// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../component/error_view.dart';

/// エラー画面
class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
  });

  /// 例外
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ErrorView(
          // error: error ?? i18n.errorOccurred,
          error: error ?? '',
        ),
      ),
    );
  }
}
