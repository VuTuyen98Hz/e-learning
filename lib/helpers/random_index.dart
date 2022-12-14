import 'dart:math';

int randomIndex({int min = 0, int max = 1})
{
  Random random = Random();
  return min + random.nextInt(max - min);
}