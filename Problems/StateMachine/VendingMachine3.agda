open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
open import Agda.Builtin.Sigma
open import Agda.Builtin.List
open import Agda.Builtin.Maybe
open import Agda.Builtin.Nat renaming (Nat to ℕ)

data ⊥ : Set where

data Coin : Set where
  nickel dime quarter : Coin

data Drink : Set where
  cola water lemonade : Drink

data Action : Set where
  purchase : Drink → Action
  restock : Drink → ℕ → Action -- restock action with the drink type and number of drinks

data Input : Set where
  insertCoin : Coin → Input
  pressButton : Action → Input

data Inventory : Set where
  stock : ℕ → ℕ → ℕ → Inventory -- inventory count for cola, water, and lemonade respectively

data State : Set where
  vending : ℕ → Inventory → State -- first ℕ is total inserted money in cents

initialState : State
initialState = vending 0 (stock 0 0 0)

coinValue : Coin → ℕ
coinValue nickel = 5
coinValue dime = 10
coinValue quarter = 25

drinkCost : Drink → ℕ
drinkCost cola = 75
drinkCost water = 50
drinkCost lemonade = 65

updateInventory : Inventory → Action → Maybe Inventory
updateInventory (stock (suc c) w l) (purchase cola) = just (stock c w l)
updateInventory (stock c (suc w) l) (purchase water) = just (stock c w l)
updateInventory (stock c w (suc l)) (purchase lemonade) = just (stock c w l)
updateInventory (stock c w l) (restock cola n) = just (stock (c + n) w l)
updateInventory (stock c w l) (restock water n) = just (stock c (w + n) l)
updateInventory (stock c w l) (restock lemonade n) = just (stock c w (l + n))
updateInventory _ _ = nothing


update : State → Input → Maybe State
update (vending n inv) (insertCoin c) = just (vending (n + (coinValue c)) inv)
update (vending n inv) (pressButton a) with (updateInventory inv a)
... | nothing =  nothing
... | just inv' = just (vending n inv')
  

exec : State → List Input → Maybe State
exec x [] = just x
exec x (x₁ ∷ x₂) with (update x x₁)
... | just x₃ = exec x₃ x₂
... | nothing = nothing

record _⋙_ (A B : State) : Set where
 
 field
  path : List Input
  proof : exec A path ≡ just B


existFaultyPath : Σ _ (λ execPath → exec initialState execPath ≡ nothing)
existFaultyPath = {!!}
