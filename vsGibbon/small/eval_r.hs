import Eval

gibbon_main =
  let
    n = 22
    t = mkDeterministicTree n
  in iterate (evalR t)
