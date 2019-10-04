#!/usr/bin/env ocaml

let consec_dedup xs = 
  xs;
  ;;

let runDemos () = 
  let sut = [1; 2; 1; 1; 1; 1; 1; 5; 6; 8; 8] in
  assert(consec_dedup sut = [1; 2; 1; 5; 6; 8]);
  ;;

runDemos();;