

open import Algebra
open import Algebra.Structures.Biased using (isCommutativeSemiringˡ)
open import Axiom.Extensionality.Propositional using (Extensionality)
open import Data.Bool.Base using (true; false)
open import Data.Empty using (⊥-elim)
open import Data.Empty.Polymorphic using (⊥) renaming (⊥-elim to ⊥ₚ-elim)
open import Data.Product as Prod hiding (swap)
open import Data.Product.Function.NonDependent.Propositional
open import Data.Sum.Base as Sum
open import Data.Nat
open import Data.List
open import Data.Sum.Properties using (swap-involutive)
open import Data.Sum.Function.Propositional using (_⊎-cong_)
open import Data.Unit.Polymorphic using (⊤)
open import Level using (Level; Lift; 0ℓ; suc)
open import Function.Base
open import Function.Equality using (_⟨$⟩_)
open import Function.Equivalence as Eq using (_⇔_; Equivalence)
open import Function.Inverse as Inv using (_↔_; Inverse; inverse)
open import Function.Related
open import Relation.Binary hiding (_⇔_)
open import Relation.Binary.PropositionalEquality as P using (_≡_; _≗_)
open import Relation.Nullary.Reflects using (invert)
open import Relation.Nullary using (Dec; ¬_; _because_; ofⁿ)
import Relation.Nullary.Indexed as I
open import Relation.Nullary.Decidable using (True)
open import Data.String

data X : Set where

module Representation1 where

 record LineItem : Set where
   constructor MakeLineItem
   field
     itemDescription : String
     itemQuantity    : ℕ
     itemPrice       : ℕ -- the price for one unit of this item

 record Bill : Set where
   constructor MakeBill
   field
     billId      : String
     lineItemList : List LineItem
     billDate    : String -- date when the bill was issued

 record Client : Set where
   constructor MakeClient
   field
     clientId : String
     clientName : String
     billsList : List Bill

module Representation2 where

 record Product : Set where
   constructor MakeProduct
   field
     productName : String
     productAmount : ℕ
     productUnitPrice : ℕ

 record Invoice : Set where
   constructor MakeInvoice
   field
     invoiceNumber : String
     productList : List Product
     invoiceIssued : String

 record Customer : Set where
   constructor MakeCustomer
   field
     customerCode : String
     customerFullName : String
     invoiceList : List Invoice



record Iso (A B : Set) : Set where
 field
  to : A → B
  from : B → A
  leftInv : ∀ x → from (to x) ≡ x
  rightInv : ∀ x → (to (from x)) ≡ x


listIso : (A B : Set) → Iso A B → Iso (List A) (List B) 
listIso = {!!}
