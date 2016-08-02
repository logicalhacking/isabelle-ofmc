functor OfmcFpParserLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : OfmcFpParser_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *
 * ofmc-fp.grm ---
 * This file is part of Isabelle-OFMC.
 *
 * Copyright (c) 2009 Achim D. Brucker, Germany
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************)


open OfmcFp

fun rmOuterOp (Operator(_,[msg])) = msg
  | rmOuterOp s = s


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\002\000\023\000\000\000\
\\001\000\002\000\023\000\009\000\048\000\000\000\
\\001\000\002\000\034\000\000\000\
\\001\000\002\000\038\000\028\000\037\000\000\000\
\\001\000\002\000\045\000\000\000\
\\001\000\002\000\060\000\014\000\059\000\000\000\
\\001\000\002\000\077\000\000\000\
\\001\000\002\000\107\000\000\000\
\\001\000\002\000\117\000\000\000\
\\001\000\003\000\012\000\020\000\011\000\023\000\010\000\032\000\009\000\000\000\
\\001\000\004\000\069\000\022\000\068\000\031\000\067\000\034\000\066\000\
\\038\000\065\000\041\000\064\000\000\000\
\\001\000\005\000\053\000\000\000\
\\001\000\008\000\043\000\000\000\
\\001\000\008\000\095\000\017\000\094\000\000\000\
\\001\000\008\000\115\000\000\000\
\\001\000\008\000\136\000\017\000\094\000\000\000\
\\001\000\008\000\143\000\000\000\
\\001\000\008\000\150\000\000\000\
\\001\000\009\000\008\000\000\000\
\\001\000\009\000\013\000\000\000\
\\001\000\009\000\014\000\000\000\
\\001\000\009\000\017\000\000\000\
\\001\000\009\000\019\000\000\000\
\\001\000\009\000\020\000\000\000\
\\001\000\009\000\031\000\000\000\
\\001\000\009\000\051\000\000\000\
\\001\000\009\000\061\000\000\000\
\\001\000\012\000\125\000\000\000\
\\001\000\013\000\081\000\026\000\080\000\000\000\
\\001\000\013\000\098\000\026\000\097\000\000\000\
\\001\000\014\000\090\000\015\000\073\000\000\000\
\\001\000\014\000\096\000\000\000\
\\001\000\014\000\127\000\000\000\
\\001\000\015\000\073\000\000\000\
\\001\000\015\000\091\000\000\000\
\\001\000\015\000\118\000\000\000\
\\001\000\015\000\126\000\000\000\
\\001\000\015\000\128\000\000\000\
\\001\000\015\000\129\000\000\000\
\\001\000\015\000\130\000\000\000\
\\001\000\015\000\131\000\000\000\
\\001\000\015\000\132\000\000\000\
\\001\000\015\000\144\000\000\000\
\\001\000\015\000\148\000\000\000\
\\001\000\015\000\151\000\000\000\
\\001\000\017\000\094\000\000\000\
\\001\000\017\000\134\000\000\000\
\\001\000\026\000\124\000\000\000\
\\001\000\026\000\138\000\000\000\
\\001\000\027\000\016\000\000\000\
\\001\000\027\000\076\000\000\000\
\\001\000\027\000\119\000\000\000\
\\001\000\027\000\142\000\000\000\
\\001\000\028\000\028\000\000\000\
\\001\000\028\000\082\000\000\000\
\\001\000\028\000\083\000\000\000\
\\001\000\028\000\084\000\000\000\
\\001\000\028\000\085\000\000\000\
\\001\000\028\000\086\000\000\000\
\\001\000\028\000\087\000\000\000\
\\001\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\001\000\035\000\018\000\000\000\
\\001\000\037\000\088\000\000\000\
\\001\000\039\000\030\000\000\000\
\\153\000\000\000\
\\154\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\155\000\000\000\
\\156\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\157\000\000\000\
\\158\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\159\000\000\000\
\\160\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\161\000\000\000\
\\162\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\163\000\000\000\
\\164\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\165\000\000\000\
\\166\000\029\000\007\000\030\000\006\000\036\000\005\000\040\000\004\000\000\000\
\\167\000\002\000\038\000\028\000\037\000\000\000\
\\168\000\000\000\
\\169\000\039\000\030\000\000\000\
\\170\000\000\000\
\\171\000\039\000\030\000\000\000\
\\172\000\000\000\
\\173\000\039\000\030\000\000\000\
\\174\000\000\000\
\\175\000\039\000\030\000\000\000\
\\176\000\000\000\
\\177\000\002\000\034\000\000\000\
\\178\000\000\000\
\\179\000\037\000\079\000\000\000\
\\180\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\000\000\
\\185\000\000\000\
\\186\000\000\000\
\\187\000\037\000\123\000\000\000\
\\188\000\000\000\
\\189\000\000\000\
\\190\000\014\000\090\000\000\000\
\\191\000\000\000\
\\192\000\002\000\038\000\028\000\056\000\000\000\
\\193\000\000\000\
\\194\000\000\000\
\\195\000\000\000\
\\196\000\000\000\
\\197\000\000\000\
\\198\000\000\000\
\\199\000\037\000\089\000\000\000\
\\200\000\000\000\
\\201\000\000\000\
\\202\000\014\000\044\000\000\000\
\\203\000\000\000\
\\204\000\000\000\
\\205\000\000\000\
\\206\000\000\000\
\\207\000\000\000\
\\208\000\014\000\116\000\000\000\
\\209\000\000\000\
\\210\000\002\000\023\000\006\000\041\000\000\000\
\\211\000\000\000\
\\212\000\000\000\
\\213\000\000\000\
\"
val actionRowNumbers =
"\061\000\065\000\019\000\010\000\
\\020\000\021\000\050\000\022\000\
\\062\000\023\000\024\000\001\000\
\\001\000\070\000\054\000\064\000\
\\025\000\003\000\079\000\068\000\
\\122\000\110\000\066\000\071\000\
\\013\000\114\000\005\000\074\000\
\\002\000\003\000\076\000\026\000\
\\109\000\078\000\012\000\004\000\
\\104\000\069\000\123\000\001\000\
\\067\000\113\000\054\000\006\000\
\\075\000\027\000\011\000\072\000\
\\077\000\011\000\080\000\004\000\
\\034\000\106\000\004\000\124\000\
\\115\000\051\000\007\000\011\000\
\\091\000\029\000\055\000\056\000\
\\057\000\058\000\059\000\060\000\
\\073\000\063\000\111\000\107\000\
\\031\000\035\000\014\000\032\000\
\\030\000\011\000\011\000\004\000\
\\004\000\008\000\004\000\004\000\
\\004\000\004\000\089\000\004\000\
\\004\000\105\000\015\000\120\000\
\\009\000\036\000\052\000\011\000\
\\004\000\092\000\081\000\099\000\
\\048\000\028\000\102\000\037\000\
\\033\000\108\000\038\000\039\000\
\\040\000\041\000\090\000\112\000\
\\103\000\042\000\046\000\047\000\
\\118\000\016\000\085\000\049\000\
\\082\000\004\000\011\000\004\000\
\\097\000\053\000\096\000\098\000\
\\094\000\095\000\116\000\121\000\
\\125\000\017\000\043\000\086\000\
\\011\000\100\000\083\000\101\000\
\\004\000\044\000\119\000\087\000\
\\084\000\018\000\117\000\088\000\
\\045\000\093\000\000\000"
val gotoT =
"\
\\001\000\150\000\002\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\020\000\013\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\003\000\020\000\017\000\019\000\000\000\
\\003\000\022\000\000\000\
\\002\000\023\000\000\000\
\\018\000\025\000\019\000\024\000\000\000\
\\013\000\027\000\000\000\
\\000\000\
\\005\000\031\000\008\000\030\000\000\000\
\\007\000\034\000\014\000\033\000\000\000\
\\002\000\037\000\000\000\
\\003\000\020\000\017\000\038\000\000\000\
\\000\000\
\\002\000\040\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\044\000\000\000\
\\003\000\045\000\000\000\
\\005\000\031\000\008\000\047\000\000\000\
\\002\000\048\000\000\000\
\\000\000\
\\000\000\
\\002\000\050\000\000\000\
\\000\000\
\\007\000\052\000\000\000\
\\007\000\053\000\000\000\
\\000\000\
\\000\000\
\\003\000\020\000\017\000\055\000\000\000\
\\000\000\
\\000\000\
\\018\000\025\000\019\000\056\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\061\000\010\000\060\000\000\000\
\\002\000\068\000\000\000\
\\000\000\
\\010\000\069\000\000\000\
\\000\000\
\\007\000\070\000\000\000\
\\000\000\
\\000\000\
\\006\000\073\000\007\000\072\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\076\000\010\000\060\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\015\000\091\000\016\000\090\000\000\000\
\\000\000\
\\000\000\
\\009\000\097\000\010\000\060\000\000\000\
\\009\000\098\000\010\000\060\000\000\000\
\\007\000\101\000\011\000\100\000\012\000\099\000\000\000\
\\006\000\103\000\007\000\102\000\000\000\
\\004\000\104\000\000\000\
\\006\000\106\000\007\000\102\000\000\000\
\\006\000\107\000\007\000\102\000\000\000\
\\007\000\108\000\000\000\
\\007\000\109\000\000\000\
\\005\000\031\000\008\000\110\000\000\000\
\\007\000\034\000\014\000\111\000\000\000\
\\006\000\112\000\007\000\102\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\118\000\010\000\060\000\000\000\
\\007\000\101\000\011\000\119\000\012\000\099\000\000\000\
\\000\000\
\\013\000\120\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\015\000\091\000\016\000\131\000\000\000\
\\000\000\
\\000\000\
\\015\000\091\000\016\000\133\000\000\000\
\\013\000\135\000\000\000\
\\000\000\
\\000\000\
\\007\000\101\000\011\000\137\000\012\000\099\000\000\000\
\\009\000\138\000\010\000\060\000\000\000\
\\007\000\139\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\143\000\010\000\060\000\000\000\
\\000\000\
\\013\000\144\000\000\000\
\\000\000\
\\006\000\145\000\007\000\102\000\000\000\
\\000\000\
\\000\000\
\\013\000\147\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 151
val numrules = 61
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos =  ( int * int * int ) 
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | TXOR of unit ->  (string) | TWITNESS of unit ->  (string)
 | TTYPES of unit ->  (string) | TSTEP of unit ->  (string)
 | TSTATE of unit ->  (string) | TSEMICOLON of unit ->  (string)
 | TSECTION of unit ->  (string) | TSECSTATE of unit ->  (string)
 | TSECRET of unit ->  (string) | TSCRYPT of unit ->  (string)
 | TRULES of unit ->  (string) | TREQUEST of unit ->  (string)
 | TBACKEND of unit ->  (string) | TPROTOCOL of unit ->  (string)
 | TOPAREN of unit ->  (string) | TOBRACKET of unit ->  (string)
 | TMETAIMPLIES of unit ->  (string) | TKNOWLEDGE of unit ->  (string)
 | TINV of unit ->  (string) | TINITIAL of unit ->  (string)
 | TIKNOWS of unit ->  (string) | TFPState of unit ->  (string)
 | TFIXEDPOINT of unit ->  (string) | TFACT of unit ->  (string)
 | TEXP of unit ->  (string) | TQUOTE of unit ->  (string)
 | TCRYPT of unit ->  (string) | TCPAREN of unit ->  (string)
 | TCOMMA of unit ->  (string) | TBAR of unit ->  (string)
 | TNEQ of unit ->  (string) | TEQ of unit ->  (string)
 | TWHITESPACE of unit ->  (string) | TCOLON of unit ->  (string)
 | TCBRACKET of unit ->  (string) | TCAT of unit ->  (string)
 | TMINUS of unit ->  (string) | TARROW of unit ->  (string)
 | TATTACK of unit ->  (string) | TABSTRACTION of unit ->  (string)
 | SIMPLE_NAME of unit ->  (string)
 | types of unit ->  ( ( string * (string list) )  list)
 | typlist of unit ->  ( ( string * (string list) )  list)
 | typ of unit ->  (string* ( string list ) )
 | simple_names of unit ->  (string)
 | typnames of unit ->  (string list) | typname of unit ->  (string)
 | abstractions of unit ->  ( ( Msg * Msg )  list)
 | rules of unit ->  (Rule list) | nfact of unit ->  (Fact)
 | nfacts of unit ->  (Fact list) | fact of unit ->  (Fact)
 | facts of unit ->  (Fact list)
 | knowledge of unit ->  ( ( string * Fact )  list)
 | msg of unit ->  (Msg) | msglist of unit ->  (Msg list)
 | factname of unit ->  (string) | role of unit ->  (string)
 | simple_name of unit ->  (string) | ofmc_fp of unit ->  (ofmc_fp)
 | START of unit ->  (ofmc_fp)
