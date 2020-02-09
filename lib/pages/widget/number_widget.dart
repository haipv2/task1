import 'package:flutter/material.dart';
import '../../common/const.dart';
import '../../models/number.dart';



class NumberWidget extends StatelessWidget {
  final Number number;
  final double width,height;


  NumberWidget(this.number,this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: number.color,
      child: Center(
        child: Text('${number.number}', style: SMALL_TEXT_STYLE,),
      ),
    );
  }
}




