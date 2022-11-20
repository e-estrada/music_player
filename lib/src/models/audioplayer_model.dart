import 'package:flutter/material.dart';

class AudioPlayerModel extends ChangeNotifier {

  bool _playing = false;
  late AnimationController _controller;
  Duration _songDuration = const Duration(seconds: 0);
  Duration _current = const Duration(seconds: 0);
  
  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get porcentaje => (_songDuration.inSeconds > 0) 
    ? _current .inSeconds / _songDuration.inSeconds
    : 0;

  set controller(AnimationController valor){
    _controller = valor;
  }
  AnimationController get controller => _controller;



  set playing(bool value){
    _playing = value;
    notifyListeners();
  }
  bool get playing => _playing;



  set songDuration(Duration value){
    _songDuration = value;
    notifyListeners();
  }
  Duration get songDuration => _songDuration;



  set current(Duration value){
    _current = value;
    notifyListeners();
  }
  Duration get current => _current;



  String printDuration(Duration duration) {

    String twoDigits(int n){
      if(n >= 10) return '$n';
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

}