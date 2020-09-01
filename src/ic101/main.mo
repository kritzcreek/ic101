

import M "mo:matchers/Matchers";
import T "mo:matchers/Testable";
import Text "mo:base/Text";

actor {
    public func greet(name : Text) : async Text {
        if (name == "Voldemort") {
            assert(false);
        };
        return "Hello, " # Text.concat(name, "!");
    };
};
