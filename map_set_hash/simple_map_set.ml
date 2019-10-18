
open Base

module type Counter = sig
  type t
  val empty : t
  val touch : t -> string -> t
  val to_list : t -> (string * int) list
end

module Counter = struct
  type t = (string, int, String.comparator_witness) Map.t
  (* 
  it takes a first-class module as an arg,
  the point of the first class module is to provide the comparison
  function that is required for building the map, along with an 
  s-expression converter for generating useful error messages
  we don't need to provide the module again for functions like find
  or add because the map itself contains a ref to the compa
  *)
  let empty = Map.empty (module String)
  let to_list t = Map.to_alist t
  let touch t s =
    let count =
      match Map.find t s with
        | None -> 0
        | Some x -> x
      in
      Map.set t ~key:s ~data:(count + 1)
end

let%test "create a Counter" =
  let c = Counter.empty in 
  let c = Counter.touch c "iddqd" in
  let c = Counter.touch c "idkfa" in
  let c = Counter.touch c "idkfa" in
  let c = Counter.touch c "idnoclip" in
  List.iter (Counter.to_list c) ~f:(
    fun (text, count) -> 
      Stdio.printf "text(%s)/count(%d) " text count
  );
  Stdio.printf "\n";

  true
;;

let%test "create a Set" =
  (* 
  sets are little more than maps where you ignore the data
  MY NOTE:
  it's based a tree impl hence the ordering
  *)
  let st1 = Set.of_list (module Int) [7; 1; 3; 3; 7] in
  let st2 = Set.of_list (module Int) [3; 1; 4; 1; 5] in
  List.iter (Set.union st1 st2 |> Set.to_list) ~f:(
    fun elem -> Stdio.printf "element(%d) " elem
  );
  Stdio.printf "\n";

  true
;;

