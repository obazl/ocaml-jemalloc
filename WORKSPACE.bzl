load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def libjemalloc_fetch_repo():

    maybe(
        http_archive,
        name = "libjemalloc",
        url = "https://github.com/jemalloc/jemalloc/archive/5.2.1.zip",
        type = "zip",
        sha256 = "461eee78a32a51b639ef82ca192b98c64a6a4d7f4be0642f3fc5a23992138fd5",
        strip_prefix = "jemalloc-5.2.1",
        build_file_content = "\n".join([
            "filegroup(name = \"all\",",
            "srcs = glob([\"**\"]),",
            "visibility = [\"//visibility:public\"])",
        ]),
    )

