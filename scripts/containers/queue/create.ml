#!/usr/bin/env ocaml

let demoCreate () =
  let q = Queue.create() in
  assert(Queue.is_empty q);
  Queue.push 13 q;
  assert(not (Queue.is_empty q));
  ;;

let runDemos () = 
  demoCreate();
  ;;

runDemos();;
