open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
open import Agda.Builtin.Sigma
open import Agda.Builtin.List
open import Agda.Builtin.Maybe

data ⊥ : Set where

data State : Set where
  idle selecting paid dispensing : State

data Input : Set where
  insertCoin selectProduct confirmPurchase cancel collectProduct : Input

update : State → Input → Maybe State
update idle insertCoin = just selecting
update idle _ = nothing
update selecting selectProduct = just paid
update selecting cancel = just idle
update selecting _ = nothing
update paid confirmPurchase = just dispensing
update paid cancel = just idle
update paid _ = nothing
update dispensing collectProduct = just idle
update dispensing _ = nothing


exec : State → List Input → Maybe State
exec x [] = just x
exec x (x₁ ∷ x₂) with (update x x₁)
... | just x₃ = exec x₃ x₂
... | nothing = nothing

record _⋙_ (A B : State) : Set where
 
 field
  path : List Input
  proof : exec A path ≡ just B


idleToDispensing : idle ⋙ dispensing
idleToDispensing = ?
