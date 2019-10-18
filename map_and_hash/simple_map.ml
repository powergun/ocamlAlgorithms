
open Base

module type Counter = sig
  type t
  val empty : t
  val touch : t -> string -> t
  val to_list : t -> (string * int) list
end

module Counter = struct
  type t = (string, int, String.comparator_witness) Map.t
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

let () =
  Stdio.printf "....\n"
;;

let () =
  Stdio.printf "asdasd\n"
;;

