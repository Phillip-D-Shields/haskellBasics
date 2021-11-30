-- define safetail function
-- same as tail, except maps empty list to [] instead of throwing error

-- conditional
safetail00 xs = if null xs then [] else tail xs

-- guards
safetail01 xs 
    | null xs = []
    | otherwise = tail xs

-- pattern matching
safetail02 [] = []
safetail02 (_:xs) = xs
