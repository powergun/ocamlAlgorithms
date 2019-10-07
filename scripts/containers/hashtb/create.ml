#!/usr/bin/env ocaml

let print_ht ht = 
  Hashtbl.iter (fun k v -> Printf.printf "%d = %s\n" k v) ht

let demoCreate () =
  let ht = Hashtbl.create 100 in
  Hashtbl.add ht 0 "prod";
  Hashtbl.add ht 1 "dev";
  print_ht ht;
  ;;

let runDemos () = 
  demoCreate();
  ;;

runDemos();;

