module Main where

class Functor f where  
    fmap :: (a -> b) -> f a -> f b  

fmap id = id
fmap f . fmap g = fmap(f.g)

Instance Functor [] where
  fmap f [] = []
  fmap f (x:xs) = f x : fmap f xs

main :: IO ()
main = do
  putStrLn "Hello world"