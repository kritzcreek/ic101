# Unit testing canisters in Motoko

This repository demonstrates how to use the [`matchers`](https://github.com/kritzcreek/motoko-matchers) library to unit test canisters on the Internet Computer.

## Project setup:
The project is split into two canisters, the "canister under test" called `ic101` and a canister containing test for it,
called `ic101_test`.

`ic101` exposes a `greet` function that returns a greeting for all names but `"Voldemort"` which makes it trap.

`ic101_test` exposes a `test` function that should be called to run the unit tests. The [`run_test.sh`](./run_test.sh) script can be used to run these and detect test failures, provided both canisters have been installed on the local replica.

Relevant files to check out:
  - [`vessel.dhall`](./vessel.dhall) adds the dependencies on `base` and `matchers`
  - [`package-set.dhall`](./package-set.dhall) contains the exact versions needed to make this work at this point in time
  - [`dfx.json`](./dfx.json) configures the test canister, as well as the `vessel` invocations under the `"defaults"` key. 
  - [The canister _under test_](./src/ic101/main.mo) is the minimal greet canister slightly modified.
  - [The test canister](./src/ic101_test/main.mo) uses the `matchers` library to define its unit tests.

Also make sure to check out the [`Canister`](https://kritzcreek.github.io/motoko-matchers/Canister.html) module in the `matchers` library.

## Zero to hero (Step-by-step)
- Install [dfx](https://sdk.dfinity.org/docs/quickstart/quickstart.html#download-and-install)
- Install [vessel](https://github.com/kritzcreek/vessel/releases/tag/v0.5.1)
```bash
git clone https://github.com/kritzcreek/ic101.git
cd ic101
dfx start --background
dfx canister create --all
dfx build
dfx canister install --all --mode=reinstall
./run_test.sh
```
