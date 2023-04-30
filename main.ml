(* Exercise 2.6 *)
let yen_of_usdollar _ = assert false
let usdollar_of_yen _ = assert false
let yen_of_usdollar_message _ = assert false
let capitalize _ = assert false

(* Exercise 3.3 *)
let geo_mean _ = assert false

(* Exercise 3.7 *)
let pow1 _ = assert false
let pow2 _ = assert false

(* Exercise 3.8 *)
let powi _ = assert false

(* Exercise 3.11(1) *)
let gcd _ = assert false

(* Exercise 3.11(2) *)
let comb _ = assert false

(* Exercise 3.11(3) *)
let fib_iter _ = assert false

(* Exercise 3.11(4) *)
let max_ascii _ = assert false

(* Exercise 3.12 *)
let arctan_one _ = assert false

(* Exercise 4.1 *)
let integral _ = assert false

(* Exercise 4.2 *)
let pow_curry _ = assert false
let cube _ = assert false

(* Exercise 4.4 *)
let uncurry _ = assert false

(* Exercise 4.5 *)
let fib_repeat _ = assert false

(* Exercise 4.7 *)
let k _ = assert false
let s _ = assert false
let second _ = assert false

(* Exercise 5.2 *)
let sum_list _ = assert false
let max_list _ = assert false

(* Exercise 5.3(1) *)
let downto0 _ = assert false

(* Exercise 5.3(2) *)
let roman _ = assert false

(* Exercise 5.3(3) *)
let concat _ = assert false

(* Exercise 5.3(4) *)
let zip _ = assert false

(* Exercise 5.3(5) *)
let filter _ = assert false

(* Exercise 5.3(6) *)
let belong _ = assert false
let intersect _ = assert false
let union _ = assert false
let diff _ = assert false

(* Exercise 5.5 *)
let forall _ = assert false
let exists _ = assert false

(* Exercise 5.6 *)
let quicker _ = assert false
let quick _ = assert false

(* Exercise 5.7 *)
let squares _ = assert false

(* Exercise 5.8 *)
let map2 _ = assert false

(* Exercise 6.1 *)
type figure = Point | Circle of int | Rectangle of int * int | Square of int
type loc_fig = { x : int; y : int; fig : figure; }
let overlap _ = assert false

(* Exercise 6.2 *)
type nat = Zero | OneMoreThan of nat
let int_of_nat _ = assert false
let add _ = assert false
let mul _ = assert false
let monus _ = assert false

(* Exercise 6.3 *)
let minus _ = assert false

(* Exercise 6.4 *)
type 'a tree = Lf | Br of 'a * 'a tree * 'a tree
let comptree _ = assert false

(* Exercise 6.5 *)
let inord _ = assert false
let postord _ = assert false

(* Exercise 6.6 *)
let reflect _ = assert false

(* Exercise 6.7 *)
type arith = Const of int | Add of arith * arith | Mul of arith * arith
let expand _ = assert false

(* Exercise 6.9 *)
type 'a seq = Cons of 'a * (unit -> 'a seq)
let primes = Cons (2, fun () -> assert false)


type ('a, 'b) sum = Left of 'a | Right of 'b

(* Exercise 6.10(1) *)
let f1 _ = assert false

(* Exercise 6.10(2) *)
let f2 _ = assert false

(* Exercise 6.10(3) *)
let f3 _ = assert false

(* Exercise 6.10(4) *)
let f4 _ = assert false

(* Exercise 6.10(5) *)
let f5 _ = assert false

(* Exercise 7.1 *)
type 'a ref = { mutable contents:'a }

let ref _ = assert false
let (!) _ = assert false
let (:=) _ _ = assert false
                                   
(* Exercise 7.2 *)
let incr _ = assert false

(* Exercise 7.4 *)
let fact_imp _ = assert false

(* Exercise 7.5 *)
let fact_safety _ = assert false

(* Exercise 7.8 *)
let change _ = assert false
