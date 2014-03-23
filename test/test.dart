import 'package:randomize/randomize.dart' as rand;


main(List<String> args)
{
  var i;
  
  rand.seed();
  
  i = rand.i();
  print("rand: $i");
    
  i = rand.i(1, 0);
  print("rand 1-0: $i");
  
  i = rand.i(2, 0);
  print("rand 2-0: $i");
  
  i = rand.i(3, 0);
  print("rand 3-0: $i");
  
  i = rand.i(0, 3);
  print("rand 0-3: $i");
    
  i = rand.i(0, 10);
  print("rand 0-10: $i");
}
