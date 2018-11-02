# Haskell Monadic Sheatsheet

## Type Classes

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

## Functions

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