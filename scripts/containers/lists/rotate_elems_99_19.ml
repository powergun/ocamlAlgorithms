#!/usr/bin/env ocaml

(* 
note the example on the website
https://ocaml.org/learn/tutorials/99problems.html
uses a split-based algorithm 
I don't like its calling List.length
but List.length does not throw exception
*)

let concat s1 s2 =
  let rec prepend' right = function
    | [] -> right
    | x :: xs -> prepend' (x :: right) xs in
  prepend' s2 (List.rev s1)
  ;;

let rotateN xs n =
  let rec rot' count seq = function
    | [] -> (seq, [])
    | x :: xs -> if count = 0 then 
                   (seq, x :: xs) 
                 else
                   rot' (count - 1) (x :: seq) xs in
  let (rightRev, left) = rot' n [] xs in
  concat left (List.rev rightRev);
  ;;

let runDemos () = 
  let seq1 = [1; 2; 3] in
  let seq2 = [7; 8; 9] in
  let sut = [9; 1; 2; 3; 4] in
  let sut' = ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] in
  assert(concat seq1 seq2 = [1; 2; 3; 7; 8; 9]);
  assert(rotateN sut 2 = [2; 3; 4; 9; 1]);
  assert(rotateN sut' 3 = ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]);
  ;;

runDemos();;
