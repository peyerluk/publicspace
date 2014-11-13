PublicSpace
=============

Phase 1
-------

Prototype memetracker for urls shared over the swiss twitter-space

```diff
This is how it is done:
--- Bad example
+++ Good example
```

```coffeescript
# bad:
name = "John Doe"

# good:
name = 'John Doe'
name = "#{prename} #{surname}"
```

```coffeescript
# bad:
--- name = "John Doe"

# good:
+++ name = 'John Doe'
+++ name = "#{prename} #{surname}"
```

```coffee
# bad:
--- name = "John Doe"

# good:
+++ name = 'John Doe'
+++ name = "#{prename} #{surname}"
```

```diff
# bad:
--- name = "John Doe"

# good:
+++ name = 'John Doe'
+++ name = "#{prename} #{surname}"
```
