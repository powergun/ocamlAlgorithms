# OCaml Algorithms

Soluation to the common algorithm problems, implemented in OCaml. Aim to be short, concise and practical.

## Installation

this project uses a opam local switch and direnv

`opam switch -y create ./ --deps-only ocaml-base-compiler.4.07.1`

## Build each sub project

use this pattern, run `opam install` in the project root directory

`cd ocamlAlgorithms && opam install base core core_bench stdio`

run `dune build <target>.exe` in the sub project directory

```shell
cd map_hash_perf
dune build hash_faster.exe
_build/default/hash_faster.exe
```
