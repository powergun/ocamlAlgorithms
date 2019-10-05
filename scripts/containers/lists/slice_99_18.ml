#!/usr/bin/env ocaml

let slice_incl n m xs = 
  let rec slice' index acc = function
    | [] -> acc
    | x :: xs -> if index >= n && index <= m then 
                   slice' (index + 1) (x :: acc) xs
                 else
                   slice' (index + 1) acc xs
  in
    List.rev (slice' 0 [] xs)
  ;;

let runDemos () = 
  let sut = ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] in
  assert(slice_incl 2 6 sut = ["c"; "d"; "e"; "f"; "g"]);
  assert(slice_incl (-1) 999 sut = sut);
  assert(slice_incl 6 2 sut = []);
  assert(slice_incl 2 6 [] = []);
  ;;

runDemos();;
