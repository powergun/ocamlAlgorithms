#!/usr/bin/env ocaml

(* 
my implementation does not guarantee uniqueness
*)
let rand_select_ xs n = 
  let index' () = Random.int (List.length xs) in
  let rec elem' acc index = function
    | [] -> acc
    | x :: xs -> if index = 0 then x :: acc else elem' acc (index - 1) xs in
  let rec sel' acc count = function
    | [] -> acc
    | x :: _ as l -> if count = 0 then acc else sel' (elem' acc (index' ()) l) (count - 1) l
  in 
    sel' [] n xs;
  ;;

let rand_select list n =
  let rec extract acc n = function
    | [] -> raise Not_found
    | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
  in
  let extract_rand list len =
    extract [] (Random.int len) list
  in
  let rec aux n acc list len =
    if n = 0 then acc else
      let picked, rest = extract_rand list len in
      aux (n-1) (picked :: acc) rest (len-1)
  in
  let len = List.length list in
  aux (min n len) [] list len;;

let runDemos () = 
  rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3;
  ;;

runDemos();;
