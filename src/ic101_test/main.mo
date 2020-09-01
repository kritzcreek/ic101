import Canister "canister:ic101";
import Tester "Tester";
import M "mo:matchers/Matchers";
import T "mo:matchers/Testable";

actor {
    let tester = Tester.Tester({ batchSize = 1 });
    public shared func test() : async Text {
        let result = await tester.run([
            func () : async Tester.TestResult = async {
                let greeting = await Canister.greet("Christoph");
                Tester.attempt(greeting, M.equals(T.text("Hello, Christoph!")))
            },
            // func () : async Tester.TestResult = async {
            //     let greeting = await Canister.greet("Christoph");
            //     Tester.attempt(greeting, M.equals(T.text("Hello, Christoph!")))
            // },
            func () : async Tester.TestResult = async {
                let greeting = await Canister.greet("Voldemort");
                #fail(greeting)
            }
        ]);
        result
    }
}