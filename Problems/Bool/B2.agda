open import Agda.Builtin.Equality

data ⊥ : Set where

data Bool : Set where
 true false : Bool


not : Bool → Bool
not true = false
not false = true


true≢false : true ≡ false → ⊥ 
true≢false = {!!} 