end
type svalue = MlyValue.svalue
type result = ofmc_fp
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn (T 0) => true | _ => false
val showTerminal =
fn (T 0) => "EOF"
  | (T 1) => "SIMPLE_NAME"
  | (T 2) => "TABSTRACTION"
  | (T 3) => "TATTACK"
  | (T 4) => "TARROW"
  | (T 5) => "TMINUS"
  | (T 6) => "TCAT"
  | (T 7) => "TCBRACKET"
  | (T 8) => "TCOLON"
  | (T 9) => "TWHITESPACE"
  | (T 10) => "TEQ"
  | (T 11) => "TNEQ"
  | (T 12) => "TBAR"
  | (T 13) => "TCOMMA"
  | (T 14) => "TCPAREN"
  | (T 15) => "TCRYPT"
  | (T 16) => "TQUOTE"
  | (T 17) => "TEXP"
  | (T 18) => "TFACT"
  | (T 19) => "TFIXEDPOINT"
  | (T 20) => "TFPState"
  | (T 21) => "TIKNOWS"
  | (T 22) => "TINITIAL"
  | (T 23) => "TINV"
  | (T 24) => "TKNOWLEDGE"
  | (T 25) => "TMETAIMPLIES"
  | (T 26) => "TOBRACKET"
  | (T 27) => "TOPAREN"
  | (T 28) => "TPROTOCOL"
  | (T 29) => "TBACKEND"
  | (T 30) => "TREQUEST"
  | (T 31) => "TRULES"
  | (T 32) => "TSCRYPT"
  | (T 33) => "TSECRET"
  | (T 34) => "TSECSTATE"
  | (T 35) => "TSECTION"
  | (T 36) => "TSEMICOLON"
  | (T 37) => "TSTATE"
  | (T 38) => "TSTEP"
  | (T 39) => "TTYPES"
  | (T 40) => "TWITNESS"
  | (T 41) => "TXOR"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, ofmc_fp1left, 
