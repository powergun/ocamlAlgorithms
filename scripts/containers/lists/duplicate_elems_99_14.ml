#!/usr/bin/env ocaml

let rec duplicate = function
  | [] -> []
  | x :: xs -> x :: x :: duplicate xs

(* 
replicate the elements of a list N times
*)
let duplicateN n xs =
  let rec prepend count acc x =
    if count = 0 then acc else prepend (count - 1) (x :: acc) x in
  let rec dup acc = function
    | [] -> acc
    | x :: xs -> dup (prepend n acc x) xs in
  dup [] (List.rev xs)
  ;;

let runDemos () = 
  assert(duplicate [1; 2; 3] = [1; 1; 2; 2; 3; 3]);
  assert(duplicateN 3 [1; 2; 3] = [1; 1; 1; 2; 2; 2; 3; 3; 3]);
  ;;

runDemos();;