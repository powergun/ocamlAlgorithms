#!/usr/bin/env ocaml

let demoCreate () =
  let st = Stack.create() in
  assert(Stack.is_empty st);
  Stack.push 12321 st;
  assert(not (Stack.is_empty st));
  ;;

let runDemos () = 
  demoCreate();
  ;;

runDemos();;