ofmc_fp1right)) :: rest671)) => let val  result = MlyValue.START (fn _
 => let val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (ofmc_fp)
end)
 in ( LrTable.NT 0, ( result, ofmc_fp1left, ofmc_fp1right), rest671)

end
|  ( 1, ( ( _, ( MlyValue.simple_name simple_name1, _, 
simple_name1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, 
( MlyValue.TPROTOCOL TPROTOCOL1, TPROTOCOL1left, _)) :: rest671)) =>
 let val  result = MlyValue.ofmc_fp (fn _ => let val  TPROTOCOL1 = 
TPROTOCOL1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 in (update_protocol simple_name empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TPROTOCOL1left, simple_name1right), 
rest671)
end
|  ( 2, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _,
 ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TCOLON
 TCOLON1, _, _)) :: ( _, ( MlyValue.TPROTOCOL TPROTOCOL1, 
TPROTOCOL1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp
 (fn _ => let val  TPROTOCOL1 = TPROTOCOL1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_protocol simple_name ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TPROTOCOL1left, ofmc_fp1right), rest671)

end
|  ( 3, ( ( _, ( MlyValue.simple_names simple_names1, _, 
simple_names1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _,
 ( MlyValue.TBACKEND TBACKEND1, TBACKEND1left, _)) :: rest671)) => let
 val  result = MlyValue.ofmc_fp (fn _ => let val  TBACKEND1 = 
TBACKEND1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in (update_backend simple_names empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TBACKEND1left, simple_names1right), 
rest671)
end
|  ( 4, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _,
 ( MlyValue.simple_names simple_names1, _, _)) :: ( _, ( 
MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TBACKEND TBACKEND1,
 TBACKEND1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp
 (fn _ => let val  TBACKEND1 = TBACKEND1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_backend simple_names ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TBACKEND1left, ofmc_fp1right), rest671)

end
|  ( 5, ( ( _, ( MlyValue.types types1, _, types1right)) :: ( _, ( 
MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TTYPES TTYPES1, 
TTYPES1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp
 (fn _ => let val  TTYPES1 = TTYPES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (types as types1) = types1 ()
 in (update_types ((types_of empty_ofmc_fp)@types) empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TTYPES1left, types1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _,
 ( MlyValue.types types1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _,
 _)) :: ( _, ( MlyValue.TTYPES TTYPES1, TTYPES1left, _)) :: rest671))
 => let val  result = MlyValue.ofmc_fp (fn _ => let val  TTYPES1 = 
TTYPES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (types as types1) = types1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_types ((types_of ofmc_fp)@types) ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TTYPES1left, ofmc_fp1right), rest671)

end
|  ( 7, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right))
 :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( 
MlyValue.TSECSTATE TSECSTATE1, _, _)) :: ( _, ( MlyValue.TINITIAL 
TINITIAL1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left
, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let
 val  TSECTION1 = TSECTION1 ()
 val  TINITIAL1 = TINITIAL1 ()
 val  TSECSTATE1 = TSECSTATE1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in (update_knowledge knowledge empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, knowledge1right), rest671
)
end
|  ( 8, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _,
 ( MlyValue.knowledge knowledge1, _, _)) :: ( _, ( MlyValue.TCOLON 
TCOLON1, _, _)) :: ( _, ( MlyValue.TSECSTATE TSECSTATE1, _, _)) :: ( _
, ( MlyValue.TINITIAL TINITIAL1, _, _)) :: ( _, ( MlyValue.TSECTION 
TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = 
MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TINITIAL1 = TINITIAL1 ()
 val  TSECSTATE1 = TSECSTATE1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_knowledge knowledge ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, ofmc_fp1right), rest671)

end
|  ( 9, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( 
MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TRULES TRULES1, _,
 _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: 
rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  
TSECTION1 = TSECTION1 ()
 val  TRULES1 = TRULES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (rules as rules1) = rules1 ()
 in (update_rules rules empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, rules1right), rest671)

end
|  ( 10, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _
, ( MlyValue.rules rules1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _
, _)) :: ( _, ( MlyValue.TRULES TRULES1, _, _)) :: ( _, ( 
MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let
 val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = 
TSECTION1 ()
 val  TRULES1 = TRULES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (rules as rules1) = rules1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_rules rules ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, ofmc_fp1right), rest671)

end
|  ( 11, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right))
 :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( 
MlyValue.TFIXEDPOINT TFIXEDPOINT1, _, _)) :: ( _, ( MlyValue.TSECTION 
TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = 
MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TFIXEDPOINT1 = TFIXEDPOINT1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in (update_fixedpoint knowledge empty_ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, knowledge1right), rest671
)
end
|  ( 12, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _
, ( MlyValue.knowledge knowledge1, _, _)) :: ( _, ( MlyValue.TCOLON 
TCOLON1, _, _)) :: ( _, ( MlyValue.TFIXEDPOINT TFIXEDPOINT1, _, _)) ::
 ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671))
 => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = 
TSECTION1 ()
 val  TFIXEDPOINT1 = TFIXEDPOINT1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (update_fixedpoint knowledge ofmc_fp)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, ofmc_fp1right), rest671)

