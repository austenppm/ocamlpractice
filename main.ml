(* Exercise 2.1:

float_of_int 3 +. 2.5 の型は float であり、評価結果は 5.5 です。
int_of_float 0.7 の型は int であり、評価結果は 0 です。int_of_float 関数は浮動小数点数を整数に変換する際に、小数点以下を切り捨てるため、0.7 は 0 に変換されます。
if "11" > "100" then "foo" else "bar" の型は string であり、評価結果は "bar" です。文字列の比較は辞書順で行われるため、"11" は "100" よりも辞書的に後ろになります。
char_of_int ((int_of_char 'A') + 20) の型は char であり、評価結果は 'U' です。int_of_char 関数は文字を整数に変換し、char_of_int 関数は整数を文字に変換します。
int_of_string "0xff" の型は int であり、評価結果は 255 です。int_of_string 関数は文字列を整数に変換しますが、"0xff" は16進数表記の整数として解釈されます。
5.0 ** 2.0 の型は float であり、評価結果は 25.0 です。** 演算子は浮動小数点数のべき乗を計算します。
Exercise 2.2:

if true&&false then 2 は文法エラーです。条件式の後には then 節と else 節が必要ですが、else 節が省略されています。
8*-2 は文法エラーです。乗算演算子 * の前後には空白が必要です。
int_of_string "0xfg" は例外を発生します。"0xfg" は正しい16進数表記ではないため、int_of_string 関数がエラーをスローします。
int_of_float -0.7 の型は int ですが、負の浮動小数点数を整数に変換する場合には ~- 演算子を使う必要があります。正しくは int_of_float (~-.0.7) と書きます。
Exercise 2.3:

not true && false の期待する結果は true です。この式を直すには、括弧で not true を囲む必要があります: (not true) && false.
float_of_int int_of_float 5.0 の期待する結果は 5.0 です。この式を直すには、int_of_float の結果を float_of_int の引数に渡す必要があります: float_of_int (int_of_float 5.0).
sin 3.14 /. 2.0 ** 2.0 +. cos 3.14 /. 2.0 ** 2.0 の期待する結果は 1.0 です。この式を直すには、数学的な優先順位を明示するために括弧を追加する必要があります: (sin 3.14 /. (2.0 ** 2.0)) +. (cos 3.14 /. (2.0 ** 2.0)).
sqrt 3 * 3 + 4 * 4 の期待する結果は 5 (整数) です。この式を直すには、sqrt 3 の結果を括弧で囲んで演算の優先順位を明示する必要があります: (sqrt 3) * 3 + (4 * 4).
Exercise 2.4:

b1 && b2 を if-式 と true、false、b1、b2 のみを用いて書き直すと以下のようになります：
if b1 then
  if b2 then
    true
  else
    false
else
  false
同様に、b1 || b2 を if-式 と true、false、b1、b2 のみを用いて書き直すと以下のようになります：
if b1 then
  true
else
  if b2 then
    true
  else
    false
これにより、b1 && b2 と b1 || b2 の意味を保ちつつ、if-式を用いて書き直すことができます 

Exercise 2.5 

let a_2 = 5 in
let _ab2_ = "Hello" in
(* let 'Cat' = 10 in これは無効な変数名なのでコンパイルエラーになります *)
(* let _'_'_ = true in これも無効な変数名なのでコンパイルエラーになります *)
(* let 7eleven = "Shop" in これも無効な変数名なのでコンパイルエラーになります *)

(* 上記のlet宣言の結果を表示して確認する *)
print_int a_2;    (* 5 を表示 *)
print_string _ab2_;  (* "Hello" を表示 *)

*)

