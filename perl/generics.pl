#!/usr/bin/env perl
use warnings;

my $types = qq{
data SomethingA = Foo | Bar
data SomethingB = Baz | Bop | Bloop
};

my $preamble = qq{
module Types.Generated where

import Prelude

import Data.Enum (class BoundedEnum, class Enum)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Bounded (genericBottom, genericTop)
import Data.Generic.Rep.Enum (genericCardinality, genericFromEnum, genericPred, genericSucc, genericToEnum)
import Data.Generic.Rep.Show (genericShow)
};

my $template = qq{
derive instance genericTYPENAME ∷ Generic TYPENAME _
derive instance eqTYPENAME ∷ Eq TYPENAME
derive instance ordTYPENAME ∷ Ord TYPENAME
instance showTYPENAME ∷ Show TYPENAME where
  show = genericShow
instance enumTYPENAME ∷ Enum TYPENAME where
  succ = genericSucc
  pred = genericPred
instance boundedTYPENAME ∷ Bounded TYPENAME where
  top = genericTop
  bottom = genericBottom
instance boundedEnumTYPENAME ∷ BoundedEnum TYPENAME where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum
};

my @types = split(/\n/, $types);
my @constructors = ();
foreach $type (@types) {
    $type =~ /data (\w+) =/ || next;
    push(@constructors, $1);
}

my @output = ($preamble, $types);
foreach $constructor (@constructors) {
    my $formatted = $template;
    $formatted =~ s/TYPENAME/\Q$constructor\E/g;
    push(@output, $formatted);
};

print @output;
