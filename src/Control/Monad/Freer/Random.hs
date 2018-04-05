module Control.Monad.Freer.Random (Random(..), runRandom) where

import Control.Monad.Freer as F
import qualified Control.Monad.Freer.State as S
import qualified System.Random as R

data Random s r where
    Get :: R.RandomGen s => Random s s

runRandom :: s -> Eff (Random s : effs) x -> Eff effs x
runRandom gen0 = S.evalState gen0 . translate (\Get -> S.Get)