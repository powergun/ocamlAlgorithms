#!/usr/bin/env ocaml

let coprime a b =
  let rec gcd a b = if b = 0 then a else gcd b (a mod b) in
  gcd a b = 1;
  ;;

let runDemos () = 
  assert(coprime 13 27);
  assert(not (coprime 20536 7826));
  ;;

runDemos();;
