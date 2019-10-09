#!/usr/bin/env ocaml

(* 
source:
(last example)
https://www.youtube.com/watch?v=KiUjTObV3Io&t=45s
*)

(* 
document a debugging technique, learned from: https://www.youtube.com/watch?v=DGvJk14sfi8
in the follow code I could have written
if max_current < 0 then 0

but instead I want to tell how many times this spot is executed:
if max_current < 0 then (let _ = print_endline "called" and i = 0 in i)
- use group imperial notation (begin end could do too)
- there are other ways to acheive the print, but I followed the video and used a dummy
 variable; print_endline returns unit which is bound to the dummy
- make sure the group ends with the original (return) value

*)
let max_consub l =
  let f (max_so_far, max_current) elem =
    let max_so_far' = max max_so_far (max_current + elem) in
    let max_current' = if max_current < 0 then (let _ = print_endline "called" and i = 0 in i) else max_current in
    (max_so_far', max_current' + elem) in

  let (max_so_far, current_max) = List.fold_left f (0, 0) l in
  max_so_far;
  ;;

let runDemos () = 
  assert(6 = max_consub [-2; 1; -3; 4; -1; 2; 1; -5; 4]);
  ;;

(* 

another way to debug on per-function level is to turn on trace
NOTE: this must be placed AFTER the function definition!
#trace max_consub;; 

*)
runDemos();;