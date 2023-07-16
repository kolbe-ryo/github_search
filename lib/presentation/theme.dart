// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider.family<ThemeData, Brightness>(
  (ref, brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: brightness,
        primarySwatch: Colors.grey,
      ),
      // fontFamily: FontFamily.murecho,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  },
);
