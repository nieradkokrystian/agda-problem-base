data Maybe (A : Set) : Set where
 nothing : Maybe  A 
 just : A → Maybe A

fromMaybe : {A : Set} → A → Maybe A → A
frmMaybe = {!!}
