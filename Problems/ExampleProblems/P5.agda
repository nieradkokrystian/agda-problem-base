data Either (A B : Set) : Set where
 left : A → Either A B
 right : B → Either A B


mapEither : {A B C : Set} → (A → C) → (B → C) → Either A B → C
mapEither = {!!}
