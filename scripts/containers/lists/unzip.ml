#!/usr/bin/env coretop

open Base;;
open Stdio;;

let demoUnzip () =
  let (ints, strings) = List.unzip [(1,"one"); (2,"two"); (3,"three")] in
  let _ = List.map ints (fun i -> printf "%d " i) in 
  let _ = List.map strings (fun s -> printf "%s " s) in
  ();
  ;;

let runDemos () = 
  demoUnzip()
  ;;

runDemos();;