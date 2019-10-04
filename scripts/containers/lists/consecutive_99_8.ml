#!/usr/bin/env ocaml

(* 
_ as xs
explained in real world ocaml
https://v1.realworldocaml.org/v1/en/html/lists-and-patterns.html

it should be able to just return the list being matched. 
We can reduce allocation here by using an as pattern
which allows us to declare a name for the thing matched by a pattern or subpattern
*)
let rec consec_dedup = function
  | p :: (x :: _ as xs) -> if p = x then consec_dedup xs else p :: consec_dedup xs
  | smaller -> smaller;;

let consec_pack xs = 
  let rec consec_pack' acc curr = function
    | [] -> []
    | [x] -> (x :: curr) :: acc
    | p :: (x :: _ as xs) -> 
      if p = x then consec_pack' acc (x :: curr) xs 
      else consec_pack' ((p :: curr) :: acc) [] xs
  in
    List.rev (consec_pack' [] [] xs);
  ;;

(* run-length encoding *)
let rle xs =
  let rec rle' acc count = function
    | [] -> []
    | [x] -> (x, count + 1) :: acc
    | p :: (x :: _ as xs) ->
      if p = x then rle' acc (count + 1) xs
      else rle' ((p, count + 1) :: acc) 0 xs
  in
    List.rev(rle' [] 0 xs)
  ;;

let runDemos () = 
  let sut = [1; 2; 1; 1; 1; 1; 1; 5; 6; 8; 8] in
  assert(consec_dedup sut = [1; 2; 1; 5; 6; 8]);
  assert(consec_pack sut = [[1]; [2]; [1; 1; 1; 1; 1]; [5]; [6]; [8; 8]]);
  assert(rle sut = [(1, 1); (2, 1); (1, 5); (5, 1); (6, 1); (8, 2)]);
  ;;

runDemos();;