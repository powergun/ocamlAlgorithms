
open Core

let () = 
  (* initializing Random with a nondeterministic seed is forbidden in inline tests *)
  (* Random.self_init(); *)

  let _min = (-12.0) in
  let _max = 12.0 in
  let _works = [1;2;3;4;5;6;7;8;9] in
  List.iter _works ~f:(fun _ -> Stdio.printf "%f " (Random.float_range _min _max));
  Stdio.printf "\n";
;;
