
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

(* 
Modules from Base like Int and String already satisfy this interface. 
But what if you want to satisfy this interface with a new module?
*)
module Book = struct
  (* 
  use Comparator.Make functor to extend the module
  use a common idiom where we create a submodule, called T containing 
  the basic functionality for the type in question, and then include 
  both that module and the result of applying a functor to that module
  *)
  module T = struct

    type t = { title: string; isbn: string }

    let compare t1 t2 =
      let cmp_title = String.compare t1.title t2.title in 
      if cmp_title <> 0 then 
        cmp_title
      else
        String.compare t1.isbn t2.isbn

    let sexp_of_t t : Sexp.t =
      List [Atom t.title; Atom t.isbn]
  end

  include T
  include Comparator.Make(T)
end

let%test "create a map for books" =
  let _ = Map.empty (module Book) in
  let books = Set.of_list (module Book) [
    { title = "iddqd"; isbn = "1234" };
    { title = "idkfa"; isbn = "3245" };
  ] in
  Stdio.printf "%d\n" (Set.length books);

  true
;;


