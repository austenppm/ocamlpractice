(* Exercise 2.6 *)
let yen_of_usdollar d = d *. 111.12 +. 0.5 |> int_of_float;;
let usdollar_of_yen d = (d |> float_of_int) /. 1.1112 +. 0.5 |> int_of_float |> float_of_int |> (fun y -> y /. 100.);;
let yen_of_usdollar_message d =  ( (d |> string_of_float) ^ " dollars are " ^ ( (d  *. 111.12 +. 0.5 |> int_of_float)|> string_of_int ) ^ " yen.");;
let capitalize d = Char.uppercase_ascii d;;

(* Exercise 3.3 *)
let geo_mean (a,b) = sqrt( (a) *. (b));;

(* Exercise 3.7 *)
let rec pow1 (x, n) = if n=0 then 1.0 else x *. pow1(x, n-1);;
let rec pow2 (x, n) = if n=0 then 1.0 else if (n / 2 * 2 = n) then  pow2(x *. x, n/2) else pow2(x *. x, n/2) *. x;; 

(* Exercise 3.8 *)
let powi (x, n) = 
  let rec aux (x, n, acc) = 
    if n = 0 then acc
    else aux(x, n-1, x*.acc)
  in
  aux(x, n, 1.0);;

(* Exercise 3.11(1) *)
let rec gcd (n, m) =
  if n = 0 then m else
  if m = 0 then n else
  if n = m then n else
  if n > m then
    if m = 1 then 1
    else gcd (m, (n mod m))
  else 
  if n = 1 then 1 
  else gcd (n, (m mod n));;

(* Exercise 3.11(2) *)
let rec comb (n, m) = 
  if m = 0 then 1 else
  if m = 1 then n
  else (comb (n, (m-1))) * (n + 1 - m) / m

(* Exercise 3.11(3) *)
let fib_iter n = 
  let rec fib_loop n a b = 
    if n < 1 then a else
    if n < 2 then b else
      fib_loop (n-2) (a+b) (a+b+b) in 
  fib_loop n 0 1
  
(* Exercise 3.11(4) *)
let string_to_list s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []

let rec max_ascii s = 
  let input_list = string_to_list s in 
  let rec get_max str_list current_max current_char =
    match str_list with
    | [] -> current_char
    | letter :: rest -> 
      if int_of_char letter > current_max then get_max rest (int_of_char letter) letter
      else get_max rest current_max current_char in
  get_max input_list 0 'd'

(* Exercise 3.12 *) 
let rec arctan_one n =
  if n < 0 then 0.0
  else if n = 0 then 1.0 -. (1.0 /. float_of_int (4 * n + 3))
  else if n mod 2 = 0 then
    arctan_one (n - 1) +. 1.0 /. float_of_int (4 * n + 1) -. 1.0 /. float_of_int (4 * n + 3)
  else
    arctan_one (n - 1) -. 1.0 /. float_of_int (4 * n + 3) +. 1.0 /. float_of_int (4 * n + 1) ;;


(* Exercise 4.1 *)
let integral f a b  = 
  if a = b then 0. else
    let recursion_num = 100000. in 
    let delta = if a > b then (a -. b) /. recursion_num else (b -. a) /. recursion_num in
    let st = if a > b  then b else a in 
    let rec loop f i delta current_sum =
      if i = (recursion_num +. 1.) then current_sum 
      else loop f (i +. 1.) delta current_sum  +. (f (st +. (i -. 1.) *. delta) +. f(st +. i *. delta)) *. delta
    in ( loop f 1. delta 0.) /. 2.;;

(* Exercise 4.2 *)
let rec pow_curry =
  fun n ->
    fun x ->
      if n = 0 then 1.0
      else x *. (pow_curry (n - 1) x);;

let cube = pow_curry 3;;

(* Exercise 4.4 *)
let uncurry curry_fun = 
  fun x -> 
    match x with 
    | (v1, v2) -> curry_fun v1 v2;;

(* Exercise 4.5 *)
let rec repeat f n x =
  if n > 0 then repeat f (n - 1) (f x) else x;;

let fib_repeat n = 
  let (fibn, _) = repeat (fun (x, y) -> (y, x+y)) (n-1) (1, 1) 
  in fibn;;

(* Exercise 4.7 *)
let k x y = x;;
let s x y z = x z ( y z );;
let second a b = k (s k k) a b;;

(* Exercise 5.2 *)
let sum_list _ = assert false
let max_list _ = assert false

