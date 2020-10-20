module MonadSpec where

import Monad
import Test.Hspec

spec :: Spec
spec = 
    describe "Monad" $
        it "testdummy" $
            1 `shouldBe` 1

