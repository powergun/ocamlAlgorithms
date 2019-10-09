#!/usr/bin/env ocaml

type point2d = { x : int; y : int};;
(* 
NOTE: this will override point2d 

type point = { x : int; y : int};;

proof:
# { x = 100; y = 200 };;
- : point = {x = 100; y = 200}

*)

(* 
source:
real world ocaml P/42
how to access the record fields using pattern matching
*)
let demoCreate () =
  let p = { x = 100; y = 200 } in
  let { x = x'; y = y' } = p in
  Printf.printf "%d %d\n" x' y';

  (* field punning: real world ocaml P/42 (more concise) *)
  let { x; y } = p in
  Printf.printf "%d %d\n" x y;
  ;;
  (* use dot notation to access the field *)

let runDemos () = 
  demoCreate();
  ;;

runDemos();;
