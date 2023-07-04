/// ドメイン例外
abstract class DomainException implements Exception {
  const DomainException(this.message);

  final String message;
}

class ValidatorException extends DomainException {
  const ValidatorException._([
    super.message = 'validator exception',
    String? code,
    this.target,
  ]) : code = code ?? codeUnknown;

  /// 引数が不正
  factory ValidatorException.invalidArgument([String? target]) => ValidatorException._(
        'Invalid argument',
        codeInvalidArgument,
        target,
      );

  // エラーコードの定義
  static const codeInvalidArgument = 'invalid-argument';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  /// 対象
  final String? target;

  @override
  String toString() => 'ValidatorException: $message';
}
