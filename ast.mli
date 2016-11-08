(* Binary Operators *)
type op =
	| Add
	| Sub
	| Mult
	| Div
	| Equal
	| Neq
	| Less
	| Leq
	| Greater
	| Geq
	| And
	| Or

(* Unary Operators *)
type uop =
	| Neg
	| Not
	| Inc
	| Dec

(* Expressions *)
type expr =
	| Int_lit of int
	| Bool_lit of bool
	| String_lit of string
	| Float_lit of float
	| Matrix_lit of expr list
	| Id of string
	(*| Const of primitives * expr (* ?? is this correct *)*)
	| Noexpr
	| Null
	| Binop of expr * op * expr
	| Unop of uop * expr
	| Assign of string * expr
	| Call of string * expr list
	| Mat_init of expr * expr * expr (* Int_lit instead of expr? *)
	| Matrix_access of string * expr * expr (* Int_lit instead of expr? *)
	| Matrix_row of string * expr
	| Matrix_col of string * expr

(* Types *)
type primitives =
	| Int
	| Bool
	| Void
	| String
	| Float
	| Vector of primitives * int
	| Matrix of primitives * int * int

(* Bind *)
type bind = primitives * string

(* Statements *)
type stmt =
	| Block of stmt list
	| Expr of expr
	| If of expr * stmt * stmt
(*  	| Elseif of expr * stmt * stmt *)
	| Else of stmt
	| For of expr * expr * expr * stmt
	| While of expr * stmt
	| Return of expr
	| Break of expr

(* Function Declarations *)
and func_decl = {
	primitives 	: primitives;
	fname 		: string;
	formals 	: bind list;
	locals  	: bind list;
	body 		: stmt list;
}

and main_decl = {
	mainlocals	: bind list;
	mainbody	: stmt list;
}

(* Start Symbol *)
type program = Program of main_decl * func_decl list
