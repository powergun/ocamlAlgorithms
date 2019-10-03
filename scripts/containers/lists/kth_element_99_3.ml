#!/usr/bin/env ocaml

(* 
note, this algorithm retrieves k-th element which is different 
to indexing; the starting index in this case is 1

List.nth is partial (throw exception)
*)
let rec element k = function
  | [] -> None
  | x :: xs -> if k = 1 then Some x else element (k - 1) xs

let runDemos () = 
  let sut = [3; 1; 4; 1; 5; 9; 2; 6; 5; 3; 5; 8; 9; 7] in
  assert(Some 2 = element 7 sut);
  let n = List.nth sut 2 in
  assert(element 3 sut = Some n);
  ;;

runDemos();;
