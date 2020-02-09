import 'package:rxdart/rxdart.dart';

import '../models/number.dart';

class HomeBloc {

  final _homeController = BehaviorSubject<Number>();

  //Stream
  Stream<Number> get numberStream => _homeController.stream;


  //Sink
  Function(Number) get doIncreaseNumber  => _homeController.sink.add;


  void dispose() async {
    await _homeController?.close();
  }
}
