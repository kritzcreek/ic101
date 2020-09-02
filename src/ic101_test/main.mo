import Canister "canister:ic101";
import C "mo:matchers/Canister";
import M "mo:matchers/Matchers";
import T "mo:matchers/Testable";

actor {
    let it = C.Tester({ batchSize = 2 });
    public shared func test() : async C.Protocol {

        it.should("greet me", func () : async C.TestResult = async {
          let greeting = await Canister.greet("Christoph");
          M.attempt(greeting, M.equals(T.text("Hello, Christoph!")))
        });

        it.shouldFailTo("greet him-whose-name-shall-not-be-spoken", func () : async () = async {
          ignore await Canister.greet("Voldemort")
        });

        it.should("greet Claudio", func () : async C.TestResult = async {
          let greeting = await Canister.greet("Claudio");
          M.attempt(greeting, M.equals(T.text("Hello, Karl!")))
        });

        it.shouldFailTo("greet Joachim", func () : async () = async {
          ignore await Canister.greet("Joachim");
        });

        await it.run()
    }
}