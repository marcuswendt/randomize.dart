import 'dart:math';

/**
 * Utility class to help with random number generation of various sorts
 */
class Randomize
{
  int _seed;
  Random _rng;
  
  Randomize(this._seed) {
    _rng = new Random(_seed);  
  }
  
  double normal([double scale=1.0]) => (_rng.nextDouble() * 2.0 - 1.0) * scale;
  
  double randd([double min=0.0, double max=1.0]) => _rng.nextDouble() * (max - min) + min;  
  
  int randi([int min=0, int max=1]) => _rng.nextInt(max - min) + min;  
    
  bool flipCoin([double chance = 0.5]) => _rng.nextDouble() < chance;
  
  int get seed => _seed;
}