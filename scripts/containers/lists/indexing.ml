#!/usr/bin/env ocaml

let runDemos () = 
  assert(None = List.nth_opt [1] 123);
  assert(Some 1 = List.nth_opt [3; 2; 1] 2);
  ;;

runDemos();;

