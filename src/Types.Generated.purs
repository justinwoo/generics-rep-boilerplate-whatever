
module Types.Generated where

import Prelude

import Data.Enum (class BoundedEnum, class Enum)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Bounded (genericBottom, genericTop)
import Data.Generic.Rep.Enum (genericCardinality, genericFromEnum, genericPred, genericSucc, genericToEnum)
import Data.Generic.Rep.Show (genericShow)

data SomethingA = Foo | Bar
data SomethingB = Baz | Bop | Bloop

derive instance genericSomethingA ∷ Generic SomethingA _
derive instance eqSomethingA ∷ Eq SomethingA
derive instance ordSomethingA ∷ Ord SomethingA
instance showSomethingA ∷ Show SomethingA where
  show = genericShow
instance enumSomethingA ∷ Enum SomethingA where
  succ = genericSucc
  pred = genericPred
instance boundedSomethingA ∷ Bounded SomethingA where
  top = genericTop
  bottom = genericBottom
instance boundedEnumSomethingA ∷ BoundedEnum SomethingA where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum

derive instance genericSomethingB ∷ Generic SomethingB _
derive instance eqSomethingB ∷ Eq SomethingB
derive instance ordSomethingB ∷ Ord SomethingB
instance showSomethingB ∷ Show SomethingB where
  show = genericShow
instance enumSomethingB ∷ Enum SomethingB where
  succ = genericSucc
  pred = genericPred
instance boundedSomethingB ∷ Bounded SomethingB where
  top = genericTop
  bottom = genericBottom
instance boundedEnumSomethingB ∷ BoundedEnum SomethingB where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum
