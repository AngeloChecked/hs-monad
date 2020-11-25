module Monad4Spec where


import Monad4
import Test.Hspec

spec :: Spec
spec = 
    describe "composition" $
        it "functor" $
            (fmap ((+1) . (+2)) [1..5]) `shouldBe` (fmap (+1) . fmap (+2) $ [1..5])

