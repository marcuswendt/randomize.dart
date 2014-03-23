/**
      _____  __  _____  __     ____
     / ___/ / / /____/ / /    /    \   physics.dart
    / ___/ /_/ /____/ / /__  /  /  /   (c) 2014, FIELD. All rights reserved.
   /_/        /____/ /____/ /_____/    http://www.field.io

   Created by Marcus Wendt on 23/03/2014
   
*/
import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';


// static global versions
Math.Random _rng = new Math.Random(0);

seed(int seed) => _rng = new Math.Random();

/** returns a random normal between -scale, scale */
double n([double scale=1.0]) => (_rng.nextDouble() * 2.0 - 1.0) * scale;

/** returns a random double number between min, max */
double d([double min=0.0, double max=1.0]) => _rng.nextDouble() * (max - min) + min;

/** returns a random integer number between min, max */
int i([int min=0, int max=1]) => _rng.nextInt(max - min) + min;

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
