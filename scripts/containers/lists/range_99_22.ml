#!/usr/bin/env ocaml

let range n m = 
  let rec ranI n m acc = if n <= m then ranI (n + 1) m (n :: acc) else acc in
  let rec ranD n m acc = if n >= m then ranD (n - 1) m (n :: acc) else acc in
  match n > m with
    | true  -> List.rev (ranD n m [])
    | false -> List.rev (ranI n m [])
  ;;

let runDemos () = 
  assert(range 4 9 = [4; 5; 6; 7; 8; 9]);
  assert(range 9 4 = [9; 8; 7; 6; 5; 4]);
  ;;

runDemos();;
