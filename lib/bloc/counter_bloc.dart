import 'dart:async';

import 'bloc.dart';

class CounterBloc extends Bloc {

  int counter = 0;

  //StreamController
  final _streamController = StreamController<int>();

  //Entrées
  Sink<int> get sink => _streamController.sink;

  //Sorties

  //Logique de travail
  incrementCounter(){
    counter += 1;
    sink.add(counter);
  }

  //Fermeture du bloc
  @override
  dispose() => _streamController.close();

}