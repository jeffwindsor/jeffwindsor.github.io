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



## Further Reading

* Stephen Diehl's [What I Wish I Knew When Learning Haskell](http://dev.stephendiehl.com/hask/)
* Adit's [Functors, Applicatives, And Monads In Pictures](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)



## Kind-ness

### KIND: * -> *
```Haskell
class Functor (f :: * -> *)
class Functor f => Applicative (f :: * -> *)
    instance Monoid a => Applicative ((,) a)
class Applicative m => Monad (m :: * -> *)
    instance Monoid a => Monad ((,) a)
```

### KIND: *
```Haskell
class Semigroup a
class (Semigroup a) => Monoid a   --associative, has identity
```

## Operators
```Haskell
($)   :: (a -> b) -> a -> b                       --function application, lowest priority
(&)   :: a -> (a -> b) -> b                       --reverse function application
(.)   :: (b -> c) -> (a -> b) -> (a -> c)         --function composition
```

```Haskell
(<$>) :: Functor f => (a -> b) -> f a -> f b      --fmap
(<$)  :: Functor f => a -> f b -> f a             -- replace value in functor
($>)  :: Functor f => f a -> b -> f b             -- replace value in functor
```

```Haskell
pure   :: Applicative f => a -> f a
(<*>)  :: Applicative f => f (a -> b) -> f a -> f b --apply, differs from fmap by f being wrapped
liftA2 :: Applicative f =>  (a -> b -> c) -> f a -> f b -> f c
(*>)   :: Applicative f => f a -> f b -> f b       --apply identity first??
(<*)   :: Applicative f => f a -> f b -> f a       --apply identity second??
```

```Haskell
(>>=) :: Monad m => m a -> (a -> m b) -> m b
(=<<) :: Monad m => (a -> m b) -> m a -> m b
(>>)  :: Monad m => m a -> m b -> m b
(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> (a -> m c)
```

```Haskell
(<>)    :: Semigroup a => a -> a -> a                   --append
mempty  :: Monoid a => a
```

```Haskell
(<|>) :: Alternative f => f a -> f a -> f a
```