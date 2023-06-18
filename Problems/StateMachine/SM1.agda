open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
open import Agda.Builtin.Sigma
open import Agda.Builtin.List

data ⊥ : Set where

data State : Set where
 locked unlocked : State

data Input : Set where
 push coin : Input


update : State → Input → State
update locked coin = unlocked
update unlocked push = locked
update s _ = s

coinUnlocks : ∀ s → update s coin ≡ unlocked
coinUnlocks s = {!!}
