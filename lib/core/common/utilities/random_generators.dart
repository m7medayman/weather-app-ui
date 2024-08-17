    import 'dart:math';
class RandomGenerator{
static int getRand(int min, int max) {
    return min + Random().nextInt(max - min);
  }}