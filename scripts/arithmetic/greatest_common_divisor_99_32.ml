#!/usr/bin/env ocaml

let rec gcd a b = if b = 0 then a else gcd b (a mod b);;

let runDemos () = 
  assert(gcd 13 27 = 1);
  assert(gcd 20536 7826 = 2);
  assert(gcd 111111 15 = 3);
  ;;

runDemos();;
