// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame/cache.dart';
import 'package:flutter/widgets.dart';
import 'package:legends_club_tower/gen/assets.gen.dart';

part 'preload_state.dart';

class PreloadCubit extends Cubit<PreloadState> {
  PreloadCubit(this.images, this.audio) : super(const PreloadState.initial());

  final Images images;
  final AudioCache audio;

  /// Load items sequentially allows display of what is being loaded
  Future<void> loadSequentially() async {
    final phases = [
      PreloadPhase(
        '0',
        () => audio.loadAll([Assets.audio.background]),
      ),
      PreloadPhase(
        '1',
        () => images.loadAll([Assets.images.collection.vietnam.path]),
      ),
      PreloadPhase(
        '2',
        () async => {},
      ),
      PreloadPhase(
        '3',
        () async => {},
      ),
      PreloadPhase(
        '4',
        () async => {},
      ),
      PreloadPhase(
        '5',
        () async => {},
      ),
      PreloadPhase(
        '6',
        () async => {},
      ),
      PreloadPhase(
        '7',
        () async => {},
      ),
      PreloadPhase(
        '8',
        () async => {},
      ),
      PreloadPhase(
        '9',
        () async => {},
      ),
    ];

    emit(state.copyWith(totalCount: phases.length));
    for (final phase in phases) {
      emit(state.copyWith(currentLabel: phase.label));
      // Throttle phases to take at least 1/5 seconds
      await Future.wait([
        Future.delayed(Duration.zero, phase.start),
        Future<void>.delayed(const Duration(milliseconds: 500)),
      ]);
      emit(state.copyWith(loadedCount: state.loadedCount + 1));
    }
  }
}

@immutable
class PreloadPhase {
  const PreloadPhase(this.label, this.start);

  final String label;
  final ValueGetter<Future<void>> start;
}
