import 'package:client_flutter/shared/plugin/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {

  ThemeCubit(): super(const ThemeState(lightMode: true),);

  void toogleLightMode() {
    emit(
      state.copyWith(
        lightMode: !state.lightMode,
      ),
    );
  }
}