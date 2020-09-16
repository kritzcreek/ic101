import Canister "canister:ic101";
import C "mo:matchers/Canister";
import M "mo:matchers/Matchers";
import T "mo:matchers/Testable";

actor {
    let it = C.Tester({ batchSize = 2 });
    public shared func test() : async Text {

        it.should("greet me", func () : async C.TestResult {
          let greeting = await Canister.greet("Christoph");
          M.attempt(greeting, M.equals(T.text("Hello, Christoph!")))
        });

        it.shouldFailTo("greet him-whose-name-shall-not-be-spoken", func () : async () {
          ignore await Canister.greet("Voldemort")
        });

        // Will fail
        it.should("greet Claudio", func () : async C.TestResult {
          let greeting = await Canister.greet("Claudio");
          M.attempt(greeting, M.equals(T.text("Hello, Karl!")))
        });

        // Will fail
        it.shouldFailTo("greet Joachim", func () : async () {
          ignore await Canister.greet("Joachim");
        });

        await it.runAll()
    }
}
