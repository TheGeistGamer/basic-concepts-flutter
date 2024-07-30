// Estado para manejar el dark mode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/src/config/theme/app_theme.dart';

final isDarkModeProvier = StateProvider<bool>((ref) => false);

// Valores inmutables
final colorListProvider = Provider((ref) => colorList);

// Manter una pieza de estado
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom) -- objetos mas complejos
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectColor: colorIndex);
  }
}