(* Exercise 5.3(1) *)
let rec downto0 n = 
  match n with 
  | 0 -> 0 :: []
  | x -> x :: downto0 (n-1);;

(* Exercise 5.3(2) *)
let rec roman num_defs num =
  match num_defs with
  | [] -> ""
  | (n, sym) :: rest ->
    if num >= n then
      sym ^ roman num_defs (num - n)
    else
      roman rest num
;;

let roman_numeral num =
  roman
    [
      (1000, "M"); (900, "CM"); (500, "D"); (400, "CD");
      (100, "C"); (90, "XC"); (50, "L"); (40, "XL");
      (10, "X"); (9, "IX"); (5, "V"); (4, "IV"); (1, "I")
    ]
    num
;;


(* Exercise 5.3(3) *)
let concat lst = 
  let rec loop inlst current = 
    match inlst with
    | [] -> current
    | top :: rest -> loop rest (current @ top)
  in loop lst [];;

(* Exercise 5.3(4) *)
let rec zip lst1 lst2 = 
  match lst1 with 
  | top1 :: rest1 -> (match lst2 with
      | top2 :: rest2 -> (top1, top2) :: (zip rest1 rest2)
      | [] -> [] )
  | [] -> [];;

(* Exercise 5.3(5) *)
let rec filter p lst = 
  match lst with 
  | [] -> []
  | top :: rest -> if p top then top :: filter p rest else filter p rest;;

(* Exercise 5.3(6) *)
let rec belong a lst = 
  match lst with 
  | top :: rest -> if top = a then true else belong a rest
  | [] -> false

let rec intersect lst1 lst2 = 
  match (lst1, lst2) with
  | (top1:: rest1, []) -> []
  | (top1:: rest1, l2) -> if (belong top1 l2) then top1:: (intersect rest1 l2) else intersect rest1 l2
  | ([], top2:: rest2) -> []
  | ([], []) -> [];;

let union lst1 lst2 = 
  let rec loop l1 l2 current =
    match l1 with
    | top1 :: rest1 -> if not (belong top1 current) then loop rest1 l2 (top1 :: current)
      else loop rest1 l2 current
    | [] -> match l2 with 
      | top2 :: rest2 -> if not (belong top2 current) then loop l1 rest2 (top2 :: current)
        else loop l1 rest2 current
      | [] -> current in
  loop lst1 lst2 [];;

let rec diff lst1 lst2 =
  match lst1 with
  | top :: rest -> if not(belong top lst2) then top :: diff rest lst2 else diff rest lst2
  | [] -> [];;


(* Exercise 5.5 *)
let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | x :: xs -> f x (fold_right f xs acc)

let forall pred lst =
  let f x acc = acc && (pred x) in
  fold_right f lst true;;

let exists pred lst =
  let f x acc = acc || (pred x) in
  fold_right f lst false;;


(* Exercise 5.6 *)
let rec quicker l sorted = 
  match l with 
  | [] -> sorted
  | [top] -> top :: sorted
  | pivot :: rest_ ->
    let rec partition unsorted left right = (* move unsorted into 2 groups, left and right. *)
      match unsorted with 
      | top :: rest -> if top > pivot then (partition rest left (top :: right)) 
        else ( partition rest (top :: left) right)
      | [] -> (left, right)
    in let (l_left, l_right) = partition rest_ [] [] (* get the 2 partitions *)
    in (quicker l_left (pivot ::(quicker l_right sorted)))

let quick l = 
  quicker l [];;

(* Exercise 5.7 *)
let squares r =
  let rec aux x y result =
    if x * x > r then
      result
    else if x * x + y * y = r then
      aux (x + 1) (x + 1) ((x, y) :: result)
    else if y * y > r then
      aux (x + 1) (x + 1) result
    else
      aux x (y + 1) result
  in
  let all_solutions = aux 0 0 [] in
List.rev (List.fold_left (fun acc (x, y) -> (y, x) :: acc) [] all_solutions)


(* Exercise 5.8 *)
let map2 f lst =
  let rec aux lst acc =
    match lst with
    | [] -> List.rev acc
    | x :: xs -> aux xs (f x :: acc)
  in
  aux lst []


(* Exercise 6.1 *)
type figure = Point | Circle of int | Rectangle of int * int | Square of int
type loc_fig = { x : int; y : int; fig : figure }

