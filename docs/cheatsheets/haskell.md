# Haskell Cheatsheet

## Functors, Applicatives and Monads

* **Functor's** `fmap` applies a function `(a -> b)` to a wrapped value `m a`, also know as `<$>`
    ```Haskell
    -- function is multiply by 2
    fmap (*2) [1..4]
        [2,4,6,8]
    fmap (*2) (Just 11)
        Just 22
    fmap (*2) Nothing
        Nothing
    ```
* **Applicative's** `apply` applies a wrapped function `m (a -> b)` to a wrapped value `m a`, also know as `<*>`
* **Monads** `bind` applies a wrapping function `(a -> m b)` to a wrapped value `m a`, also know as `>>=`
* A **Monad** is an **Applicative**
* An **Applicative** is a **Functor**

## Semigroup and Monoids

* **Semigroup** `append` concatenates two values `a -> a -> a`, also known as `<>`
* **Monoid** `mempty` defines an empty value for its type
* A **Monoid** is a **Semigroup**


## Do Notation

* The de-sugaring is defined recursively by the rules:
    ```Haskell
    do { a <- f; m }    f >>= \a -> do { m }
    do { f; m }         f >> do { m }
    do { m }            m
    ```
* So the following are equivalent:
    ```Haskell
    do
    a <- f            |  f >>= \a ->
    b <- g            |    g >>= \b ->
    c <- h            |      h >>= \c ->
    return (a, b, c)  |        return (a, b, c)
    ```

## Monads

### Use Case
The below `sequence` function that takes a *list of wrapped values* `[m a]` and returns a *wrapped list of values* `m [a]`
```Haskell
sequence :: Monad m => [m a] -> m [a]
sequence = foldr f (return [])
    where f :: Monad m => m t -> m [t] -> m [t]
```
`sequence` abstracts out three fundamental concepts of computation (Failure, Collections, and Effects) for reuse in higher level abstractions.
```Haskell
-- Failure
> sequence [Just 3, Just 4]
    Just [3,4]
> sequence [Just 3, Just 4, Nothing]
    Nothing

-- Collection
> sequence [[1,2,3],[10,20,30]]
    [[1,10],[1,20],[1,30],[2,10],[2,20],[2,30],[3,10],[3,20],[3,30]]

-- Effects (Get input)
> sequence [getLine, getLine]
    ["Line 1 from IO","Line 2 from IO"]
```

### Survey of Monad uses

* `State Monad`: allows functions within a stateful monadic context to access and modify shared state
* `Writer Monad`: write lazy stream of values in a monadic context
* `Reader Monad`: access shared immutable state in a monadic context



## Further Reading

* Stephen Diehl's [What I Wish I Knew When Learning Haskell](http://dev.stephendiehl.com/hask/)
* Adit's [Functors, Applicatives, And Monads In Pictures](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)


