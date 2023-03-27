import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_club_tower/app/app.dart';

class CollectionOverlay extends StatelessWidget {
  const CollectionOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final openCountry =
        context.select((SettingCubit cubit) => cubit.state.openCountry);
    final countryRank =
        context.select((SettingCubit cubit) => cubit.state.countryRank);

    return Material(
        color: Colors.transparent,
        child: Column(
          children: [
            // Country(

            // ),
          ],
        ));
  }
}

class Country extends StatelessWidget {
  const Country({
    super.key,
    required this.name,
    required this.flag,
    required this.rank,
  });

  final Widget flag;
  final String name;
  final String rank;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
