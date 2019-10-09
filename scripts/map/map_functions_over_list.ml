#!/usr/bin/env ocaml

(* 
source:
https://www.youtube.com/watch?v=djymZspawFc

map a list of functions over a list of values
*)

let print_ilist = function 
  | x :: _ as l -> 
    List.iter (fun v -> Printf.printf "%d " v) l;
    print_endline "";
  | _ -> ()
  ;;

let fs = [(fun x -> x + 1); (fun x -> x - 1)] in 
let lst = [3; 1; 4; 1; 5; 9] in 
let r = List.map (fun x -> List.map x lst) fs in
print_ilist(List.flatten r);;
