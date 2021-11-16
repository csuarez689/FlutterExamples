import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  late AnimationController _playController;
  Duration _songDuration = Duration(seconds: 0);
  Duration _current = Duration(seconds: 0);

  String get totalDuration => printDuration(_songDuration);
  String get currentDuration => printDuration(_current);

  double get progress => _songDuration.inSeconds > 0 ? _current.inSeconds / _songDuration.inSeconds : 0;

  AnimationController get playController => _playController;

  set playController(AnimationController value) {
    _playController = value;
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  Duration get current => _current;
  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n >= 10 ? "$n" : "0$n";

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