end
|  ( 13, ( ( _, ( MlyValue.abstractions abstractions1, _, 
abstractions1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _,
 ( MlyValue.TABSTRACTION TABSTRACTION1, _, _)) :: ( _, ( 
MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let
 val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = 
TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 in (
update_abstractions ((abstractions_of empty_ofmc_fp )@abstractions) empty_ofmc_fp
)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, abstractions1right), 
rest671)
end
|  ( 14, ( ( _, ( MlyValue.TCOLON TCOLON1, _, TCOLON1right)) :: ( _, (
 MlyValue.TABSTRACTION TABSTRACTION1, _, _)) :: ( _, ( 
MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let
 val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = 
TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 in (
update_abstractions ((abstractions_of empty_ofmc_fp )@[]) empty_ofmc_fp
)
end)
 in ( LrTable.NT 1, ( result, TSECTION1left, TCOLON1right), rest671)

end
|  ( 15, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _
, ( MlyValue.abstractions abstractions1, _, _)) :: ( _, ( 
MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TABSTRACTION 
TABSTRACTION1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, 
TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp
 (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in (
update_abstractions ((abstractions_of ofmc_fp)@abstractions) ofmc_fp)

end)
 in ( LrTable.NT 1, ( result, TSECTION1left, ofmc_fp1right), rest671)

end
|  ( 16, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( 
MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts 
facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( 
MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result
 = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ([(NONE, facts1, facts2)])
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( 
MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES 
TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, 
( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, 
TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _
 => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((NONE, facts1, facts2)::rules)
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( 
MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts 
nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( 
MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)
) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let
 val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (facts as facts1) = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ([(NONE, facts1@nfacts, facts)])
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( 
MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES 
TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _
, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)
) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP 
TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = 
MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (facts as facts1) = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((NONE, facts1@nfacts, facts)::rules)
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( 
MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts 
facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( 
MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP 
TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = 
MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ([(SOME simple_name, facts1, facts2)])
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( 
MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES 
TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, 
( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.simple_name 
simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _))
 :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  
TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((SOME simple_name, facts1, facts2)::rules)
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( 
MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts 
nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( 
MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)
) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( 
MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result
 = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ([(SOME simple_name, facts1@nfacts, facts2)])
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( 
MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES 
TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _
, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)
) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( 
MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP 
TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = 
MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((SOME simple_name, facts1@nfacts, facts2)::rules)
end)
 in ( LrTable.NT 12, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, TSEMICOLON1right
)) :: ( _, ( MlyValue.fact fact1, _, _)) :: ( _, ( MlyValue.TCOLON 
TCOLON1, _, _)) :: ( _, ( MlyValue.factname factname1, factname1left,
 _)) :: rest671)) => let val  result = MlyValue.knowledge (fn _ => let
 val  (factname as factname1) = factname1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 in ([(factname, fact)])
end)
 in ( LrTable.NT 7, ( result, factname1left, TSEMICOLON1right), 
rest671)
end
|  ( 25, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right))
 :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( 
MlyValue.fact fact1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _))
 :: ( _, ( MlyValue.factname factname1, factname1left, _)) :: rest671)
) => let val  result = MlyValue.knowledge (fn _ => let val  (factname
 as factname1) = factname1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in ((factname, fact)::(knowledge))
end)
 in ( LrTable.NT 7, ( result, factname1left, knowledge1right), rest671
)
end
|  ( 26, ( ( _, ( MlyValue.fact fact1, fact1left, fact1right)) :: 
rest671)) => let val  result = MlyValue.facts (fn _ => let val  (fact
 as fact1) = fact1 ()
 in ([fact])
end)
 in ( LrTable.NT 8, ( result, fact1left, fact1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.facts facts1, _, facts1right)) :: ( _, ( 
MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.fact fact1,
 fact1left, _)) :: rest671)) => let val  result = MlyValue.facts (fn _
 => let val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (facts as facts1) = facts1 ()
 in (fact::facts)
end)
 in ( LrTable.NT 8, ( result, fact1left, facts1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.msglist 
msglist1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: (
 _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.role role1, _
, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( 
MlyValue.TSTATE TSTATE1, TSTATE1left, _)) :: rest671)) => let val  
result = MlyValue.fact (fn _ => let val  TSTATE1 = TSTATE1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (role as role1) = role1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (State(role, msglist))
end)
 in ( LrTable.NT 9, ( result, TSTATE1left, TCPAREN1right), rest671)

end
|  ( 29, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msg msg1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _,
 _)) :: ( _, ( MlyValue.TIKNOWS TIKNOWS1, TIKNOWS1left, _)) :: rest671
)) => let val  result = MlyValue.fact (fn _ => let val  TIKNOWS1 = 
TIKNOWS1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msg as msg1) = msg1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Iknows(msg))
end)
 in ( LrTable.NT 9, ( result, TIKNOWS1left, TCPAREN1right), rest671)

