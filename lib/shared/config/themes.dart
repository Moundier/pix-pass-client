import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class ThemeCubit extends Cubit<ThemeInitialState> {

  ThemeCubit(): super(const ThemeInitialState(lightMode: true),);

  void toogleLightMode() {
    emit(
      state.copyWith(
        lightMode: !state.lightMode,
      ),
    );
  }
}

class ThemeInitialState extends Equatable {
  
  const ThemeInitialState({
    required this.lightMode,
  });

  final bool lightMode;

  ThemeInitialState copyWith({bool? lightMode, }) {
    return ThemeInitialState(lightMode: lightMode ?? this.lightMode,);
  }

  @override
  List<Object> get props => [lightMode];
}