(* Exercise 2.6 *)
let yen_of_usdollar d = d *. 111.12 +. 0.5 |> int_of_float;;
let usdollar_of_yen d = (d |> float_of_int) /. 1.1112 +. 0.5 |> int_of_float |> float_of_int |> (fun y -> y /. 100.);;
let yen_of_usdollar_message d =  ( (d |> string_of_float) ^ " dollars are " ^ ( (d  *. 111.12 +. 0.5 |> int_of_float)|> string_of_int ) ^ " yen.");;
let capitalize d = Char.uppercase_ascii d;;


(* Exercise 3.1:

let x = 1 in let x = 3 in let x = x + 2 in x * x

各変数の参照:

最初のxは最も内側のスコープであり、3を指します。
2番目のxは2番目のスコープであり、3を指します。
最後のxは最も外側のスコープであり、5を指します。
予想される評価結果:

x * x の値は 5 * 5 であり、25 です。
let x = 2 and y = 3 in (let y = x and x = y + 2 in x * y) + y

各変数の参照:

最初のxは最も外側のスコープであり、2を指します。
最初のyも最も外側のスコープであり、3を指します。
内側のlet式のスコープでは、yは最も内側のスコープであり、2を指します。
同じく内側のスコープでは、xはその直前のy + 2 の結果である 5 を指します。
予想される評価結果:

(x * y) + y の値は (5 * 2) + 3 であり、13 です。
let x = 2 in let y = 3 in let y = x in let z = y + 2 in x * y * z

各変数の参照:

最初のxは最も外側のスコープであり、2を指します。
最初のyも最も外側のスコープであり、3を指します。
2番目のyは2番目のスコープであり、2を指します。
最後のzは最も内側のスコープであり、4を指します。
予想される評価結果:

x * y * z の値は 2 * 2 * 4 であり、16 です。

Excercise 3.2
let x = e1 and y = e2;;

この宣言では、変数 x と y を同時に定義しています。
e1 は x の初期値を表し、e2 は y の初期値を表します。
x と y は同じスコープ内で利用可能であり、互いに参照することができます。
let x = e1 let y = e2;;

この宣言では、まず x を定義し、その後に y を定義しています。
e1 は x の初期値を表し、e2 は y の初期値を表します。
x のスコープは宣言全体であり、y のスコープはその後の let 宣言以降になります。
つまり、y は x を参照することができますが、x は y を参照することはできません。

Exercise 3.4

type vector = float list
type matrix = float list list
vector 型は float 値のリストで、ベクトルを表現します。
matrix 型は float 値のリストのリストで、行列を表現します。

let rec prodMatVec (mat : matrix) (vec : vector) : vector =
  match mat, vec with
  | [], _ -> []
  | row :: rest, _ ->
      let rec dotProduct row vec =
        match row, vec with
        | [], [] -> 0.0
        | x :: xs, y :: ys -> x *. y +. dotProduct xs ys
        | _, _ -> failwith "Invalid matrix and vector sizes"
      in
      dotProduct row vec :: prodMatVec rest vec

この関数では、再帰とパターンマッチングを使用して、行列とベクトルの積を計算しています。

prodMatVec 関数は、行列 mat とベクトル vec を受け取り、結果として新しいベクトルを返します。
内部の dotProduct 関数は、行列の各行とベクトルの要素の内積を計算します。再帰的に行列の各行を処理し、結果を新しいベクトルに追加します。
行列とベクトルのサイズが合わない場合は、例外をスローして処理を停止します。

Exercise 3.5

以下は、(float * float * float * float) と (float * float) * (float * float) の型の違いについての比較です。

(float * float * float * float):

値の構成法: 4つの float 型の要素を持つタプルを構成します。例えば、(1.0, 2.0, 3.0, 4.0) はこの型の値です。
要素の取り出し方: パターンマッチングや直接的な要素へのアクセス (tuple_name.0, tuple_name.1, tuple_name.2, tuple_name.3) を使って、要素を取り出すことができます。
(float * float) * (float * float):

値の構成法: 2つの float 型の要素からなるタプルを2つ組み合わせて構成します。例えば、((1.0, 2.0), (3.0, 4.0)) はこの型の値です。
要素の取り出し方: パターンマッチングや直接的な要素へのアクセス (tuple_name.0、tuple_name.1) を使って、各タプルの要素を取り出すことができます。更に、内側のタプルの要素にも同様の方法でアクセスすることができます。
これらの違いにより、(float * float * float * float) の型は4つの float 型の値をまとめるのに対し、(float * float) * (float * float) の型は2つの float 型の要素からなるタプルを組み合わせた構造を持つことがわかります。また、要素の取り出し方も異なります。

Exercise 3.6

(x : int) は、OCamlにおけるパターンの一種です。このパターンは、変数 x を特定の型（この場合は int 型）としてマッチさせるために使用されます。

このパターンの意味は以下の通りです:

マッチする対象: int 型の値
発生する束縛: マッチした値を x という名前の変数に束縛する
例えば、以下のようなコードを考えてみましょう:

let x : int = 42 in
...
このコードでは、x という変数を int 型として宣言し、値 42 を x に束縛しています。

このパターンを使うことで、特定の型の値に対してパターンマッチングを行い、その値を特定の変数に束縛することができます。例えば、関数の引数の型を指定する際にも使用することができます。

let process_int (x : int) =
  ...
このような関数定義では、x という引数が int 型の値にマッチし、関数内でその値を x という名前の変数として使用することができます。

このように、(x : int) パターンは特定の型の値をマッチさせ、その値を特定の変数に束縛するために使用されるパターンです。

Exercise 3.9

以下のコードは、if 式を関数 cond と再帰関数 fact を組み合わせて表現しようとしています。

let cond (b, e1, e2) : int = if b then e1 else e2;;

let rec fact n = cond ((n = 1), 1, n * fact (n-1));;

fact 4;;
しかし、このコードでは fact 4 の計算がうまく行われず、評価ステップが停止しません。

この問題が発生する理由は、OCamlにおける関数の遅延評価と関数呼び出しの評価順序の特性に関連しています。

具体的には、fact 関数が再帰的に呼び出される際に、引数 n の値が再帰呼び出しの前に評価されるためです。この場合、fact (n-1) の評価が行われる前に、n の評価が必要ですが、その結果はまだ得られていないため、評価が停止します。

つまり、関数 cond の第二引数と第三引数のどちらかが評価される前に条件式 n = 1 の結果が必要になりますが、それが得られないため、計算が停止してしまいます。

この問題を解決するためには、遅延評価や正格評価の手法を使って fact 関数を実装する必要があります。また、OCamlでは if 式を使って遅延評価を実現することはできません。代わりに、パターンマッチングや再帰呼び出しを適切に使用することで、再帰関数としての fact 関数を正しく実装することができます。

Exercise 3.10 let rec fib n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fib (n - 1) + fib (n - 2)

fib 4
fib 4 の評価が開始されます。
n が 4 とマッチングされ、_ の部分が実行されます。
fib (4 - 1) + fib (4 - 2) が評価されます。
左側の fib (4 - 1) が評価されます。
fib 3 の評価が開始されます。
n が 3 とマッチングされ、_ の部分が実行されます。
fib (3 - 1) + fib (3 - 2) が評価されます。
左側の fib (3 - 1) が評価されます。
fib 2 の評価が開始されます。
n が 2 とマッチングされ、_ の部分が実行されます。
fib (2 - 1) + fib (2 - 2) が評価されます。
左側の fib (2 - 1) が評価されます。
fib 1 の評価が開始されます。
n が 1 とマッチングされ、_ の部分が実行されます。
1 が返されます。
右側の fib (2 - 2) が評価されます。
fib 0 の評価が開始されます。
n が 0 とマッチングされ、_ の部分が実行されます。
0 が返されます。
1 + 0 が計算され、結果として 1 が返されます。
右側の fib (3 - 2) が評価されます。
fib 1 の評価が開始されます。
1 が返されます。
1 + 1 が計算され、結果として 2 が返されます。
2 + 1 が計算され、結果として 3 が返されます。
最終的な結果は 3 です。

*)

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

