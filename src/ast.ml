(*
 * COMS4115: CMAT AST
 *
 * Authors:
 *  - Marissa Ojeda
 *  - Daniel Rojas
 *  - Mike Berkowitz
 *  - Frank Cabada
 *)

(* Binary Operators *)
type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq | And | Or

(* Unary Operators *)
type uop = Neg | Not | Inc | Dec

(* Nums *)
type num = Int_lit of int | Float_lit of float

(* Types *)
type primitives = Int	| Bool	| Void	| String	| Float
	| Vector of primitives * num
	| Matrix of primitives * num * num

type datatype = Datatype of primitives

type formal = Formal of datatype*string
type local = Local of datatype*string
type var_dec = datatype*string

(* Expressions *)
type expr =
	| Num_lit of num
	| Bool_lit of bool
	| String_lit of string
	| Matrix_lit of num list list
	| Vector_lit of num list
	| Id of string
	| Noexpr
	| Null
	| Binop of expr * op * expr
	| Unop of uop * expr
	| Assign of expr * expr
	| Call of string * expr list
	| Vector_access of string * expr
	| Matrix_access of string * expr * expr
	| Matrix_row of string * expr
	| Matrix_col of string * expr
	| Rows of string
	| Cols of string
	| Len of string
	| Transpose of string

(* Statements *)
type stmt =
	| Block of stmt list
	| Expr of expr
	| If of expr * stmt * stmt
	| For of expr * expr * expr * stmt
	| While of expr * stmt
	| Return of expr

(* Function Declarations *)
type func_decl = {
	return_type : datatype;
	fname 		: string;
	formals 	: formal list;
	locals  	: local list;
	body 		: stmt list;
}

(* Start Symbol *)
type program = var_dec list * func_decl list
