open Ast
open Printf

(* Unary operators *)
let txt_of_unop = function
  | Not -> "Not"
  | Neg -> "Neg"
  | Inc -> "Inc"
  | Dec -> "Dec"

(* Binary operators *)
let txt_of_binop = function
  (* Arithmetic *)
  | Add -> "Add"
  | Sub -> "Sub"
  | Mult -> "Mult"
  | Div -> "Div"
  (* Boolean *)
  | Or -> "Or"
  | And -> "And"
  | Equal -> "Equal"
  | Neq -> "Neq"
  | Less -> "Less"
  | Greater -> "Greater"
  | Leq -> "Leq"
  | Geq -> "Geq"

(* Expressions *)
(* let txt_of_num = function
  | Num_int(x) -> string_of_int x

let rec txt_of_expr = function
  | Literal(x) -> sprintf "Literal(%s)" (txt_of_num x)
  | BoolLit(x) -> sprintf "BoolLit(%s)" (string_of_bool x)
  | Id(x) -> sprintf "Id(%s)" x
  | Noexpr
  | Binop(e1, op, e2) -> sprintf "Binop(%s, %s, %s)"
      (txt_of_expr e1) (txt_of_binop op) (txt_of_expr e2)
  | Unop(op, e) -> sprintf "Unop(%s, %s)" (txt_of_unop op) (txt_of_expr e)
  | Assign(x, e) -> sprintf "Assign(%s, %s)" x (txt_of_expr e)
  | Call(f, args) -> sprintf "Call(%s, [%s])"
      (txt_of_expr f) (txt_of_list args)
  | String(x) -> sprintf "String(%s)" x
  | Double(x) -> sprintf "Double(%s)" (txt_of_num)

(* Function declarations *)
and txt_of_fdecl f =
  sprintf "Fdecl({ params=[%s] ; body=%s ; return = %s })"
    (String.concat " ; " f.params) (txt_of_stmts f.body) (txt_of_expr f.return)

(* Lists *)
and txt_of_list = function
  | [] -> ""
  | [x] -> txt_of_expr x
  | _ as l -> String.concat " ; " (List.map txt_of_expr l)

(* Statements *)
and txt_of_stmt = function
  | Do(expr) -> sprintf "Do(%s)" (txt_of_expr expr)

and txt_of_stmts stmts =
  let rec aux acc = function
      | [] -> sprintf "[%s]" (String.concat " ; " (List.rev acc))
      | stmt :: tl -> aux (txt_of_stmt stmt :: acc) tl
  in aux [] stmts

(* Program entry point *)
let _ =
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  let result = txt_of_stmts program in
  print_endline result
*)
