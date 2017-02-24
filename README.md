# Compile Cache demo

Demonstration repository for the [compiler cache][1] library.


## Benchmark results

    $ mix bench

    benchmark name                   iterations   average time
    small template - compiler cache      500000   2.70 µs/op
    small template - string ops          500000   8.03 µs/op
    large template - compiler cache      100000   12.09 µs/op
    large template - string ops          100000   25.24 µs/op

[1]: https://github.com/arjan/compiler_cache
