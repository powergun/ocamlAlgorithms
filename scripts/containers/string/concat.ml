#!/usr/bin/env ocaml

(* 
source
https://www.cs.princeton.edu/courses/archive/fall18/cos326/notes/basics.php
*)
let demoConcatOperator () =
  let a = "there is" in
  let b = " a cow" in
  print_endline (a ^ b);
  ;;

let runDemos () = 
  demoConcatOperator();
  ;;

runDemos();;

