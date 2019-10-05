#!/usr/bin/env ocaml

let is_prime n =
  let n = abs n in
  let rec is_not_divisor d =
    d * d > n 
    || (n mod d <> 0 && is_not_divisor (d + 1)) 
  in
    n <> 1 
    && is_not_divisor 2;;

let runDemos () = 
  assert(not(is_prime 1));
  assert(is_prime 7);
  assert(not(is_prime 12));
  ;;

runDemos();;
