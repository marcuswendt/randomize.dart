/**
      _____  __  _____  __     ____
     / ___/ / / /____/ / /    /    \   physics.dart
    / ___/ /_/ /____/ / /__  /  /  /   (c) 2014, FIELD. All rights reserved.
   /_/        /____/ /____/ /_____/    http://www.field.io

   Created by Marcus Wendt on 23/03/2014
   
*/
library randomize;

import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';


// static global versions
Math.Random _rng = new Math.Random(0);
int _seed = 0;

/**
 * Sets the random seed used for all operations.
 * Passing seed=0 randomizes the seed based on the current time.
 */
set seed(int seed) {
 if(seed == 0)
   seed = new DateTime.now().millisecond;

 _seed = seed;
 _rng = new Math.Random(seed);
}

int get seed => _seed;

/** Alias for seed = 0 */
randomize() => seed = 0;

/** returns a random normal between -scale, scale */
double n([double scale=1.0]) => (_rng.nextDouble() * 2.0 - 1.0) * scale;

/** returns a random double between min, max */
double d([double a=0.0, double b=1.0]) {
  var min = Math.min(a, b);
  var max = Math.max(a, b);
  return _rng.nextDouble() * (max - min) + min;
}

/** returns a random integer between min (inclusive) and max (exclusive) */
int i([int a=0, int b=2]) {
  if(a == b) return a;
  var min = Math.min(a, b);
  var max = Math.max(a, b);
  return _rng.nextInt(max - min) + min; 
}

/** returns a random angle on a circle */
double circle() => _rng.nextDouble() * Math.PI * 2.0;

/** returns a new Vector3 with random values in the given dimensions */
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

/** returns a random item from the given list */
Object pick(List list) {
  switch(list.length) {
    case 0: return null;
    case 1: return list[0];
    default: 
      return list[i(0, list.length)];
  }
}