(* Exercise 4.3
int -> int -> int -> int:

この型は、3つの int 型の引数を受け取り、int 型の結果を返す関数型です。
例えば、以下のような関数がこの型に属します：
let sum_three (x : int) (y : int) (z : int) : int =
  x + y + z
(int -> int) -> int -> int:

この型は、関数 (int -> int) 型の引数と int 型の引数を受け取り、int 型の結果を返す関数型です。
第1引数の関数は int 型の引数を受け取り、int 型の結果を返す関数です。
例えば、以下のような関数がこの型に属します：
let apply_twice (f : int -> int) (x : int) : int =
  f (f x)
(int -> int -> int) -> int:

この型は、関数 (int -> int -> int) 型の引数を受け取り、int 型の結果を返す関数型です。
第1引数の関数は 2つの int 型の引数を受け取り、int 型の結果を返す関数です。
例えば、以下のような関数がこの型に属します：
let apply_operation (op : int -> int -> int) : int =
  op 3 4
これらの説明に基づいて、3つの型に属する適当な関数が定義されました。それぞれの関数は与えられた型に適合し、期待通りの引数と結果の型を持っています。

Exercise 4.6
引数 f は関数型 'a -> 'a の関数です。
引数 n は整数型 (int) の数値です。
引数 x は型 'a の値です。
この関数は、関数 f と整数 n を受け取り、関数 funny を再帰的に適用して、変換された関数を生成します。生成された関数は、x に適用されることが想定されます。

funny 関数の動作は以下のようになります：

n が 0 の場合、id 関数が返されます。つまり、変換が終了し、x に変更は加えられません。
n が偶数の場合、f 関数が2回適用されるように変換が行われます。n を 2 で割り、f 関数を2回繰り返し適用することで、変換が進行します。
n が奇数の場合、f 関数が2回適用されるように変換が行われます。その後、さらに f 関数が1回適用されます。n を 2 で割り、f 関数を2回繰り返し適用し、最後に1回だけ f 関数を適用することで、変換が進行します。
最終的に生成される関数の型は 'a -> 'a です。funny 関数は、与えられた関数 f と整数 n に基づいて、再帰的な変換を行いながら新しい関数を生成します。生成された関数は x に適用されることが期待されています。

Exercise 4.8
let rec double double f x =
  if x = 0 then x
  else double double f (x - 1) + double double f (x - 1)
与えられた関数 double は、関数 f と整数 x を引数として受け取り、x 回の f の合成を行う関数です。

関数 double の動作は以下の通りです：

x が 0 の場合、x を返します。これは再帰の終了条件です。
x が 0 より大きい場合、f を2回適用した結果の合計を返します。具体的には、double double f (x - 1) と double double f (x - 1) を計算し、その合計を返します。
このように、double double f x は再帰的に自身を呼び出し、x 回の f の合成を行います。
 *)

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
let rec sum_list lst =
  match lst with
  | [] -> 0
  | hd :: tl -> hd + sum_list tl

