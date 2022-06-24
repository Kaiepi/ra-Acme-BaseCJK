![Build Status](https://github.com/Kaiepi/ra-Acme-BaseCJK/actions/workflows/test.yml/badge.svg)

NAME
====

Acme::BaseCJK - More digits for more better

SYNOPSIS
========

```raku
use Acme::BaseCJK;

put my $x = CJK:of(0x1541DBAD); # OUTPUT: 崁㼄
put CJK:to($x).base(16);        # OUTPUT: 1541DBAD
```

DESCRIPTION
===========

While clear about each bit's value, binary makes for a rather sparse encoding of integers compared to decimal. Hexadecimal is more compact, making it a little easier to read at a glance. `Acme::BaseCJK` takes this a step further by encoding integers with Unicode 13.0.0's CJK Unified Ideographs block, along with extensions A-G, making for a base 92 844 encoding.

AUTHOR
======

Ben Davies (Kaiepi)

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

