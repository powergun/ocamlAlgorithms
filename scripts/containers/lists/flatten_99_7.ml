#!/usr/bin/env ocaml

(* 

*)

type 'a node =
  | One of 'a 
  | Many of 'a node list;;

let flattern xs = 
  let rec flattern' acc = function
    | [] -> acc
    | One x :: xs -> flattern' (x :: acc) xs  (* flattern one and concat*)
    | Many ns :: xs -> flattern' (flattern' acc ns) xs  (* flattern all recursively *)
  in
    List.rev (flattern' [] xs);
  ;;

let runDemos () = 
  let sut = [ One "a" ; Many [ One "b" ; Many [ One "c" ; One "d" ] ; One "e" ] ]
  and expected = ["a"; "b"; "c"; "d"; "e"] in
  assert(expected = flattern sut);
  ;;

runDemos();;