end
|  ( 30, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msg msg1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _,
 _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671
)) => let val  result = MlyValue.fact (fn _ => let val  TATTACK1 = 
TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msg as msg1) = msg1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Attack(msg))
end)
 in ( LrTable.NT 9, ( result, TATTACK1left, TCPAREN1right), rest671)

end
|  ( 31, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN 
TOPAREN1, _, _)) :: ( _, ( MlyValue.TSECRET TSECRET1, TSECRET1left, _)
) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  
TSECRET1 = TSECRET1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Secret(msglist))
end)
 in ( LrTable.NT 9, ( result, TSECRET1left, TCPAREN1right), rest671)

end
|  ( 32, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN 
TOPAREN1, _, _)) :: ( _, ( MlyValue.TWITNESS TWITNESS1, TWITNESS1left,
 _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val 
 TWITNESS1 = TWITNESS1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Witness(msglist))
end)
 in ( LrTable.NT 9, ( result, TWITNESS1left, TCPAREN1right), rest671)

end
|  ( 33, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN 
TOPAREN1, _, _)) :: ( _, ( MlyValue.TREQUEST TREQUEST1, TREQUEST1left,
 _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val 
 TREQUEST1 = TREQUEST1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Request(msglist))
end)
 in ( LrTable.NT 9, ( result, TREQUEST1left, TCPAREN1right), rest671)

