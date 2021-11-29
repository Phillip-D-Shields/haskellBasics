
n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]

-- find last element of a list

lastElement xs = xs !! length xs - 1

lastElement1 xs = head (reverse xs)

lastElement2 = last

-- take initial segment of list

init xs = take (length xs - 1) xs

init1 xs = reverse (tail (reverse xs))

init2 = Prelude.init -- references standard prelude library function 'init' 