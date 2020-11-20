--| Returns the first non-empty `Optional` value in a `List`
let head
    : ∀(a : Type) → List (Optional a) → Optional a
    = λ(a : Type) →
      λ(xs : List (Optional a)) →
        List/fold
          (Optional a)
          xs
          (Optional a)
          ( λ(l : Optional a) →
            λ(r : Optional a) →
              merge { Some = λ(x : a) → Some x, None = r } l
          )
          None

let example0 = assert : head Natural [ None, Some 1, Some 2 ] ≡ Some 1

let example1 = assert : head Natural [ None, None ] ≡ None

let example2 = assert : head Natural ([] : List (Optional Natural)) ≡ None

in  head
