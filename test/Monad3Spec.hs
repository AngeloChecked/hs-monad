module Monad3Spec where

import Monad3
import Test.Hspec
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Test.QuickCheck


trigger :: Sum String (Int, String, Int) 
trigger = undefined

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        frequency [ (1,return (Second b))
                  , (1,return (First a))
                  ]

instance (Eq a, Eq b) => EqProp (Sum a b) where
    (=-=) = eq

spec :: Spec
spec = 
    describe "Monad3 Laws" $ do 
        it "quickBatch monad" $
            quickBatch (monad [(1,2,3)::(Int,Int,Int)])
        it "quickBatch monad either custom named: Sum" $ do
            quickBatch (functor trigger) 
            quickBatch (applicative trigger) 
            quickBatch (monad trigger) 
