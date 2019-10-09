#!/usr/bin/env ocaml

(* 
List.init
see: https://stackoverflow.com/questions/243864/what-is-the-ocaml-idiom-equivalent-to-pythons-range-function
*)
let demoFoldSumProduct () = 
  let l = List.init 4 (fun x -> x + 1) in
  assert(24 = List.fold_left (fun acc x -> acc * x) 1 l);
  assert(11 = List.fold_left (fun acc x -> acc + x) 1 l);
  ;;

(* 
see:
https://www.youtube.com/watch?v=KiUjTObV3Io&t=45s

there are variations to the computational folding, such as:
- collect (example: collect all the even numbers)
- count (example: count-by-predicate)
- compare (example: max item)
*)

let runDemos () = 
  demoFoldSumProduct();
  ;;

runDemos();;