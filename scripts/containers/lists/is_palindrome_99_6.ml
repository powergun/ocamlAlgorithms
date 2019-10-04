#!/usr/bin/env ocaml

(* 
TODO: can I avoid calling List.rev??
*)
let rec palin xs = List.rev xs = xs

let runDemos () = 
  let sut = [1; 2; 1; 2; 1]
  and sut' = [3; 1; 4] in
  assert(palin sut);
  assert(palin sut' = false);
  ;;

runDemos();;