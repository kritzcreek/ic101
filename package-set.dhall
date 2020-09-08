let upstream =
      https://github.com/kritzcreek/vessel-package-set/releases/download/mo-0.4.2-20200908/package-set.dhall sha256:304d45256bcbe1bbfd0c7ef24c63bfcd8df727df298ad3b097437dadd337c5b8

let Package =
      { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let overrides = [] : List Package

in  upstream # additions # overrides