let rec max_list lst =
  match lst with
  | [] -> raise (Failure "Empty list")
  | [x] -> x
  | hd :: tl ->
      let max_rest = max_list tl in
      if hd > max_rest then hd else max_rest


(* Exercise 5.1

正しいリスト表現は以下のものです。

[[]]

正しい表現です。型は 'a list list です。空のリストを要素とするリストです。
[[1; 3]; ["hoge"]]

正しい表現です。型は int list list です。整数のリストと文字列のリストを要素とするリストです。
[3] :: []

正しい表現です。型は int list です。整数のリストです。リストの先頭に要素 3 を追加しています。
2 :: [3] :: []

正しい表現です。型は int list list です。整数のリストを要素とするリストです。先頭のリストに 2 を、その次のリストに 3 を追加しています。
[] :: []

正しい表現です。型は 'a list list です。空のリストを要素とするリストです。
[(fun x -> x); (fun b -> not b)]

正しい表現です。型は ('a -> 'a) list です。関数を要素とするリストです。2つの無名関数を要素として持っています。

Exercise 5.2（部分的に論述が必要）
sum_list の定義：

let rec sum_list lst =
  if null lst then 0
  else hd lst + sum_list (tl lst)
sum_list 関数は、与えられたリスト lst の要素の合計を再帰的に計算します。null 関数はリストが空かどうかを判定し、hd 関数はリストの先頭の要素を取得し、tl 関数はリストの先頭を除いた残りの部分を取得します。

match を使用した定義では、以下のようになります：

let rec sum_list lst =
  match lst with
  | [] -> 0
  | hd :: tl -> hd + sum_list tl
利害得失の議論：

null、hd、tl の組み合わせのみで定義する場合は、リストの操作を自分で行う必要があります。このため、リストのパターンマッチングを行うよりも冗長なコードになる可能性があります。
一方で、match を使用する場合は、パターンマッチングによりリストの構造を簡潔に表現することができます。
null、hd、tl の組み合わせを使用する場合は、関数を定義する際にそれぞれの組み合わせに対する条件分岐を自分で記述する必要があります。
match を使用する場合は、パターンマッチングによって自動的にリストの構造に合わせた処理が行われます。
null、hd、tl の組み合わせを使用する場合は、リストが空かどうかを判定する関数 null の実装が必要になります。
match を使用する場合は、組み込みのパターンマッチング機能を利用するため、追加の関数定義は不要です。
max_list の定義：

let rec max_list lst =
  if null (tl lst) then hd lst
  else max (hd lst) (max_list (tl lst))
max_list 関数は、与えられたリスト lst の最大値を再帰的に求めます。max 関数は2つの値のうち大きい方を返す関数です。

match を使用した定義では、以下のようになります：

let rec max_list lst =
  match lst with
  | [] -> failwith "Empty list"
  | [x] -> x
  | hd :: tl -> max hd (max_list tl)
利害得失の議論：

null、hd、tl の組み合わせのみで定義する場合と同様に、リストの操作を自分で行う必要があります。
match を使用する場合は、パターンマッチングによってリストの要素数に応じた条件分岐を行うことができます。
null、hd、tl の組み合わせを使用する場合は、リストの要素数に応じた条件分岐を自分で記述する必要があります。
match を使用する場合は、パターンマッチングによって自動的にリストの構造に合わせた処理が行われます。
null、hd、tl の組み合わせを使用する場合は、リストが空かどうかを判定する関数 null の実装が必要になります。
match を使用する場合は、組み込みのパターンマッチング機能を利用するため、追加の関数定義は不要です。
結論として、match を使用する場合はパターンマッチングの機能を活用できるため、リストの操作をより簡潔かつ直感的に記述することができます。一方で、null、hd、tl の組み合わせを使用する場合は、リストの操作に関する詳細な知識や条件分岐の実装が必要となり、コードの冗長さや複雑さが増す可能性があります。したがって、一般的には match を使用したパターンマッチングが、リストの操作を行う際には好まれる方法と言えます。

Excercise 5.4 
f と g を適当な型の関数とし、l をリストとします。

式 map f (map g l) を一度しか使用しない同じ意味の式に書き換えるには、関数合成を利用して以下のように書くことができます：

map (fun x -> f (g x)) l
ここで、map (fun x -> f (g x)) l の (fun x -> f (g x)) の部分は、f と g を合成した関数を表しています。x を引数として g を適用し、その結果を f に適用することで、f と g の合成を行っています。

このように書き換えることで、元の式と同じ結果が得られますが、map 関数を一度しか使用せずに計算が行われるため、効率的な処理が行われます。
*)

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



