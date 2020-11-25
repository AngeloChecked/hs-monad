module EitherMonadSpec where


import EitherMonad 
import Test.Hspec

spec :: Spec
spec =  
    describe "EitherMonad" $ do 
        it "no founded" $ 
            mkSoftware 0 0 `shouldBe` Right (Shop {founded = 0, programmers = 0})
        it "negative years error" $
            mkSoftware (-1) 0 `shouldBe` Left (NegativeYears (-1))
        it "negative years and coders error" $
            mkSoftware (-1) (-1) `shouldBe` Left (NegativeYears (-1))
        it "too many years error" $
            mkSoftware 501 0 `shouldBe` Left (TooManyYears 501)
        it "too many coders error" $
            mkSoftware 100 5001 `shouldBe` Left (TooManyCoders 5001)
        it "too many coder for years error" $
            mkSoftware 0 500 `shouldBe` Left (TooManyCodersForYears 0 500)

     


