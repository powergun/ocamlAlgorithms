#!/usr/bin/env ocaml

(* 
Standard library provides
List.length
*)

(* NOT tail recursive!! *)
let rec size = function
  | [] -> 0
  | x :: xs -> 1 + size xs

let rec size_tl sz = function
  | [] -> sz
  | x :: xs -> size_tl (sz + 1) xs

let runDemos () = 
  let sut = [3; 1; 4; 1; 5; 9; 2; 6; 5; 3; 5; 8; 9; 7] in
  assert(size sut = 14);
  assert(size_tl 0 sut = 14);
  assert(List.length sut = size_tl 0 sut);
  ;;

runDemos();;
