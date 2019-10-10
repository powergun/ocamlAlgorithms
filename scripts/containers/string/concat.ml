#!/usr/bin/env coretop

open Base;;
open Stdio;;

(* 
source
https://www.cs.princeton.edu/courses/archive/fall18/cos326/notes/basics.php
*)
let demoConcatOperator () =
  let a = "there is" in
  let b = " a cow" in
  printf "%s\n" (a ^ b);
  ;;

let demoConcatFunction () =
  let a = "there is" in
  let b = " a cow" in
  printf "%s\n" (String.concat ~sep:"-" [a;b;"set w23";"///"]);
  ;;

let runDemos () = 
  demoConcatOperator();
  demoConcatFunction();
  ;;

runDemos();;

