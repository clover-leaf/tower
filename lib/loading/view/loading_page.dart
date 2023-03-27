import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legends_club_tower/game.dart';
import 'package:legends_club_tower/loading/cubit/cubit.dart';
import 'package:legends_club_tower/loading/widgets/widgets.dart';
import 'package:legends_club_tower/gen/assets.gen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<void> onPreloadComplete(BuildContext context) async {
    final navigator = Navigator.of(context);
    await Future<void>.delayed(AnimatedProgressBar.intrinsicAnimationDuration);
    if (!mounted) {
      return;
    }
    await navigator.push(GamePage.route());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreloadCubit, PreloadState>(
      listenWhen: (prevState, state) =>
          !prevState.isComplete && state.isComplete,
      // listener: (context, state) => {},
      listener: (context, state) => onPreloadComplete(context),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Assets.images.bg.image(fit: BoxFit.cover),
            Center(
              child: _LoadingInternal(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingInternal extends StatelessWidget {
  const _LoadingInternal();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreloadCubit, PreloadState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text('Legends Club Tower',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnimatedProgressBar(
                progress: state.progress,
                backgroundColor: Color(0xff5B5B5B),
                foregroundColor: Color(0xff00F3C1),
              ),
            ),
            SizedBox(height: 24),
            Text('${(state.progress * 100).round()}%',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                  color: Colors.white,
                )),
          ],
        );
      },
    );
  }
}