(* Exercise 6.6（部分的に論述が必要）

まず、二分木の左右を反転させる関数 reflect を定義しましょう。次に、与えられた二分木 t に対して成立する方程式を完成させます。

type 'a tree = Lf | Br of 'a * 'a tree * 'a tree

let rec reflect t =
  match t with
  | Lf -> Lf
  | Br (x, left, right) -> Br (x, reflect right, reflect left)
上記のコードでは、二分木の構造を再帰的に反転させています。葉ノード (Lf) の場合は反転せずにそのまま返し、分岐ノード (Br) の場合は値 x をそのまま保持しながら左右の子ノードを反転させます。

次に、成立する方程式を完成させます。

preorder(reflect(t)) = ?
preorder は根を最初に、左部分木を次に、右部分木を最後に訪れるため、反転後の木では根と左右の子ノードの順序が逆転します。したがって、preorder(reflect(t)) の結果は postorder(t) となります。

inorder(reflect(t)) = ?
inorder は左部分木を最初に、根を次に、右部分木を最後に訪れるため、反転後の木では左右の子ノードと根の順序が逆転します。したがって、inorder(reflect(t)) の結果は inorder(t) となります。

postorder(reflect(t)) = ?
postorder は左部分木を最初に、右部分木を次に、根を最後に訪れるため、反転後の木では左右の子ノードと根の順序が逆転します。したがって、postorder(reflect(t)) の結果は inorder(t) となります。

以上より、方程式の完成形は以下のようになります：

preorder(reflect(t)) = postorder(t)
inorder(reflect(t)) = inorder(t)
postorder(reflect(t)) = inorder(t)
これらの方程式は、与えられた二分木 t の各順序において、反転した木の対応する順序と等しいことを示しています。

Exercise 6.8 
1, 2, 3, 4 からなる可能な二分探索木の形を列挙し、要素を追加するための順番を示します。

1. 以下のような二分探索木を考えます：

   2
  / \
 1   3
      \
       4

要素を追加する順番は、1, 2, 3, 4 の順番です。

2. 以下のような二分探索木を考えます：

   3
  / \
 1   4
  \
   2

要素を追加する順番は、1, 3, 2, 4 の順番です。

3. 以下のような二分探索木を考えます：

   3
  / \
 2   4
  \
   1

要素を追加する順番は、3, 2, 1, 4 の順番です。

これらの形を作るためには、空の木から要素を追加していく際に、二分探索木の性質を保つように要素を配置する必要があります。具体的には、以下の手順に従って要素を追加します：

1. 空の木から始めます。
2. 最初の要素をルートノードに追加します。
3. 2番目の要素をルートノードと比較し、小さければ左の子ノードに追加し、大きければ右の子ノードに追加します。
4. 3番目の要素をルートノードから始めて、同様の比較と追加の手順を繰り返します。
5. 最後の要素を追加します。

この手順に従うと、上記の二分探索木の形を作ることができます。ただし、要素の追加順によって異なる形が得られるため、異なる二分探索木の形も存在します。
*)
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
  let dist_sqr x1 y1 x2 y2 =
    let dx = x1 - x2 in
    let dy = y1 - y2 in
    (dx * dx) + (dy * dy)
  in
  match (fig1.fig, fig2.fig) with
  | (Point, Point) -> fig1.x = fig2.x && fig1.y = fig2.y
  | (Point, Circle r) | (Circle r, Point) ->
      let distance_squared = dist_sqr fig1.x fig1.y fig2.x fig2.y in
      distance_squared <= (r * r)
  | (Point, Rectangle (w, h)) | (Rectangle (w, h), Point) ->
      within_rectangle fig2.x fig2.y w h
  | (Point, Square s) | (Square s, Point) ->
      within_square fig2.x fig2.y s
  | (Circle r1, Circle r2) ->
      let distance_squared = dist_sqr fig1.x fig1.y fig2.x fig2.y in
      distance_squared <= ((r1 + r2) * (r1 + r2))
  | (Circle r, Rectangle (w, h)) | (Rectangle (w, h), Circle r) ->
      let half_width = w / 2 in
      let half_height = h / 2 in
      let closest_x =
        if fig1.x < fig2.x - half_width then fig2.x - half_width
        else if fig1.x > fig2.x + half_width then fig2.x + half_width
        else fig1.x
      in
      let closest_y =
        if fig1.y < fig2.y - half_height then fig2.y - half_height
        else if fig1.y > fig2.y + half_height then fig2.y + half_height
        else fig1.y
      in
      let distance_squared = dist_sqr fig1.x fig1.y closest_x closest_y in
      distance_squared <= (r * r)
  | (Circle r, Square s) | (Square s, Circle r) ->
      let half_side = s / 2 in
      let closest_x =
        if fig1.x < fig2.x - half_side then fig2.x - half_side
        else if fig1.x > fig2.x + half_side then fig2.x + half_side
        else fig1.x
      in
      let closest_y =
        if fig1.y < fig2.y - half_side then fig2.y - half_side
        else if fig1.y > fig2.y + half_side then fig2.y + half_side
        else fig1.y
      in
      let distance_squared = dist_sqr fig1.x fig1.y closest_x closest_y in
      distance_squared <= (r * r)
  | (Rectangle (w1, h1), Rectangle (w2, h2)) ->
      let x1_min = fig1.x - w1 / 2 in
      let x1_max = fig1.x + w1 / 2 in
      let y1_min = fig1.y - h1 / 2 in
      let y1_max = fig1.y + h1 / 2 in
      let x2_min = fig2.x - w2 / 2 in
      let x2_max = fig2.x + w2 / 2 in
      let y2_min = fig2.y - h2 / 2 in
      let y2_max = fig2.y + h2 / 2 in
      not (x1_max < x2_min || x1_min > x2_max || y1_max < y2_min || y1_min > y2_max)
  | (Rectangle (w, h), Square s) | (Square s, Rectangle (w, h)) ->
      let x1_min = fig1.x - w / 2 in
      let x1_max = fig1.x + w / 2 in
      let y1_min = fig1.y - h / 2 in
      let y1_max = fig1.y + h / 2 in
      let x2_min = fig2.x - s / 2 in
      let x2_max = fig2.x + s / 2 in
      let y2_min = fig2.y - s / 2 in
      let y2_max = fig2.y + s / 2 in
      not (x1_max < x2_min || x1_min > x2_max || y1_max < y2_min || y1_min > y2_max)
  | (Square s1, Square s2) ->
      let x1_min = fig1.x - s1 / 2 in
      let x1_max = fig1.x + s1 / 2 in
      let y1_min = fig1.y - s1 / 2 in
      let y1_max = fig1.y + s1 / 2 in
      let x2_min = fig2.x - s2 / 2 in
      let x2_max = fig2.x + s2 / 2 in
      let y2_min = fig2.y - s2 / 2 in
      let y2_max = fig2.y + s2 / 2 in
      not (x1_max < x2_min || x1_min > x2_max || y1_max < y2_min || y1_min > y2_max)

