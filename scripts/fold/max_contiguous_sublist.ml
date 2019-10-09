#!/usr/bin/env ocaml

(* 
source:
(last example)
https://www.youtube.com/watch?v=KiUjTObV3Io&t=45s
*)

let max_consub l =
  let f (max_so_far, max_current) elem =
    let max_so_far' = max max_so_far (max_current + elem) in
    let max_current' = if max_current < 0 then 0 else max_current in
    (max_so_far', max_current' + elem) in

  let (max_so_far, current_max) = List.fold_left f (0, 0) l in
  max_so_far;
  ;;

let runDemos () = 
  assert(6 = max_consub [-2; 1; -3; 4; -1; 2; 1; -5; 4]);
  ;;

runDemos();;