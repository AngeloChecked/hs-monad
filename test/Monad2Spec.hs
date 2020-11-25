module Monad2Spec where

import Monad2
import Test.Hspec

spec :: Spec
spec = do
    describe "Monad2" $ 
        it "twice when even" $
            twiceWhenEven [1..3] `shouldBe` [1,4,4,9]
    describe "Maybe Monad" $ do
        it "spherical caw nothing" $
            mkSphericalCow "Bess" 5 500 `shouldBe` Nothing
        it "spherical caw just" $
            mkSphericalCow "Bess" 5 499 `shouldBe` Just (Cow {name = "Bess", age = 5, weight = 499}) 
        it "spherical caw nothing with do" $
            mkSphericalCow' "Bess" 5 500 `shouldBe` Nothing
        it "spherical caw just with do" $
            mkSphericalCow' "Bess" 5 499 `shouldBe` Just (Cow {name = "Bess", age = 5, weight = 499}) 
        it "spherical caw nothing with sequencing" $
            mkSphericalCow'' "Bess" 5 500 `shouldBe` Nothing
        it "spherical caw just with sequencing" $
            mkSphericalCow'' "Bess" 5 499 `shouldBe` Just (Cow {name = "Bess", age = 5, weight = 499}) 
        it "spherical caw nothing with binding" $
            mkSphericalCow''' "Bess" 5 500 `shouldBe` Nothing
        it "spherical caw just with binding" $
            mkSphericalCow''' "Bess" 5 499 `shouldBe` Just (Cow {name = "Bess", age = 5, weight = 499}) 



