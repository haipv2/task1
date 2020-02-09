import 'package:flutter/material.dart';

import '../blocs/home_bloc.dart';
import '../common/const.dart';
import '../models/number.dart';
import 'widget/number_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;
  List<Number> listNumberModel = [];

  @override
  void initState() {
    super.initState();
    _homeBloc = new HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    var listNumber = Expanded(
      flex: 3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Number number = Number();
          return Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 3, left: 3),
            child: InkWell(
              onTap: () {
                _homeBloc.doIncreaseNumber(number);
              },
              child: StreamBuilder<Number>(
                  stream: _homeBloc.numberStream,
                  builder: (context, snapshot) {
                    return NumberWidget(
                        number, BOX_SIZE_WIDTH, BOX_SIZE_HEIGHT);
                  }),
            ),
          );
        },
      ),
    );

    var displayNumber = Expanded(
      flex: 7,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: StreamBuilder<Number>(
            stream: _homeBloc.numberStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.only(top: 20, bottom: 180),
                  child: InkWell(
                    onTap: (){
                      snapshot.data.number++;
                      _homeBloc.doIncreaseNumber(snapshot.data);
                    },
                    child: NumberWidget(
                      snapshot.data,
                      BOX_SIZE_WIDTH * 2,
                      BOX_SIZE_HEIGHT,
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(top: 20, bottom: 180),
                  child: Text(''),
                );
              }
            }),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[listNumber, displayNumber],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc?.dispose();
  }
}
