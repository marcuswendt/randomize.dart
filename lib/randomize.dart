/**
 * Utility methods to help with random number generation of various sorts.
 */
import 'dart:math';
import 'package:vector_math/vector_math.dart';


// static global versions
Random _rng = new Random(0);

seed(int seed) => _rng = new Random();

/** returns a random normal between -scale, scale */
double n([double scale=1.0]) => (_rng.nextDouble() * 2.0 - 1.0) * scale;

/** returns a random double number between min, max */
double d([double min=0.0, double max=1.0]) => _rng.nextDouble() * (max - min) + min;

/** returns a random integer number between min, max */
int i([int min=0, int max=1]) => _rng.nextInt(max - min) + min;

Vector3 v3([double min=0.0, double max=1.0, Vector3 value=null]) {
  if(value == null)
    value = new Vector3.zero();
  
  double range = max - min;
  
  return value.setValues(
      _rng.nextDouble() * range + min,
      _rng.nextDouble() * range + min,
      _rng.nextDouble() * range + min
  );
}

/** returns true/ false based on a given chance */
bool flipCoin([double chance = 0.5]) => _rng.nextDouble() < chance;
