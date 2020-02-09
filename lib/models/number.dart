import 'dart:math';
import 'dart:ui';

class Number {
  int number = 0;
  static Random random = new Random();
  Color color = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}
