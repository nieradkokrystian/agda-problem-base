open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
open import Agda.Builtin.Sigma
open import Agda.Builtin.List
open import Agda.Builtin.Maybe

data ⊥ : Set where

data State : Set where
 unitialized standby active terminated : State

data Input : Set where
 initialise activate toggle terminate : Input


update : State → Input → Maybe State
update unitialized initialise = just standby
update unitialized _ = nothing
update standby activate = just active
update standby toggle = just active
update standby _ = nothing
update active toggle = just standby
update active terminate = just terminated
update active _ = nothing
update terminated _ = nothing


exec : State → List Input → Maybe State
exec x [] = just x
exec x (x₁ ∷ x₂) with (update x x₁)
... | just x₃ = exec x₃ x₂
... | nothing = nothing

record _⋙_ (A B : State) : Set where
 
 field
  path : List Input
  proof : exec A path ≡ just B


initReachTerm : unitialized ⋙ terminated
initReachTerm = {!!}
