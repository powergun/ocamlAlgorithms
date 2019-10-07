#!/usr/bin/env ocaml

(* 
https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html

List.exists, List.mem are total
*)
assert(false = List.mem 123 [1;2;3]);;
assert(false = List.exists (fun i -> i > 5) []);;
