#!/usr/bin/env ocaml

let rec last = function
  | [] -> None
  | [x] -> Some x
  | _ :: xs -> last xs
  ;;

let rec last_but_one = function
  [] | [_] -> None
  | [x; y] -> Some x
  | _ :: xs -> last_but_one xs
  ;;

let runDemos () =
  let sut = [3; 1; 4; 1; 5] in
  assert(last sut = Some 5);
  assert(last_but_one sut = Some 1);
  ;;

runDemos();;