;;
(*let overlap (fig1 : loc_fig) (fig2 : loc_fig) : bool =
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
      (fig1.y < fig2.y + s2) && (fig1.y + s1 > fig2.y) *)


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


(* Exercise 7.3
`funny_fact` 関数は再帰的な定義を使用せずに階乗を計算しています。その仕組みは、参照 (`ref`) を使って関数の参照を変更することで実現されています。

まず、`f` という名前の参照 (`ref`) を定義し、初期値として `fun y -> y + 1` という関数を持たせます。これは単純な数値を受け取り、それに 1 を加える関数です。

次に、`funny_fact` 関数を定義します。この関数は、引数 `x` が 1 である場合は 1 を返し、それ以外の場合は `x` に `f` が指す関数を適用した結果に `x - 1` を掛けた値を返します。ここで、`!f` を使って参照 `f` が指す関数を取得し、それに `(x - 1)` を引数として適用しています。

この時点では、`f` が指す関数は初期値の `fun y -> y + 1` です。

その後、`f` の参照先を `funny_fact` に変更します。これにより、`f` が指す関数が再帰的に呼び出されるようになります。つまり、`funny_fact` 自体が自身を呼び出す再帰的な性質を持つようになります。

最後に、`funny_fact` を呼び出すことで階乗の計算が行われます。この際、参照 `f` が指す関数として、初期値の `fun y -> y + 1` ではなく、変更後の `funny_fact` が使用されます。そのため、再帰的に `funny_fact` を呼び出すことにより、正しい階乗の計算が行われます。

このように、`ref` を使って関数の参照を変更することで、再帰的な定義を使用せずに関数を再帰的に呼び出す仕組みが実現されています。
Exercise 7.6
まず、7.1.4節で述べられている `[]` への参照の例を実際にインタラクティブ・コンパイラで試してみます。

let l = ref [];;

このコードでは、空のリスト `[]` を参照として持つ変数 `l` を定義しています。

テキストに書かれた挙動との違いは、OCamlのインタラクティブ・コンパイラでは参照の型が明示的に表示される点です。具体的には、以下のような表示となります：

val l : 'a list ref = {contents = []}

上記の出力は、`l` の型が `'a list ref` であり、参照の中身が `[]` (空のリスト) であることを示しています。

参照の型 `'a list ref` は、`'a` という型のリストを参照することを意味しています。`'a` は任意の型変数を表し、参照が指すリストの要素の型を表すために使用されます。

このように参照の型が表示されることで、`[]` への参照が明示的に示されています。

また、参照の型が `'a list ref` であるため、リストの要素の型に関わらずどのようなリストであっても参照に格納することができます。これにより、誤って `true` を `[1]` に cons してしまうような事態の発生を防ぐことができます。

例えば、以下のようなコードを実行するとエラーが発生します：

l := true :: !l;;


エラーメッセージは以下のようになります：

Error: This expression has type bool but an expression was expected of type 'a list


このエラーメッセージは、`true` の型が `bool` であるため、参照 `l` のリストの要素の型 `'a` と一致せず、エラーが発生していることを示しています。

したがって、参照の型が明示的に表示されることで、リストの要素の型が保持され、誤った要素の追加や型の不一致が防がれます。
Exercise 7.7 
問題のプログラムでは、継承を模倣するために `pointC` の定義が変更されています。しかし、`cpointC` の実装では `cset` メソッドが正しく機能していません。具体的には、`cset` メソッド内で `super.set` を呼び出す前に `col` を白にセットする処理が行われてしまっています。

これにより、`cset` メソッドの呼び出し時に色がまだ変更される前に座標がセットされてしまい、結果として色が白にならない問題が発生します。

正しい動作を実現するためには、`cset` メソッド内で `super.set` を呼び出した後に色を白にセットする必要があります。そのために、以下のようにプログラムを書き換えましょう。

let cpointC x col =
  let super = pointC x in
  let rec this =
    {
      cget = super.get;
      cset = (fun x' -> (super.set x'; col := White));
      cinc = super.inc;
      getcolor = (fun () -> !col)
    }
  in
  this

上記の修正では、`cset` メソッド内で `super.set` を呼び出す前に `col` を白にセットしています。

修正後のプログラムを使用すると、`cp.cinc()` の呼び出しによって座標がセットされる前に色が白になります。

let cp = new_cpoint 0 Red;;
cp.cinc();;
cp.cget();;
cp.getcolor();;

実行結果:
- : unit = ()
- : int = 1
- : color = White

これにより、`cinc` メソッドによって座標がセットされると同時に色も白になるようになりました。修正によって、望んだ動作が実現されました。
*)

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
