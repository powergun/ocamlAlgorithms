#!/usr/bin/env ocaml

(* 
*)
let split xs n = 
  let rec split' acc count = function
    | [] -> (acc, [])
    | x :: xs -> if count = 0 then 
                   (acc, x :: xs) 
                 else
                   split' (x :: acc) (count - 1) xs in
  let (left, right) = split' [] n xs in
  ((List.rev left), right)
  ;;

let runDemos () = 
  let sut = ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] in 
  assert(split sut 3 = (["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"]));
  assert(split sut 0 = ([], sut));
  assert(split [] 3 = ([], []));
  ;;

runDemos();;