let overlap (fig1 : loc_fig) (fig2 : loc_fig) : bool =
  let within_rectangle x y w h =
    fig1.x >= x && fig1.x <= x + w && fig1.y >= y && fig1.y <= y + h
  in
  let within_square x y s =
    fig1.x >= x && fig1.x <= x + s && fig1.y >= y && fig1.y <= y + s
  in
  match (fig1.fig, fig2.fig) with
  | (Point, Point) -> fig1.x = fig2.x && fig1.y = fig2.y
  | (Point, Circle r) | (Circle r, Point) ->
      let distance_squared = (fig1.x - fig2.x) * (fig1.x - fig2.x) + (fig1.y - fig2.y) * (fig1.y - fig2.y) in
      distance_squared <= (r * r)
  | (Point, Rectangle (w, h)) | (Rectangle (w, h), Point) ->
      within_rectangle fig2.x fig2.y w h
  | (Point, Square s) | (Square s, Point) ->
      within_square fig2.x fig2.y s
  | (Circle r1, Circle r2) ->
      let distance_squared = (fig1.x - fig2.x) * (fig1.x - fig2.x) + (fig1.y - fig2.y) * (fig1.y - fig2.y) in
      distance_squared <= ((r1 + r2) * (r1 + r2))
  | (Circle r, Rectangle (w, h)) | (Rectangle (w, h), Circle r) ->
      within_rectangle fig2.x fig2.y w h ||
      let closest_x = max fig2.x (min (fig2.x + w) fig1.x) in
      let closest_y = max fig2.y (min (fig2.y + h) fig1.y) in
      let dx = fig1.x - closest_x in
      let dy = fig1.y - closest_y in
      (dx * dx + dy * dy) <= (r * r)
  | (Circle r, Square s) | (Square s, Circle r) ->
      within_square fig2.x fig2.y s ||
      let closest_x = max fig2.x (min (fig2.x + s) fig1.x) in
      let closest_y = max fig2.y (min (fig2.y + s) fig1.y) in
      let dx = fig1.x - closest_x in
      let dy = fig1.y - closest_y in
      (dx * dx + dy * dy) <= (r * r)
  | (Rectangle (w1, h1), Rectangle (w2, h2)) ->
      (fig1.x < fig2.x + w2) && (fig1.x + w1 > fig2.x) &&
      (fig1.y < fig2.y + h2) && (fig1.y + h1 > fig2.y)
  | (Rectangle (w, h), Square s) | (Square s, Rectangle (w, h)) ->
      (fig1.x < fig2.x + s) && (fig1.x + w > fig2.x) &&
      (fig1.y < fig2.y + s) && (fig1.y + h > fig2.y)
  | (Square s1, Square s2) ->
      (fig1.x < fig2.x + s2) && (fig1.x + s1 > fig2.x) &&
      (fig1.y < fig2.y + s2) && (fig1.y + s1 > fig2.y)


(* Exercise 6.2 *)
type nat = Zero | OneMoreThan of nat
let rec int_of_nat n = 
  match n with
  | Zero -> 0
  | OneMoreThan rest -> 1 + int_of_nat rest

let inc x = OneMoreThan x

let rec add x y = 
  match y with
  | Zero -> x
  | OneMoreThan rest -> OneMoreThan (add x rest)

let rec mul x y = 
  match x with
  | Zero -> Zero
  | OneMoreThan rest_x -> (
      match y with
      |  Zero -> Zero
      |  OneMoreThan rest_y -> (add x (mul x rest_y))) (* x * y = x + x * y-1*)

let rec monus x y = 
  match y with 
  | Zero -> x
  | OneMoreThan y_rest -> (
      match x with
      | Zero -> Zero
      | OneMoreThan x_rest -> monus x_rest y_rest (* x - y = (x-1) - (y-1) *)
    )


(* Exercise 6.3 *)

let rec minus x y =
  match (x, y) with
  | (Zero, OneMoreThan _) -> None
  | (_, Zero) -> Some x
  | (OneMoreThan x_rest, OneMoreThan y_rest) ->
      minus x_rest y_rest


(* Exercise 6.4 *)
type 'a tree = Lf | Br of 'a * 'a tree * 'a tree

let rec comptree x n =
  if n <= 0 then Lf
  else if n = 1 then Br (x, Lf, Lf)
  else
    let subtree = comptree x (n - 1) in
    Br (x, subtree, subtree)


(* Exercise 6.5 *)
let rec inord = function
  | Lf -> []
  | Br (x, left, right) -> inord left @ [x] @ inord right

let rec postord = function
  | Lf -> []
  | Br (x, left, right) -> postord left @ postord right @ [x]


