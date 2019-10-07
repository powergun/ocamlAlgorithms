#!/usr/bin/env ocaml

(* 
there is NO function to append a single element, reason:

https://stackoverflow.com/questions/6732524/what-is-the-easiest-way-to-add-an-element-to-the-end-of-the-list

"append" (extend by a singleton list) requires a full copy of the original list
*)
let demoExtend () =
  let l = [1; 2] in
  let l' = l @ [123] in
  assert(l' = [1; 2; 123]);
  ;;

let runDemos () = 
  demoExtend();
  ;;

runDemos();;