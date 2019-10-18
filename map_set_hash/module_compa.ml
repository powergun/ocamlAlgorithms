
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
  (* 
  note that most of the time one should use Comparable.Make 
  instead of Comparator.Make
  since the former provides extr helper functions (infix 
  comparison functions) in addition to the comparator
  *)
  include Comparator.Make(T)
  (* include Comparable.Make(T) *)
end

(* 
Much of the code here is devoted to creating a comparison function 
and s-expression converter for the type Book.t. But if we have the 
ppx_sexp_conv and ppx_compare syntax extensions enabled (both of 
which come with the omnibus ppx_jane package),

then we can request that default implementations of these functions 
be created, as follows.
*)
module CD = struct
  module T = struct
    type t = { title: string; isbn: string }
    [@@deriving compare, sexp_of]
  end
  include T
  include Comparator.Make(T)
end

let%test "create a map for books, a set for cds" =
  let _ = Map.empty (module Book) in
  let books = Set.of_list (module Book) [
    { title = "iddqd"; isbn = "1234" };
    { title = "idkfa"; isbn = "3245" };
  ] in
  Stdio.printf "size of book-set: %d\n" (Set.length books);

  let cds = Set.of_list (module CD) [
    { title = "doom1"; isbn = "1992" };
    { title = "dune2"; isbn = "1993" };
  ] in
  Stdio.printf "size of cd-set: %d\n" (Set.length cds);

  true
;;

type string_int_map = 
  int Map.M(String).t
  [@@deriving sexp]

let%test "applying @@deriving to maps and sets" =

  true
;;
