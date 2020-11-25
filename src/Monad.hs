module Monad where

import Control.Monad (join)

bind :: Monad m => (a -> m b) -> m a -> m b
bind f = join . (fmap f)

sequencing :: IO()
sequencing = do 
    putStrLn "blah"
    putStrLn "another blah"

sequencing' :: IO()
sequencing' = 
    putStrLn "blah" >>
    putStrLn "another blah"

sequencing'' :: IO()
sequencing'' = 
    putStrLn "blah" *>
    putStrLn "another blah"

binding :: IO()
binding = do
    name <- getLine
    putStrLn name

binding' :: IO()
binding' = 
    getLine >>= putStrLn

nm :: IO (IO ())
nm = putStrLn <$> getLine

m :: IO ()
m = join $ putStrLn <$> getLine 


bindingAndSequencing :: IO ()
bindingAndSequencing = do
    putStrLn "name pls:"
    name <- getLine
    putStrLn ("y helo thar: " ++ name)

bindingAndSequencing' :: IO ()
bindingAndSequencing' = 
    putStrLn "name pls:" >>
    getLine >>= 
    \name ->
        putStrLn ("y helo thar: " ++ name)

twoBinds :: IO ()
twoBinds = do
    putStrLn "name pls:"
    name <- getLine

    putStrLn "age pls:"
    age <- getLine

    putStrLn ("y helo thar: " 
              ++ name ++ " who is: "
              ++ age ++ " years old.")

twoBinds' :: IO()
twoBinds' =
    putStrLn "name pls:" >>
        getLine >>=
            \name ->
                putStrLn "age pls:" >>
                    getLine >>=
                        \age ->
                         putStrLn ("y helo thar: " 
                                   ++ name ++ " who is: "
                                   ++ age ++ " years old.")

    





