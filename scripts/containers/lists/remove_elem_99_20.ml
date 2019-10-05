#!/usr/bin/env ocaml

(* 
20/99
remove k-th element in the list
*)
let remove xs k = 
  let rec remove' index acc = function
    | [] -> List.rev acc
    | x :: xs -> if index = k then
                   remove' (index + 1) (List.rev acc) xs
                 else
                   remove' (index + 1) (x :: acc) xs
  in
    remove' 0 [] xs;
  ;;

(* 
example on the website, which is better!
the recursion is to count from n to 0, while it keeps popping and inserting the element
*)
let rec remove_at n = function
  | [] -> []
  | h :: t -> if n = 0 then t else h :: remove_at (n - 1) t;;

let runDemos () = 
  let sut' = ["a";"b";"c";"d"] in 
  assert(remove sut' 1 = ["a"; "c"; "d"]);
  assert(remove_at 1 sut' = ["a"; "c"; "d"]);
  ;;

runDemos();;