#!/usr/bin/env ocaml

(* 
see also consecutive module
*)

type 'a rle =
  | One of 'a
  | Many of int * 'a;;

let encode xs = 
  let toNode count x = if count = 0 then One x else Many (count + 1, x) in
  let rec encode' count acc = function
    | [] -> []
    | [x] -> toNode count x :: acc
    | p :: (x :: _ as xs) -> if p = x then encode' (count + 1) acc xs
                             else encode' 0 (toNode count p :: acc) xs
  in
    List.rev (encode' 0 [] xs)
  ;;

let runDemos () = 
  let sut = ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"] in
  assert(encode sut = [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")]);
  ;;

runDemos();;
