import 'package:crashzer/models.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  int currentindex=1;

  get currentIndex=>currentindex;

  void active(int i) {
    currentindex=i;
    notifyListeners();
  }
}

class AddMusic with ChangeNotifier {
  final List<Musique> _lmusic = [];
  List<Musique> get getmusic => _lmusic;

  void addwagon(Musique music) {
    _lmusic.add(music);
    notifyListeners();
  }
}