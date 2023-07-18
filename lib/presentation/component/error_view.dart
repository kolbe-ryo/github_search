import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/exceptions.dart';
import '../../../util/logger.dart';

/// エラーView
///
/// エラーを画面上に表示する
class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
    this.stackTrace,
  });

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    logger.e('An error has occurred.', error, stackTrace);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset(
          //   Assets.lottie.error,
          //   width: 200,
          // ),
          const Gap(8),
          Text(
            error.errorMessage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(40),
        ],
      ),
    );
  }
}

extension ObjectHelper on Object {
  /// エラーメッセージを返す
  String get errorMessage {
    if (this is NetworkException) {
      final error = this as NetworkException;
      // switch (error.code) {
      //   case NetworkException.codeBadRequest:
      //     return i18n.networkExceptionMessage.badRequest;
      //   case NetworkException.codeBadCredentials:
      //     return i18n.networkExceptionMessage.badCredentials;
      //   case NetworkException.codeMaximumNumberOfLoginAttemptsExceeded:
      //     return i18n.networkExceptionMessage.maximumNumberOfLoginAttemptsExceeded;
      //   case NetworkException.codeNotFound:
      //     return i18n.networkExceptionMessage.notFound;
      //   case NetworkException.codeValidationFailed:
      //     return i18n.networkExceptionMessage.validationFailed;
      //   case NetworkException.codeServiceUnavailable:
      //     return i18n.networkExceptionMessage.serviceUnavailable;
      //   case NetworkException.codeUnknown:
      //     return i18n.networkExceptionMessage.unknown;
      //   case NetworkException.codeNoInternetConnection:
      //     return i18n.networkExceptionMessage.noInternetConnection;
      // }
    }
    return toString();
  }
}
