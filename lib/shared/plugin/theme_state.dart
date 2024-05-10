
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  
  const ThemeState({
    required this.lightMode,
  });

  final bool lightMode;

  ThemeState copyWith({
    bool? lightMode,
  }) {
    return ThemeState(
      lightMode: lightMode ?? this.lightMode,
    );
  }

  @override
  List<Object> get props => [lightMode];
}