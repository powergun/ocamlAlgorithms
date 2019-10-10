#!/usr/bin/env coretop

open Base;;
open Stdio;;

let demoSplit () =
  let s = "thereisacow" in
  match String.split s ~on:'i' with
  | [hd;tl] -> printf "%s/%s\n" hd tl
  | _ -> ()
  ;;

let runDemos () = 
  demoSplit();
  ;;

runDemos();;