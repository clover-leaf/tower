part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState({
    required this.soundOn,
    required this.bestScore,
    required this.countryRank,
    required this.openCountry,
  });

  final bool soundOn;
  final int bestScore;
  final Map<String, int> countryRank;
  final List<String> openCountry;

  SettingState copyWith({
    bool? soundOn,
    int? bestScore,
    Map<String, int>? countryRank,
    List<String>? openCountry,
  }) {
    return SettingState(
      soundOn: soundOn ?? this.soundOn,
      bestScore: bestScore ?? this.bestScore,
      countryRank: countryRank ?? this.countryRank,
      openCountry: openCountry ?? this.openCountry,
    );
  }

  @override
  List<Object> get props => [soundOn, bestScore, countryRank, openCountry];
}