end
|  ( 34, ( ( _, ( MlyValue.nfact nfact1, nfact1left, nfact1right)) :: 
rest671)) => let val  result = MlyValue.nfacts (fn _ => let val  (
nfact as nfact1) = nfact1 ()
 in ([nfact])
end)
 in ( LrTable.NT 10, ( result, nfact1left, nfact1right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.nfacts nfacts1, _, nfacts1right)) :: ( _, (
 MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.nfact 
nfact1, nfact1left, _)) :: rest671)) => let val  result = 
MlyValue.nfacts (fn _ => let val  (nfact as nfact1) = nfact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 in (nfact::nfacts)
end)
 in ( LrTable.NT 10, ( result, nfact1left, nfacts1right), rest671)
end
|  ( 36, ( ( _, ( MlyValue.msg msg2, _, msg2right)) :: ( _, ( 
MlyValue.TNEQ TNEQ1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _))
 :: rest671)) => let val  result = MlyValue.nfact (fn _ => let val  
msg1 = msg1 ()
 val  TNEQ1 = TNEQ1 ()
 val  msg2 = msg2 ()
 in (NotEqual(msg1,msg2))
end)
 in ( LrTable.NT 11, ( result, msg1left, msg2right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.msg msg1, msg1left, msg1right)) :: rest671)
) => let val  result = MlyValue.msglist (fn _ => let val  (msg as msg1
) = msg1 ()
 in ([msg])
end)
 in ( LrTable.NT 5, ( result, msg1left, msg1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.msglist msglist1, _, msglist1right)) :: ( _
, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.msg msg1, 
msg1left, _)) :: rest671)) => let val  result = MlyValue.msglist (fn _
 => let val  (msg as msg1) = msg1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (msglist as msglist1) = msglist1 ()
 in (msg::msglist)
end)
 in ( LrTable.NT 5, ( result, msg1left, msglist1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left,
 SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.msg
 (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in (Atom SIMPLE_NAME)
end)
 in ( LrTable.NT 6, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), 
rest671)
end
|  ( 40, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN 
TOPAREN1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, 
SIMPLE_NAME1left, _)) :: rest671)) => let val  result = MlyValue.msg
 (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (Operator(SIMPLE_NAME,msglist))
end)
 in ( LrTable.NT 6, ( result, SIMPLE_NAME1left, TCPAREN1right), 
rest671)
end
|  ( 41, ( ( _, ( MlyValue.msg msg1, _, msg1right)) :: ( _, ( 
MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, _)) :: rest671))
 => let val  result = MlyValue.msg (fn _ => let val  (SIMPLE_NAME as 
SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  (msg as msg1) = msg1 ()
 in (Operator(SIMPLE_NAME,[msg]))
end)
 in ( LrTable.NT 6, ( result, SIMPLE_NAME1left, msg1right), rest671)

end
|  ( 42, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.msg msg1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, 
TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.msg (fn _
 => let val  TOPAREN1 = TOPAREN1 ()
 val  (msg as msg1) = msg1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in (msg)
end)
 in ( LrTable.NT 6, ( result, TOPAREN1left, TCPAREN1right), rest671)

end
|  ( 43, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left,
 SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.role
 (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in (SIMPLE_NAME)
end)
 in ( LrTable.NT 3, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), 
rest671)
end
|  ( 44, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left,
 SIMPLE_NAME1right)) :: rest671)) => let val  result = 
MlyValue.factname (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = 
SIMPLE_NAME1 ()
 in (SIMPLE_NAME)
end)
 in ( LrTable.NT 4, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), 
rest671)
end
|  ( 45, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left,
 SIMPLE_NAME1right)) :: rest671)) => let val  result = 
MlyValue.simple_name (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) =
 SIMPLE_NAME1 ()
 in (SIMPLE_NAME)
end)
 in ( LrTable.NT 2, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), 
