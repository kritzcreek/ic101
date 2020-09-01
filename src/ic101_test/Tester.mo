import M "mo:matchers/Matchers";
module {

    public type TestResult = { #success; #fail : Text };

    public func attempt<A>(item : A, matcher : M.Matcher<A>) : TestResult {
        if (matcher.matches(item)) {
            #success
        } else {
            let description = M.Description();
            matcher.describeMismatch(item, description);
            #fail(description.toText())
        }
    };

    // mkTest {
    //     "Greet works with Christoph",
    //     func () : async Text {
    //         let result = await Canister.greet("Christoph");
    //         M.attempt(result, M.equals(T.text "Greetings, Christoph!")),
    //     }
    // }
    // mkTrappingTest {
    //     "The one who shall not be named",
    //     func () : async Text {
    //         let result = await Canister.greet("Voldemort");
    //         result
    //     }
    // }

    // public func mkTest(name : Text, expected : Matcher<A>, action : () -> async TestResult) : () -> async TestResult =
    //     func () : async TestResult = {
    //         let result = await action();
    //         result
    //     };

    public class Tester({ batchSize : Nat }) {
        public func run(tests : [() -> async TestResult]) : async Text {
            var result = "";
            for(test in tests.vals()) {
                try {
                  let testResult = await test();
                  result #= switch testResult {
                    case (#success) "Yay";
                    case (#fail(msg)) "Failed with " # msg;
                  };
                } catch _ {
                    result #= "Test exploded";
                }
            };
            result
        }
    }
}