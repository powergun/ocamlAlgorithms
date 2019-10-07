#!/usr/bin/env ocaml

(* 
List.iteri passes the index of each element to f
*)
let print_ilist = function 
  | x :: _ as l -> 
    List.iter (fun v -> Printf.printf "%d " v) l;
    print_endline "";
  | _ -> ()
  ;;

let runDemos () = 
  print_ilist [1; 2; 3; 13123];
  print_ilist [];
  ;;

runDemos();;