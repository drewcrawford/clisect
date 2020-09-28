# clisect

clisect is like `git bisect` without any `git`.  It searches an interval to find a value via bisection (binary search).

```
$ clisect 0...10
try: 5.0

l: apply to lower
u: apply to upper
q: quit (difference: 10.0)
>l
try: 7.5

l: apply to lower
u: apply to upper
q: quit (difference: 5.0)
>l
try: 8.75

l: apply to lower
u: apply to upper
q: quit (difference: 2.5)
>u
try: 8.125

l: apply to lower
u: apply to upper
q: quit (difference: 1.25)
>q
Final range: 7.5...8.75
```
