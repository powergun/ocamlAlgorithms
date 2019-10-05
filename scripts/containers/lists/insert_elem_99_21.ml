#!/usr/bin/env ocaml

(* 
x :: xs as l
l refers to (x :: xs), the entire list
xs refers the tail, commonly labelled as t
x is the head, commonly labelled as h

*)
let rec insert_at needle index = function 
  | [] -> [needle]
  | x :: xs as l -> if index <= 0 then 
                      needle :: l
                    else 
                      x :: insert_at needle (index - 1) xs
  ;;

let runDemos () = 
  assert(insert_at "alfa" 1 ["a";"b";"c";"d"] = ["a"; "alfa"; "b"; "c"; "d"]);
  assert(insert_at "alfa" 3 ["a";"b";"c";"d"] = ["a"; "b"; "c"; "alfa"; "d"]);
  assert(insert_at "alfa" 4 ["a";"b";"c";"d"] = ["a"; "b"; "c"; "d"; "alfa"]);
  assert(insert_at "alfa" 14 ["a";"b";"c";"d"] = ["a"; "b"; "c"; "d"; "alfa"]);
  assert(insert_at "alfa" (-2) ["a";"b";"c";"d"] = ["alfa"; "a"; "b"; "c"; "d"]);
  ;;

runDemos();;
