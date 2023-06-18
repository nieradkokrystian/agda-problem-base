open import Agda.Builtin.Equality

data Bool : Set where
 true false : Bool


not : Bool → Bool
not true = false
not false = true


not-invol : ∀ t → not (not t) ≡ t
not-invol = {!!} 
