#!/usr/bin/env ocaml

let dropN xs n =
  let rec dropN' index = function
    | [] -> []
    | x :: xs -> if index = n then 
                   dropN' 1 xs 
                 else 
                   x :: dropN' (index + 1) xs
  in 
    dropN' 1 xs
  ;;

let runDemos () = 
  let sut = ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] in
  assert(dropN sut 3 = ["a"; "b"; "d"; "e"; "g"; "h"; "j"]);
  ;;

runDemos();;