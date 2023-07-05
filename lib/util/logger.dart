import 'package:roggle/roggle.dart';
import 'package:universal_platform/universal_platform.dart';

final logger = Roggle(
  printer: SinglePrettyPrinter(
    loggerName: '[APP]',
    // warning 以上のときはスタックトレースを出力する
    stackTraceLevel: Level.warning,
    // iOS はカラー非対応
    colors: !UniversalPlatform.isIOS,
    // ログが長くなるので非表示
    printLocation: false,
  ),
  output: _AssertionOutput(),
);

class _AssertionOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    super.output(event);

    // wtf 以上のときは処理を停止する
    if (event.level.index >= Level.wtf.index) {
      throw AssertionError('Stopped by logger.');
    }
  }
}
