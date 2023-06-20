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
     
record Iso : Set where
 field
  to : Representation1.Client → Representation2.Customer
  from : Representation2.Customer → Representation1.Client
  leftInv : ∀ x → from (to x) ≡ x
  right Inv : ∀ x → (to (from x)) ≡ x

areIsomorphic : Iso
areIsomorphic = {!!}