rest671)
end
|  ( 46, ( ( _, ( MlyValue.msg msg2, _, msg2right)) :: ( _, ( 
MlyValue.TARROW TARROW1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left,
 _)) :: rest671)) => let val  result = MlyValue.abstractions (fn _ =>
 let val  msg1 = msg1 ()
 val  TARROW1 = TARROW1 ()
 val  msg2 = msg2 ()
 in ([(rmOuterOp msg2,msg1)])
end)
 in ( LrTable.NT 13, ( result, msg1left, msg2right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.abstractions abstractions1, _, 
abstractions1right)) :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _))
 :: ( _, ( MlyValue.msg msg2, _, _)) :: ( _, ( MlyValue.TARROW TARROW1
, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _)) :: rest671)) =>
 let val  result = MlyValue.abstractions (fn _ => let val  msg1 = msg1
 ()
 val  TARROW1 = TARROW1 ()
 val  msg2 = msg2 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 in ((rmOuterOp msg2,msg1)::abstractions)
end)
 in ( LrTable.NT 13, ( result, msg1left, abstractions1right), rest671)

end
|  ( 48, ( ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, TCBRACKET1right))
 :: ( _, ( MlyValue.typlist typlist1, _, _)) :: ( _, ( 
MlyValue.TOBRACKET TOBRACKET1, TOBRACKET1left, _)) :: rest671)) => let
 val  result = MlyValue.types (fn _ => let val  TOBRACKET1 = 
TOBRACKET1 ()
 val  (typlist as typlist1) = typlist1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 in (typlist)
end)
 in ( LrTable.NT 19, ( result, TOBRACKET1left, TCBRACKET1right), 
rest671)
end
|  ( 49, ( ( _, ( MlyValue.typ typ1, typ1left, typ1right)) :: rest671)
) => let val  result = MlyValue.typlist (fn _ => let val  (typ as typ1
) = typ1 ()
 in ([typ])
end)
 in ( LrTable.NT 18, ( result, typ1left, typ1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.typlist typlist1, _, typlist1right)) :: ( _
, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.typ typ1, 
typ1left, _)) :: rest671)) => let val  result = MlyValue.typlist (fn _
 => let val  (typ as typ1) = typ1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (typlist as typlist1) = typlist1 ()
 in (typ::typlist)
end)
 in ( LrTable.NT 18, ( result, typ1left, typlist1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.typnames 
typnames1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: (
 _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME 
SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left
, _)) :: rest671)) => let val  result = MlyValue.typ (fn _ => let val 
 TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (typnames as typnames1) = typnames1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((SIMPLE_NAME,typnames))
end)
 in ( LrTable.NT 17, ( result, TOPAREN1left, TCPAREN1right), rest671)

