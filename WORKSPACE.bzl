load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

load("@obazl_rules_ocaml//ocaml:providers.bzl", "OpamConfig", "BuildConfig")

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


opam_pkgs = {
    # "bigarray": [],
    # "bytes": [],
    "core_kernel": ["v0.12.3"],
    "ctypes": ["0.17.1", ["ctypes.foreign", "ctypes.stubs"]],
    "ocaml-compiler-libs": ["v0.11.0", ["compiler-libs.common"]],
    "ounit2": ["2.2.3"],
}

opam = OpamConfig(
    version = "2.0",
    builds  = {
        "mina-0.1.0": BuildConfig(
            default  = True,
            switch   = "4.07.1",
            compiler = "4.07.1",
            packages = opam_pkgs,
            verify   = True
        ),
        "4.07.1": BuildConfig(
            compiler = "4.07.1",
            packages = opam_pkgs
        )
    }
)