(* Exercise 6.6 *)
let rec reflect = function
  | Lf -> Lf
  | Br (x, left, right) -> Br (x, reflect right, reflect left)

(* Exercise 6.7 *)
type arith = Const of int | Add of arith * arith | Mul of arith * arith

let rec string_of_arith = function
  | Const n -> string_of_int n
  | Add (e1, e2) -> "(" ^ string_of_arith e1 ^ "+" ^ string_of_arith e2 ^ ")"
  | Mul (e1, e2) -> "(" ^ string_of_arith e1 ^ "*" ^ string_of_arith e2 ^ ")"

let rec expand = function
  | Const n -> Const n
  | Add (e1, e2) -> Add (expand e1, expand e2)
  | Mul (e1, e2) -> (
      match (expand e1, expand e2) with
      | (Add (e1', e2'), e3) -> Add (expand (Mul (e1', e3)), expand (Mul (e2', e3)))
      | (e1', Add (e2', e3')) -> Add (expand (Mul (e1', e2')), expand (Mul (e1', e3')))
      | (e1', e2') -> Mul (e1', e2')
    )

(* Exercise 6.9 *)
type 'a seq = Cons of 'a * (unit -> 'a seq)
let rec from n = Cons (n, fun() -> from (n+1))
let head (Cons (x, _)) = x
let tail (Cons (_, f)) = f ()
let rec take n s =
  if n = 0 then [] else head s :: take (n - 1) (tail s)
let rec mapseq f (Cons (x, tail)) =
  Cons (f x, fun () -> mapseq f (tail ()))
(* example *)
let reciprocals = mapseq (fun x -> 1.0 /. float_of_int x) (from 2)
(* sift: remove *)
let rec sift n s = 
  let h = head s in
  let t = tail s in 
  if h mod n = 0 then sift n t
  else Cons(h, fun() -> (sift n t))
(* get prime *)
let rec sieve (Cons (x, f)) = Cons (x, fun () -> sieve (sift x (f())))
let primes = sieve (from 2)
let rec nthseq n (Cons (x, f)) =
  if n = 1 then x else nthseq (n - 1) (f());;
(*
# nthseq (9483 + 3000) primes;;
- : int = 133813
*)


type ('a, 'b) sum = Left of 'a | Right of 'b

(* Exercise 6.10(1) *)
let f1 = function
  | (a, Left b) -> Left (a, b)
  | (a, Right c) -> Right (a, c)


(* Exercise 6.10(2) *)
let f2 (sum_1, sum_2) = 
  match sum_1 with 
  | Left l1 -> (match sum_2 with
      | Left l2 -> Left(Left(l1, l2))
      | Right r2 -> Right (Left(l1, r2)))
  | Right r1 -> (match sum_2 with
      | Left l2 -> Right (Right(r1, l2))
      | Right r2 -> Left (Right(r1, r2)))


(* Exercise 6.10(3) *)
let f3 (f, g) = function
  | Left a -> f a
  | Right c -> g c


(* Exercise 6.10(4) *)
let f4 h = (fun a -> h (Left a)), (fun b -> h (Right b))


(* Exercise 6.10(5) *)
let f5 = function
  | Left f -> (fun a -> Left (f a))
  | Right g -> (fun a -> Right (g a))


(* Exercise 7.1 *)
type 'a ref = { mutable contents: 'a }

let ref x = { contents = x }

let (!) r = r.contents

let (:=) r x = r.contents <- x

                                   
(* Exercise 7.2 *)
let incr pointer = 
  pointer := !pointer + 1

(* Exercise 7.4 *)
let fact_imp n =
  let i = ref n and res = ref 1 in
  while !i > 0 do
    res := !res * !i;
    i := !i - 1
  done;
  !res


(* Exercise 7.5 *)
let fact_safety n =
  if n < 0 then
    invalid_arg "fact_safety: negative argument"
  else
    let rec fact_helper n acc =
      match n with
      | 0 -> acc
      | _ -> fact_helper (n - 1) (acc * n)
    in
    fact_helper n 1

(* Exercise 7.8 *)
let us_coins = [25; 10; 5; 1]
let gb_coins = [50; 20; 10; 5; 2; 1];;

let rec change = function
  | (_, 0) -> []
  | ( (c :: rest) as coins, total) ->
    if (c > total) then change(rest, total) 
    else (try c :: change (coins, total - c)
          with Failure _ -> change (rest, total) )
  | ([], t) -> failwith "change";;
