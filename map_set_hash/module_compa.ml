
open Core

(* 
http://dev.realworldocaml.org/maps-and-hashtables.html
*)

let%test "create map (exception)" =
  (*  
  throw an exception if a key is used more than once!
  *)
  let digit_map = Map.of_alist_exn (module Int) [
    0, "zero"; 1, "one"; 2, "two"; 3, "three"; 4, "four"; 
    5, "five"; 6, "six"; 7, "seven"; 8, "eight"; 9, "nine"
  ] in

  assert(Some "three" = Map.find digit_map 3);

  true;
;;


