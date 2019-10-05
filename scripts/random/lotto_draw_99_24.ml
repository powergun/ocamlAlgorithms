#!/usr/bin/env ocaml

(* 
Lotto: Draw N different random numbers from the set 1..M.
*)

let range n m = 
  let rec ranI n m acc = if n <= m then ranI (n + 1) m (n :: acc) else acc in
  let rec ranD n m acc = if n >= m then ranD (n - 1) m (n :: acc) else acc in
  match n > m with
    | true  -> List.rev (ranD n m [])
    | false -> List.rev (ranI n m [])
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

let lotto_select n m = rand_select (range 1 m) n;;

let runDemos () = 
  lotto_select 6 49;;
  ;;

runDemos();;

