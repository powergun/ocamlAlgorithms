
open Core

(* 
http://dev.realworldocaml.org/maps-and-hashtables.html
*)


let%test "create association list" =
  let digit_alist =
    [ 0, "zero"; 1, "one"; 2, "two"  ; 3, "three"; 4, "four"
    ; 5, "five"; 6, "six"; 7, "seven"; 8, "eight"; 9, "nine" ] in
  let v = List.Assoc.find ~equal:Int.equal digit_alist 6 in
  assert(v = Some "six");

  let v = List.Assoc.find ~equal:Int.equal digit_alist 3242 in
  assert(v = None);

  let al = List.Assoc.add ~equal:Int.equal digit_alist 3242 "idd" in
  let v = List.Assoc.find ~equal:Int.equal al 3242 in
  assert(v = Some "idd");

  true
;;

