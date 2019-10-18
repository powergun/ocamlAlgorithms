
open Core

let%test "create hash table" = 
  let tb = Hashtbl.create (module String) in
  printf "new tb size: %d\n" (Hashtbl.length tb);

  Hashtbl.set tb ~key:"iddqd" ~data:32423;
  printf "updated tb size: %d\n" (Hashtbl.length tb);

  true
;;

module Asset = struct
  type t = { title: string; isbn: string }
  [@@deriving compare, sexp_of, hash]
end

let%test "create hash table for custom type" = 
  let tb = Hashtbl.create (module Asset) in
  Hashtbl.set tb ~key:{title="iddqd";isbn="16bit"} ~data:32;
  Hashtbl.set tb ~key:{title="iddqd";isbn="16bit"} ~data:64;
  Hashtbl.set tb ~key:{title="idfa";isbn="8bit"} ~data:32;
  printf "tb (asset) size: %d\n" (Hashtbl.length tb);

  true
;;

