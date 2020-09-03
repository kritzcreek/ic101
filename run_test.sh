#!/bin/bash
string=$(dfx canister call ic101_test test)

if [[ $string =~ "Failure!" ]]
then
   echo $string
   exit 1
fi