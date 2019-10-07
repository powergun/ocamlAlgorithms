#!/usr/bin/env ocaml

let print_ilist l = 
  List.iter (fun v -> Printf.printf "%d " v) l; print_endline "";;

let runDemos () = 
  print_ilist (List.sort compare [3; 1; 4; 1; 5; 9; 2; 6]);
  ;;

runDemos();;