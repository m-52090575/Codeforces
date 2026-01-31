namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Set(desired : Result, q1 : Qubit) : Unit {
        if (desired != M(q1)) {
            X(q1);
        }
    }

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qubit = Qubit()) {
            Set(One, qubit);

            unitary(qubit);
            Microsoft.Quantum.Intrinsic.R(PauliZ, 180.0, qubit);
            let res = M(qubit);
            Message($"{res}");
            Set(Zero, qubit);

            if (res == One) {
                return 0;
            }
            return 1;
        }
    }

    @EntryPoint()
    operation Hello() : Int {
        Message("Result was: ");
        return Solve(Microsoft.Quantum.Intrinsic.I);
    }
}
