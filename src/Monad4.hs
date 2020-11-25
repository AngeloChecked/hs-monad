module Monad4 where

import Control.Monad

mcomp :: Monad m =>
     (b -> m c)
  -> (a -> m b)  
  ->  a -> m c
mcomp f g a = join (f <$> (g a))

mcomp'' :: Monad m =>
     (b -> m c)
  -> (a -> m b)  
  ->  a -> m c
mcomp'' f g a = g a >>= f 

comp :: (b -> c) -> (a -> b) -> a -> c
comp = undefined

monad :: Monad m => m a -> (a -> m b) -> m b
monad = undefined

kleisliComp :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
kleisliComp = undefined

flipComp :: (a -> b) -> (b -> c) -> a -> c
flipComp = undefined

sayHi :: String -> IO String
sayHi greeting = do
    putStrLn greeting
    getLine

readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge =
    getAge "Hello! How old are you? "


