# Bindings to jemalloc mallctl api

This modules contains some helpers to access jemlloc control api,
retrieve allocator statistics and change properties.

see jemalloc [man page](http://jemalloc.net/jemalloc.3.html)

# building

`$ bazel build src:jemalloc`

To build just the libjemalloc static archive and shared lib:

`$ bazel build src:libjemalloc`
