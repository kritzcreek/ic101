let upstream =
    https://raw.githubusercontent.com/kritzcreek/vessel-package-set/b8a50b772af45877ed1d7fae929c415820790b01/src/packages.dhall sha256:2ba38db2e5454a25e91841ba93e8f7bdb4b73fd59e0e6e2f3d8550d61fa63b1c

let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let overrides =
    [ { name = "base", version = "441402a7a3fcdaac3e4d59b3b1d5c205608c6c1b", repo = "https://github.com/dfinity/motoko-base", dependencies = [] : List Text }
    , { name = "matchers", version = "v0.1.0", repo = "https://github.com/kritzcreek/motoko-matchers", dependencies = [] : List Text }
    ]

in  upstream # additions # overrides
