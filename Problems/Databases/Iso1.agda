open import Agda.Builtin.Equality


open import Agda.Builtin.Bool public
open import Agda.Builtin.Unit
open import Agda.Builtin.Sigma
open import Agda.Builtin.String
open import Agda.Builtin.List
open import Agda.Builtin.Maybe
open import Agda.Builtin.Nat renaming (Nat to ℕ)

data ⊥ : Set where



module Representation1 where

 record Item : Set where
   constructor MkItem
   field
     description : String
     amount      : ℕ

 record Invoice : Set where
   constructor MkInvoice
   field
     invoiceId   : String
     lineItems   : List Item

 record Customer : Set where
   constructor MkCustomer
   field
     customerId : String
     invoices   : List Invoice

module Representation2 where

 record Line : Set where
   constructor MkLine
   field
     info : String
     cost : ℕ

 record Bill : Set where
   constructor MkBill
   field
     billId : String
     lines  : List Line

 record Client : Set where
   constructor MkClient
   field
     clientId : String
     bills    : List Bill

record Iso : Set where
 field
  to : Representation1.Item → Representation2.Line
  from : Representation2.Line → Representation1.Item
  leftInv : ∀ x → from (to x) ≡ x
  right Inv : ∀ x → (to (from x)) ≡ x

areIsomorphic : Iso
areIsomorphic = {!!}
