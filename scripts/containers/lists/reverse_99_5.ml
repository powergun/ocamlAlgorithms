#!/usr/bin/env ocaml

(* 
List.rev
*)

let rec reverse acc = function
  | [] -> acc
  | x :: xs -> reverse (x :: acc) xs

let runDemos () = 
  let sut' = [3; 1; 4] in
  assert([4; 1; 3] = reverse [] sut');
  assert(List.rev sut' = reverse [] sut');
  ;;

runDemos();;