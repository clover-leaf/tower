import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(
          SettingState(
              soundOn: true,
              bestScore: 0,
              countryRank: const <String, int>{},
              openCountry: const <String>[]),
        );

  final _player = AudioPlayer();
  late final SharedPreferences prefs;

  Future<void> initial() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    _player
      ..play(AssetSource('audio/background.mp3'), volume: 1)
      ..pause();
    prefs = await SharedPreferences.getInstance();
    final soundOn = prefs.getBool('soundOn');
    final bestScore = prefs.getInt('bestScore');
    final openCountry = prefs.getStringList('openCountry');

    if (soundOn ?? true) {
      _player.resume();
    }
    String data = await rootBundle.loadString('assets/json/country.json');
    final countryRank = jsonDecode(data) as Map<String, dynamic>;
    final convert = {
      for (final key in countryRank.keys) key: countryRank[key] as int
    };

    emit(
      state.copyWith(
        soundOn: soundOn,
        bestScore: bestScore,
        countryRank: convert,
        openCountry: openCountry,
      ),
    );
  }

  Future<void> toogleAudio() async {
    if (state.soundOn) {
      await prefs.setBool('soundOn', !state.soundOn);
      await _player.stop();
    } else {
      await prefs.setBool('soundOn', !state.soundOn);
      await _player.resume();
    }
    emit(state.copyWith(soundOn: !state.soundOn));
  }

  Future<void> saveNewBestScore(int bestScore) async {
    await prefs.setInt('bestScore', bestScore);
    emit(state.copyWith(bestScore: bestScore));
  }
}
