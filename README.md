# Unit testing canisters in Motoko

This repository demonstrates how to use the [`matchers`](https://github.com/kritzcreek/motoko-matchers) library to unit test canisters on the Internet Computer.

## Project setup:
The project is split into two canisters, the "canister under test" called `ic101` and a canister containing test for it,
called `ic101_test`.

`ic101` exposes a `greet` function that returns a greeting for all names but `"Voldemort"` which makes it trap.

`ic101_test` exposes a `test` function that should be called repeatedly until all tests have passed. The scripting for this might move into dfx at some point.

Relevant files to check out:
  - [`vessel.dhall`](./vessel.dhall) adds the dependencies on `base` and `matchers`
  - [`package-set.dhall`](./package-set.dhall) contains the exact versions needed to make this work at this point in time
  - [`dfx.json`](./dfx.json) configures the test canister, as well as the `vessel` invocations under the `"default"` key. 
  - [The canister _under test_](./src/ic101/main.mo) is the minimal greet canister slightly modified.
  - [The test canister](./src/ic101_test/main.mo) uses the `matchers` library to define its unit tests.
