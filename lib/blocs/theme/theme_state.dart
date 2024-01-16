part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;
  static AppTheme fromJson(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final AppTheme appTheme;

  ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object?> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'appTheme': appTheme.toJson()});

    return result;
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      appTheme: AppTheme.fromJson(json['appTheme']),
    );
  }
}
