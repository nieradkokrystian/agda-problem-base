open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
data ⊥ : Set where

------------------------------------------------------------------------
-- Relations

infix 4 _≤_ _<_

data _≤_ : Bool → Bool → Set where
  f≤t : false ≤ true
  b≤b : ∀ {b} → b ≤ b

data _<_ : Bool → Bool → Set where
  f<t : false < true

------------------------------------------------------------------------
-- Boolean operations

infixr 6 _∧_
infixr 5 _∨_ _xor_

not : Bool → Bool
not true  = false
not false = true

_∧_ : Bool → Bool → Bool
true  ∧ b = b
false ∧ b = false

_∨_ : Bool → Bool → Bool
true  ∨ b = true
false ∨ b = b

_xor_ : Bool → Bool → Bool
true  xor b = not b
false xor b = b

------------------------------------------------------------------------
-- Other operations

infix  0 if_then_else_

if_then_else_ : ∀ {A : Set} → Bool → A → A → A
if true  then t else f = t
if false then t else f = f

T : Bool → Set
T true  = ⊤
T false = ⊥

∧-comm : ∀ x y → (y ∧ x) ≡ (x ∧ y)
∧-comm = {!!}
