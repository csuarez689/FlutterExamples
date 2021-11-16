import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioPlayerModel(),
      child: Scaffold(
        body: Stack(
          children: [
            _Backgroud(),
            Column(
              children: [
                CustomAppBar(),
                _DiskContainer(),
                _ControlContainer(),
                Expanded(
                  child: _LyricContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DiskContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _DiskImage(),
          _ProgressBar(),
        ],
      ),
    );
  }
}

class _DiskImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apm = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SpinPerfect(
              duration: Duration(milliseconds: 2000),
              infinite: true,
              manualTrigger: true,
              controller: (controller) => apm.playController = controller,
              child: Image.asset('assets/aurora.jpg'),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xff484750), Color(0xff1E1C24)],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apm = Provider.of<AudioPlayerModel>(context);
    return Container(
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${apm.totalDuration}'),
          const SizedBox(height: 10),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: apm.progress * 230,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text('${apm.currentDuration}'),
        ],
      ),
    );
  }
}

class _ControlContainer extends StatefulWidget {
  @override
  State<_ControlContainer> createState() => _ControlContainerState();
}

class _ControlContainerState extends State<_ControlContainer> with SingleTickerProviderStateMixin {
  bool fstTime = true;
  late AnimationController playAnimationController;
  final asAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    playAnimationController.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
    asAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'));
    asAudioPlayer.currentPosition.listen((duration) => audioPlayerModel.current = duration);
    asAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio != null ? playingAudio.audio.duration : const Duration(milliseconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white.withOpacity(0.6);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Song title is very large', style: TextStyle(fontSize: 25, overflow: TextOverflow.ellipsis, color: textColor)),
                const SizedBox(height: 5),
                Text('Artist name', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis, color: textColor)),
              ],
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: playAnimationController),
            onPressed: () {
              final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
              if (fstTime) {
                fstTime = false;
                open();
              } else {
                asAudioPlayer.playOrPause();
              }
              if (asAudioPlayer.isPlaying.value) {
                playAnimationController.reverse();
                audioPlayerModel.playController.stop();
              } else {
                playAnimationController.forward();
                audioPlayerModel.playController.repeat();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _LyricContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        diameterRatio: 2,
        itemExtent: 45,
        children: getLyrics()
            .map((i) => Text(i,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.4),
                )))
            .toList(),
      ),
    );
  }
}

class _Backgroud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.68,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
          ],
        ),
      ),
    );
  }
}
