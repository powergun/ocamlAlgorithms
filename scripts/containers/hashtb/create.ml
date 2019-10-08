#!/usr/bin/env ocaml

let print_ht ht = 
  Hashtbl.iter (fun k v -> Printf.printf "%d = %s\n" k v) ht

(* 
seems slightly nicer if the lambda function is really long

Hashtbl.iter
  (fun k v ->
    impl...
  )
  ht
*)

(* 
Hashtbl.find only retrieves the last value; find_all will retrieve
all the values;
iter on the other hand, visits all the values as shown below
*)
let demoCreate () =
  let ht = Hashtbl.create 100 in
  Hashtbl.add ht 0 "prod";
  Hashtbl.add ht 0 "prod-cn";
  Hashtbl.add ht 1 "dev";
  print_ht ht;
  ;;

let runDemos () = 
  demoCreate();
  ;;

runDemos();;

