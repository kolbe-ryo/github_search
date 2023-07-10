// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'url_launch_data.dart';

final urlLaunchResultProvider = StateProvider<AsyncValue<UrlLaunchData?>>(
  (ref) => const AsyncValue.data(null),
);