end
|  ( 52, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.typnames 
typnames1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: (
 _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME 
SIMPLE_NAME3, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME2, _, _
)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( 
MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  
result = MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  SIMPLE_NAME2 = SIMPLE_NAME2 ()
 val  SIMPLE_NAME3 = SIMPLE_NAME3 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (typnames as typnames1) = typnames1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((SIMPLE_NAME,typnames))
end)
 in ( LrTable.NT 17, ( result, TOPAREN1left, TCPAREN1right), rest671)

end
|  ( 53, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.TOBRACKET
 TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, 
( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN
 TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = 
MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((SIMPLE_NAME,[]))
end)
 in ( LrTable.NT 17, ( result, TOPAREN1left, TCPAREN1right), rest671)

end
|  ( 54, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _
, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.TOBRACKET
 TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, 
( MlyValue.SIMPLE_NAME SIMPLE_NAME3, _, _)) :: ( _, ( 
MlyValue.SIMPLE_NAME SIMPLE_NAME2, _, _)) :: ( _, ( 
MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN 
TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = 
MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  SIMPLE_NAME2 = SIMPLE_NAME2 ()
 val  SIMPLE_NAME3 = SIMPLE_NAME3 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((SIMPLE_NAME,[]))
end)
 in ( LrTable.NT 17, ( result, TOPAREN1left, TCPAREN1right), rest671)

end
|  ( 55, ( ( _, ( MlyValue.typname typname1, typname1left, 
typname1right)) :: rest671)) => let val  result = MlyValue.typnames
 (fn _ => let val  (typname as typname1) = typname1 ()
 in ([typname])
end)
 in ( LrTable.NT 15, ( result, typname1left, typname1right), rest671)

end
|  ( 56, ( ( _, ( MlyValue.typnames typnames1, _, typnames1right)) :: 
( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.typname 
typname1, typname1left, _)) :: rest671)) => let val  result = 
MlyValue.typnames (fn _ => let val  (typname as typname1) = typname1
 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (typnames as typnames1) = typnames1 ()
 in (typname::typnames)
end)
 in ( LrTable.NT 15, ( result, typname1left, typnames1right), rest671)

end
|  ( 57, ( ( _, ( MlyValue.simple_name simple_name1, simple_name1left,
 simple_name1right)) :: rest671)) => let val  result = 
MlyValue.simple_names (fn _ => let val  (simple_name as simple_name1)
 = simple_name1 ()
 in (simple_name)
end)
 in ( LrTable.NT 16, ( result, simple_name1left, simple_name1right), 
rest671)
end
|  ( 58, ( ( _, ( MlyValue.simple_names simple_names1, _, 
simple_names1right)) :: ( _, ( MlyValue.simple_name simple_name1, 
simple_name1left, _)) :: rest671)) => let val  result = 
MlyValue.simple_names (fn _ => let val  (simple_name as simple_name1)
 = simple_name1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in (simple_name^" "^simple_names)
end)
 in ( LrTable.NT 16, ( result, simple_name1left, simple_names1right), 
rest671)
end
|  ( 59, ( ( _, ( MlyValue.simple_names simple_names1, _, 
simple_names1right)) :: ( _, ( MlyValue.TMINUS TMINUS1, _, _)) :: ( _,
 ( MlyValue.simple_name simple_name1, simple_name1left, _)) :: rest671
)) => let val  result = MlyValue.simple_names (fn _ => let val  (
simple_name as simple_name1) = simple_name1 ()
 val  TMINUS1 = TMINUS1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in (simple_name^" "^simple_names)
end)
 in ( LrTable.NT 16, ( result, simple_name1left, simple_names1right), 
rest671)
end
|  ( 60, ( ( _, ( MlyValue.TQUOTE TQUOTE2, _, TQUOTE2right)) :: ( _, (
 MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TQUOTE 
TQUOTE1, TQUOTE1left, _)) :: rest671)) => let val  result = 
MlyValue.typname (fn _ => let val  TQUOTE1 = TQUOTE1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TQUOTE2 = TQUOTE2 ()
 in (SIMPLE_NAME)
end)
 in ( LrTable.NT 14, ( result, TQUOTE1left, TQUOTE2right), rest671)

end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.START x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : OfmcFpParser_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun SIMPLE_NAME (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.SIMPLE_NAME (fn () => i),p1,p2))
fun TABSTRACTION (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.TABSTRACTION (fn () => i),p1,p2))
fun TATTACK (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.TATTACK (fn () => i),p1,p2))
fun TARROW (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.TARROW (fn () => i),p1,p2))
fun TMINUS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.TMINUS (fn () => i),p1,p2))
fun TCAT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.TCAT (fn () => i),p1,p2))
fun TCBRACKET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.TCBRACKET (fn () => i),p1,p2))
fun TCOLON (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.TCOLON (fn () => i),p1,p2))
fun TWHITESPACE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.TWHITESPACE (fn () => i),p1,p2))
fun TEQ (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.TEQ (fn () => i),p1,p2))
fun TNEQ (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.TNEQ (fn () => i),p1,p2))
fun TBAR (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.TBAR (fn () => i),p1,p2))
fun TCOMMA (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.TCOMMA (fn () => i),p1,p2))
fun TCPAREN (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.TCPAREN (fn () => i),p1,p2))
fun TCRYPT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.TCRYPT (fn () => i),p1,p2))
fun TQUOTE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.TQUOTE (fn () => i),p1,p2))
fun TEXP (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.TEXP (fn () => i),p1,p2))
fun TFACT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.TFACT (fn () => i),p1,p2))
fun TFIXEDPOINT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.TFIXEDPOINT (fn () => i),p1,p2))
fun TFPState (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.TFPState (fn () => i),p1,p2))
fun TIKNOWS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.TIKNOWS (fn () => i),p1,p2))
fun TINITIAL (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.TINITIAL (fn () => i),p1,p2))
fun TINV (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.TINV (fn () => i),p1,p2))
fun TKNOWLEDGE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.TKNOWLEDGE (fn () => i),p1,p2))
fun TMETAIMPLIES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.TMETAIMPLIES (fn () => i),p1,p2))
fun TOBRACKET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.TOBRACKET (fn () => i),p1,p2))
fun TOPAREN (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.TOPAREN (fn () => i),p1,p2))
fun TPROTOCOL (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.TPROTOCOL (fn () => i),p1,p2))
fun TBACKEND (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.TBACKEND (fn () => i),p1,p2))
fun TREQUEST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.TREQUEST (fn () => i),p1,p2))
fun TRULES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.TRULES (fn () => i),p1,p2))
fun TSCRYPT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.TSCRYPT (fn () => i),p1,p2))
fun TSECRET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.TSECRET (fn () => i),p1,p2))
fun TSECSTATE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.TSECSTATE (fn () => i),p1,p2))
fun TSECTION (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.TSECTION (fn () => i),p1,p2))
fun TSEMICOLON (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.TSEMICOLON (fn () => i),p1,p2))
fun TSTATE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.TSTATE (fn () => i),p1,p2))
fun TSTEP (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.TSTEP (fn () => i),p1,p2))
fun TTYPES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.TTYPES (fn () => i),p1,p2))
fun TWITNESS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.TWITNESS (fn () => i),p1,p2))
fun TXOR (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.TXOR (fn () => i),p1,p2))
end
end
