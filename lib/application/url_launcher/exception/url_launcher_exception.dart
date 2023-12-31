// Project imports:
import '../../../domain/exceptions.dart';
import '../state/url_launch_data.dart';

class UrlLauncherException extends DomainException {
  const UrlLauncherException(
    this.data, [
    this.details,
    this.stacktrace,
  ]) : super('UrlLauncher exception');

  /// URL起動データ
  final UrlLaunchData data;

  /// 例外
  final dynamic details;

  /// スタックトレース
  final StackTrace? stacktrace;

  @override
  String toString() => 'UrlLauncherException(data: $data, details: $details, stacktrace: $stacktrace)';
}
