part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int ranInt;

  ChangeThemeEvent({required this.ranInt});

  ChangeThemeEvent copyWith({
    int? ranInt,
  }) {
    return ChangeThemeEvent(
      ranInt: ranInt ?? this.ranInt,
    );
  }

  @override
  String toString() => 'ChangeThemeEvent(ranInt: $ranInt)';

  @override
  List<Object> get props => [ranInt];
}
