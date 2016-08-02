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
(*#line 1.2 "ofmc-fp.grm"*)(*****************************************************************************
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


(*#line 50.1 "ofmc-fp.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\002\000\007\000\000\000\
\\001\000\002\000\007\000\009\000\069\000\000\000\
\\001\000\002\000\020\000\030\000\019\000\000\000\
\\001\000\002\000\047\000\000\000\
\\001\000\002\000\059\000\000\000\
\\001\000\002\000\062\000\000\000\
\\001\000\002\000\066\000\000\000\
\\001\000\002\000\079\000\014\000\078\000\000\000\
\\001\000\002\000\095\000\000\000\
\\001\000\002\000\123\000\000\000\
\\001\000\002\000\133\000\000\000\
\\001\000\002\000\175\000\006\000\174\000\014\000\173\000\015\000\172\000\
\\016\000\171\000\017\000\170\000\024\000\169\000\030\000\168\000\
\\036\000\167\000\000\000\
\\001\000\003\000\033\000\022\000\032\000\025\000\031\000\034\000\030\000\000\000\
\\001\000\004\000\075\000\000\000\
\\001\000\004\000\088\000\024\000\087\000\033\000\086\000\036\000\085\000\
\\040\000\084\000\043\000\083\000\000\000\
\\001\000\004\000\108\000\000\000\
\\001\000\005\000\074\000\000\000\
\\001\000\008\000\064\000\000\000\
\\001\000\008\000\112\000\019\000\111\000\000\000\
\\001\000\008\000\131\000\000\000\
\\001\000\008\000\153\000\019\000\111\000\000\000\
\\001\000\008\000\161\000\000\000\
\\001\000\008\000\178\000\000\000\
\\001\000\009\000\004\000\000\000\
\\001\000\009\000\013\000\000\000\
\\001\000\009\000\029\000\000\000\
\\001\000\009\000\043\000\000\000\
\\001\000\009\000\045\000\000\000\
\\001\000\009\000\046\000\000\000\
\\001\000\009\000\056\000\000\000\
\\001\000\009\000\072\000\000\000\
\\001\000\009\000\080\000\000\000\
\\001\000\009\000\092\000\000\000\
\\001\000\012\000\141\000\000\000\
\\001\000\013\000\099\000\028\000\098\000\000\000\
\\001\000\013\000\115\000\028\000\114\000\000\000\
\\001\000\014\000\024\000\015\000\038\000\000\000\
\\001\000\014\000\113\000\000\000\
\\001\000\014\000\143\000\000\000\
\\001\000\015\000\025\000\000\000\
\\001\000\015\000\038\000\000\000\
\\001\000\015\000\049\000\000\000\
\\001\000\015\000\076\000\000\000\
\\001\000\015\000\134\000\000\000\
\\001\000\015\000\142\000\000\000\
\\001\000\015\000\144\000\000\000\
\\001\000\015\000\145\000\000\000\
\\001\000\015\000\146\000\000\000\
\\001\000\015\000\147\000\000\000\
\\001\000\015\000\149\000\000\000\
\\001\000\015\000\160\000\000\000\
\\001\000\015\000\162\000\000\000\
\\001\000\015\000\176\000\000\000\
\\001\000\015\000\188\000\000\000\
\\001\000\019\000\111\000\000\000\
\\001\000\019\000\151\000\000\000\
\\001\000\028\000\140\000\000\000\
\\001\000\028\000\155\000\000\000\
\\001\000\029\000\042\000\000\000\
\\001\000\029\000\094\000\000\000\
\\001\000\029\000\135\000\000\000\
\\001\000\029\000\159\000\000\000\
\\001\000\030\000\014\000\000\000\
\\001\000\030\000\048\000\000\000\
\\001\000\030\000\053\000\000\000\
\\001\000\030\000\100\000\000\000\
\\001\000\030\000\101\000\000\000\
\\001\000\030\000\102\000\000\000\
\\001\000\030\000\103\000\000\000\
\\001\000\030\000\104\000\000\000\
\\001\000\030\000\105\000\000\000\
\\001\000\030\000\130\000\000\000\
\\001\000\032\000\003\000\000\000\
\\001\000\037\000\044\000\000\000\
\\001\000\039\000\106\000\000\000\
\\001\000\041\000\055\000\000\000\
\\190\000\004\000\010\000\031\000\009\000\000\000\
\\191\000\000\000\
\\192\000\038\000\023\000\042\000\022\000\000\000\
\\193\000\000\000\
\\194\000\004\000\037\000\045\000\036\000\000\000\
\\195\000\000\000\
\\196\000\004\000\037\000\045\000\036\000\000\000\
\\197\000\000\000\
\\198\000\000\000\
\\199\000\038\000\023\000\042\000\022\000\000\000\
\\200\000\000\000\
\\201\000\038\000\023\000\042\000\022\000\000\000\
\\202\000\000\000\
\\203\000\038\000\023\000\042\000\022\000\000\000\
\\204\000\000\000\
\\205\000\038\000\023\000\042\000\022\000\000\000\
\\206\000\000\000\
\\207\000\038\000\023\000\042\000\022\000\000\000\
\\208\000\002\000\020\000\030\000\019\000\000\000\
\\209\000\000\000\
\\210\000\000\000\
\\211\000\000\000\
\\212\000\000\000\
\\213\000\000\000\
\\214\000\000\000\
\\215\000\002\000\175\000\006\000\174\000\014\000\173\000\015\000\172\000\
\\016\000\171\000\017\000\170\000\024\000\169\000\030\000\168\000\
\\036\000\167\000\000\000\
\\216\000\000\000\
\\217\000\000\000\
\\218\000\000\000\
\\219\000\002\000\175\000\006\000\174\000\014\000\173\000\015\000\172\000\
\\016\000\171\000\017\000\170\000\024\000\169\000\030\000\168\000\
\\036\000\167\000\000\000\
\\220\000\002\000\175\000\006\000\174\000\014\000\173\000\015\000\172\000\
\\016\000\171\000\017\000\170\000\024\000\169\000\030\000\168\000\
\\036\000\167\000\000\000\
\\221\000\000\000\
\\222\000\002\000\175\000\006\000\174\000\014\000\173\000\015\000\172\000\
\\016\000\171\000\017\000\170\000\024\000\169\000\030\000\168\000\
\\036\000\167\000\000\000\
\\223\000\041\000\055\000\000\000\
\\224\000\000\000\
\\225\000\041\000\055\000\000\000\
\\226\000\000\000\
\\227\000\041\000\055\000\000\000\
\\228\000\000\000\
\\229\000\041\000\055\000\000\000\
\\230\000\000\000\
\\231\000\002\000\059\000\000\000\
\\232\000\000\000\
\\233\000\039\000\097\000\000\000\
\\234\000\000\000\
\\235\000\000\000\
\\236\000\000\000\
\\237\000\000\000\
\\238\000\000\000\
\\239\000\000\000\
\\240\000\000\000\
\\241\000\039\000\139\000\000\000\
\\242\000\000\000\
\\243\000\000\000\
\\244\000\014\000\024\000\000\000\
\\245\000\000\000\
\\246\000\002\000\020\000\030\000\028\000\000\000\
\\247\000\000\000\
\\248\000\000\000\
\\249\000\000\000\
\\250\000\000\000\
\\251\000\000\000\
\\252\000\000\000\
\\253\000\039\000\107\000\000\000\
\\254\000\000\000\
\\255\000\000\000\
\\000\001\014\000\065\000\000\000\
\\001\001\000\000\
\\002\001\000\000\
\\003\001\000\000\
\\004\001\000\000\
\\005\001\000\000\
\\006\001\014\000\132\000\000\000\
\\007\001\000\000\
\\008\001\002\000\007\000\006\000\012\000\000\000\
\\009\001\000\000\
\\010\001\000\000\
\\011\001\000\000\
\"
val actionRowNumbers =
"\073\000\024\000\001\000\077\000\
\\151\000\139\000\078\000\025\000\
\\063\000\152\000\001\000\001\000\
\\003\000\153\000\079\000\131\000\
\\040\000\003\000\133\000\080\000\
\\026\000\013\000\003\000\081\000\
\\041\000\135\000\003\000\059\000\
\\027\000\074\000\028\000\029\000\
\\132\000\082\000\004\000\064\000\
\\136\000\037\000\042\000\086\000\
\\065\000\076\000\030\000\005\000\
\\095\000\006\000\003\000\134\000\
\\087\000\018\000\143\000\007\000\
\\090\000\002\000\005\000\092\000\
\\031\000\138\000\094\000\017\000\
\\014\000\043\000\142\000\065\000\
\\008\000\091\000\032\000\015\000\
\\088\000\093\000\015\000\096\000\
\\003\000\033\000\083\000\144\000\
\\060\000\009\000\015\000\120\000\
\\035\000\066\000\067\000\068\000\
\\069\000\070\000\071\000\089\000\
\\075\000\140\000\016\000\084\000\
\\019\000\038\000\036\000\015\000\
\\015\000\003\000\003\000\010\000\
\\003\000\003\000\003\000\003\000\
\\118\000\003\000\072\000\020\000\
\\149\000\011\000\044\000\061\000\
\\015\000\003\000\121\000\110\000\
\\128\000\057\000\034\000\045\000\
\\039\000\137\000\046\000\047\000\
\\048\000\049\000\119\000\141\000\
\\003\000\050\000\055\000\056\000\
\\147\000\021\000\114\000\058\000\
\\111\000\003\000\015\000\003\000\
\\125\000\062\000\124\000\126\000\
\\123\000\127\000\051\000\145\000\
\\150\000\154\000\022\000\052\000\
\\115\000\015\000\129\000\112\000\
\\130\000\003\000\012\000\053\000\
\\148\000\116\000\113\000\023\000\
\\085\000\012\000\012\000\012\000\
\\102\000\012\000\106\000\107\000\
\\012\000\109\000\146\000\117\000\
\\054\000\099\000\103\000\098\000\
\\101\000\100\000\104\000\105\000\
\\097\000\108\000\122\000\000\000"
val gotoT =
"\
\\001\000\187\000\000\000\
\\000\000\
\\006\000\004\000\020\000\003\000\000\000\
\\005\000\006\000\000\000\
\\006\000\004\000\020\000\009\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\004\000\020\000\013\000\000\000\
\\006\000\014\000\000\000\
\\009\000\016\000\010\000\015\000\000\000\
\\000\000\
\\003\000\019\000\000\000\
\\000\000\
\\000\000\
\\010\000\024\000\000\000\
\\010\000\025\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\032\000\010\000\015\000\000\000\
\\004\000\033\000\000\000\
\\000\000\
\\000\000\
\\009\000\038\000\010\000\037\000\000\000\
\\023\000\039\000\000\000\
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
\\003\000\048\000\000\000\
\\021\000\050\000\022\000\049\000\000\000\
\\016\000\052\000\000\000\
\\000\000\
\\008\000\056\000\011\000\055\000\000\000\
\\010\000\059\000\017\000\058\000\000\000\
\\000\000\
\\009\000\061\000\010\000\015\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\003\000\065\000\000\000\
\\006\000\066\000\000\000\
\\008\000\056\000\011\000\068\000\000\000\
\\003\000\069\000\000\000\
\\000\000\
\\000\000\
\\003\000\071\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\021\000\050\000\022\000\075\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\080\000\013\000\079\000\000\000\
\\003\000\087\000\000\000\
\\000\000\
\\013\000\088\000\000\000\
\\000\000\
\\010\000\089\000\000\000\
\\000\000\
\\004\000\091\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\094\000\013\000\079\000\000\000\
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
\\018\000\108\000\019\000\107\000\000\000\
\\000\000\
\\000\000\
\\012\000\114\000\013\000\079\000\000\000\
\\012\000\115\000\013\000\079\000\000\000\
\\010\000\118\000\014\000\117\000\015\000\116\000\000\000\
\\009\000\119\000\010\000\015\000\000\000\
\\007\000\120\000\000\000\
\\009\000\122\000\010\000\015\000\000\000\
\\009\000\123\000\010\000\015\000\000\000\
\\010\000\124\000\000\000\
\\009\000\125\000\010\000\015\000\000\000\
\\008\000\056\000\011\000\126\000\000\000\
\\010\000\059\000\017\000\127\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\134\000\013\000\079\000\000\000\
\\010\000\118\000\014\000\135\000\015\000\116\000\000\000\
\\000\000\
\\016\000\136\000\000\000\
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
\\009\000\146\000\010\000\015\000\000\000\
\\000\000\
\\018\000\108\000\019\000\148\000\000\000\
\\000\000\
\\000\000\
\\018\000\108\000\019\000\150\000\000\000\
\\016\000\152\000\000\000\
\\000\000\
\\000\000\
\\010\000\118\000\014\000\154\000\015\000\116\000\000\000\
\\012\000\155\000\013\000\079\000\000\000\
\\010\000\156\000\000\000\
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
\\012\000\161\000\013\000\079\000\000\000\
\\000\000\
\\016\000\162\000\000\000\
\\000\000\
\\009\000\163\000\010\000\015\000\000\000\
\\002\000\164\000\000\000\
\\000\000\
\\000\000\
\\016\000\175\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\177\000\000\000\
\\002\000\178\000\000\000\
\\002\000\179\000\000\000\
\\002\000\180\000\000\000\
\\002\000\181\000\000\000\
\\002\000\182\000\000\000\
\\002\000\183\000\000\000\
\\002\000\184\000\000\000\
\\002\000\185\000\000\000\
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
\"
val numstates = 188
val numrules = 78
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
datatype svalue = VOID | ntVOID of unit ->  unit | TDERIVATION of unit ->  (string) | TXOR of unit ->  (string) | TWITNESS of unit ->  (string) | TTYPES of unit ->  (string) | TSTEP of unit ->  (string) | TSTATE of unit ->  (string) | TSEMICOLON of unit ->  (string) | TSECTION of unit ->  (string) | TSECSTATE of unit ->  (string) | TSECRET of unit ->  (string) | TSCRYPT of unit ->  (string) | TRULES of unit ->  (string) | TREQUEST of unit ->  (string) | TBACKEND of unit ->  (string) | TPROTOCOL of unit ->  (string) | TOPAREN of unit ->  (string) | TOBRACKET of unit ->  (string) | TMETAIMPLIES of unit ->  (string) | TKNOWLEDGE of unit ->  (string) | TINV of unit ->  (string) | TINITIAL of unit ->  (string) | TIKNOWS of unit ->  (string) | TFPState of unit ->  (string) | TFIXEDPOINT of unit ->  (string) | TFACT of unit ->  (string) | TEXP of unit ->  (string) | TQUOTE of unit ->  (string) | TCRYPT of unit ->  (string) | TCBRACE of unit ->  (string) | TOBRACE of unit ->  (string) | TCPAREN of unit ->  (string) | TCOMMA of unit ->  (string) | TBAR of unit ->  (string) | TNEQ of unit ->  (string) | TEQ of unit ->  (string) | TWHITESPACE of unit ->  (string) | TCOLON of unit ->  (string) | TCBRACKET of unit ->  (string) | TCAT of unit ->  (string) | TMINUS of unit ->  (string) | TARROW of unit ->  (string) | TATTACK of unit ->  (string) | TABSTRACTION of unit ->  (string) | SIMPLE_NAME of unit ->  (string) | types of unit ->  ( ( string * (string list) )  list) | typlist of unit ->  ( ( string * (string list) )  list) | typ of unit ->  (string* ( string list ) ) | simple_names of unit ->  (string) | typnames of unit ->  (string list) | typname of unit ->  (string) | abstractions of unit ->  ( ( Msg * Msg )  list) | rules of unit ->  (Rule list) | nfact of unit ->  (Fact) | nfacts of unit ->  (Fact list) | fact of unit ->  (Fact) | facts of unit ->  (Fact list) | knowledge of unit ->  ( ( string * Fact )  list) | msg of unit ->  (Msg) | msglist of unit ->  (Msg list) | factname of unit ->  (string) | role of unit ->  (string) | simple_name of unit ->  (string) | fp_or_attack of unit ->  (ofmc_fp) | attackinfo of unit ->  (ofmc_fp) | ofmc_fp of unit ->  (ofmc_fp) | trace of unit ->  (ofmc_fp) | START of unit ->  (ofmc_fp)
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
  | (T 15) => "TOBRACE"
  | (T 16) => "TCBRACE"
  | (T 17) => "TCRYPT"
  | (T 18) => "TQUOTE"
  | (T 19) => "TEXP"
  | (T 20) => "TFACT"
  | (T 21) => "TFIXEDPOINT"
  | (T 22) => "TFPState"
  | (T 23) => "TIKNOWS"
  | (T 24) => "TINITIAL"
  | (T 25) => "TINV"
  | (T 26) => "TKNOWLEDGE"
  | (T 27) => "TMETAIMPLIES"
  | (T 28) => "TOBRACKET"
  | (T 29) => "TOPAREN"
  | (T 30) => "TPROTOCOL"
  | (T 31) => "TBACKEND"
  | (T 32) => "TREQUEST"
  | (T 33) => "TRULES"
  | (T 34) => "TSCRYPT"
  | (T 35) => "TSECRET"
  | (T 36) => "TSECSTATE"
  | (T 37) => "TSECTION"
  | (T 38) => "TSEMICOLON"
  | (T 39) => "TSTATE"
  | (T 40) => "TSTEP"
  | (T 41) => "TTYPES"
  | (T 42) => "TWITNESS"
  | (T 43) => "TXOR"
  | (T 44) => "TDERIVATION"
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
of  ( 0, ( ( _, ( MlyValue.simple_names simple_names1, _, simple_names1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TBACKEND TBACKEND1, TBACKEND1left, _)) :: rest671)) => let val  result = MlyValue.START (fn _ => let val  TBACKEND1 = TBACKEND1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in ((*#line 123.70 "ofmc-fp.grm"*)update_backend simple_names empty_ofmc_fp(*#line 603.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, TBACKEND1left, simple_names1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.fp_or_attack fp_or_attack1, _, fp_or_attack1right)) :: ( _, ( MlyValue.simple_names simple_names1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TBACKEND TBACKEND1, TBACKEND1left, _)) :: rest671)) => let val  result = MlyValue.START (fn _ => let val  TBACKEND1 = TBACKEND1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 val  (fp_or_attack as fp_or_attack1) = fp_or_attack1 ()
 in ((*#line 124.70 "ofmc-fp.grm"*)update_backend simple_names fp_or_attack(*#line 611.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, TBACKEND1left, fp_or_attack1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.simple_name simple_name1, _, simple_name1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TPROTOCOL TPROTOCOL1, TPROTOCOL1left, _)) :: rest671)) => let val  result = MlyValue.fp_or_attack (fn _ => let val  TPROTOCOL1 = TPROTOCOL1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 in ((*#line 126.70 "ofmc-fp.grm"*)update_protocol simple_name empty_ofmc_fp(*#line 620.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 4, ( result, TPROTOCOL1left, simple_name1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TPROTOCOL TPROTOCOL1, TPROTOCOL1left, _)) :: rest671)) => let val  result = MlyValue.fp_or_attack (fn _ => let val  TPROTOCOL1 = TPROTOCOL1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 127.72 "ofmc-fp.grm"*)update_protocol simple_name ofmc_fp(*#line 628.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 4, ( result, TPROTOCOL1left, ofmc_fp1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671)) => let val  result = MlyValue.fp_or_attack (fn _ => let val  TATTACK1 = TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 129.70 "ofmc-fp.grm"*)update_attack msglist empty_ofmc_fp(*#line 637.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 4, ( result, TATTACK1left, TCPAREN1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.attackinfo attackinfo1, _, attackinfo1right)) :: ( _, ( MlyValue.TCPAREN TCPAREN1, _, _)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671)) => let val  result = MlyValue.fp_or_attack (fn _ => let val  TATTACK1 = TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 val  (attackinfo as attackinfo1) = attackinfo1 ()
 in ((*#line 130.74 "ofmc-fp.grm"*)update_attack msglist attackinfo(*#line 646.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 4, ( result, TATTACK1left, attackinfo1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671)) => let val  result = MlyValue.attackinfo (fn _ => let val  TATTACK1 = TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 133.75 "ofmc-fp.grm"*)update_attack msglist empty_ofmc_fp(*#line 656.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 3, ( result, TATTACK1left, TCPAREN1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.attackinfo attackinfo1, _, attackinfo1right)) :: ( _, ( MlyValue.TCPAREN TCPAREN1, _, _)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671)) => let val  result = MlyValue.attackinfo (fn _ => let val  TATTACK1 = TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 val  (attackinfo as attackinfo1) = attackinfo1 ()
 in ((*#line 134.71 "ofmc-fp.grm"*)update_attack msglist attackinfo(*#line 665.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 3, ( result, TATTACK1left, attackinfo1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TCPAREN TCPAREN1, _, _)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK2, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME2, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TDERIVATION TDERIVATION1, TDERIVATION1left, _)) :: rest671)) => let val  result = MlyValue.attackinfo (fn _ => let val  TDERIVATION1 = TDERIVATION1 ()
 val  SIMPLE_NAME1 = SIMPLE_NAME1 ()
 val  SIMPLE_NAME2 = SIMPLE_NAME2 ()
 val  TATTACK1 = TATTACK1 ()
 val  TCOLON1 = TCOLON1 ()
 val  TATTACK2 = TATTACK2 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 val  (trace as trace1) = trace1 ()
 in ((*#line 135.100 "ofmc-fp.grm"*)(fn (_,_) => empty_ofmc_fp)  (trace,msglist)(*#line 675.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 3, ( result, TDERIVATION1left, trace1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.types types1, _, types1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TTYPES TTYPES1, TTYPES1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TTYPES1 = TTYPES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (types as types1) = types1 ()
 in ((*#line 140.72 "ofmc-fp.grm"*)update_types ((types_of empty_ofmc_fp)@types) empty_ofmc_fp(*#line 690.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TTYPES1left, types1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.types types1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TTYPES TTYPES1, TTYPES1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TTYPES1 = TTYPES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (types as types1) = types1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 141.72 "ofmc-fp.grm"*)update_types ((types_of ofmc_fp)@types) ofmc_fp(*#line 698.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TTYPES1left, ofmc_fp1right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSECSTATE TSECSTATE1, _, _)) :: ( _, ( MlyValue.TINITIAL TINITIAL1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TINITIAL1 = TINITIAL1 ()
 val  TSECSTATE1 = TSECSTATE1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in ((*#line 142.72 "ofmc-fp.grm"*)update_knowledge knowledge empty_ofmc_fp(*#line 707.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, knowledge1right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.knowledge knowledge1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSECSTATE TSECSTATE1, _, _)) :: ( _, ( MlyValue.TINITIAL TINITIAL1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TINITIAL1 = TINITIAL1 ()
 val  TSECSTATE1 = TSECSTATE1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 143.72 "ofmc-fp.grm"*)update_knowledge knowledge ofmc_fp(*#line 717.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, ofmc_fp1right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TRULES TRULES1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TRULES1 = TRULES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (rules as rules1) = rules1 ()
 in ((*#line 144.72 "ofmc-fp.grm"*)update_rules rules empty_ofmc_fp(*#line 728.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, rules1right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.rules rules1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TRULES TRULES1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TRULES1 = TRULES1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (rules as rules1) = rules1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 145.72 "ofmc-fp.grm"*)update_rules rules ofmc_fp(*#line 737.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, ofmc_fp1right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TFIXEDPOINT TFIXEDPOINT1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TFIXEDPOINT1 = TFIXEDPOINT1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in ((*#line 146.72 "ofmc-fp.grm"*)update_fixedpoint knowledge empty_ofmc_fp(*#line 747.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, knowledge1right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.knowledge knowledge1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TFIXEDPOINT TFIXEDPOINT1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TFIXEDPOINT1 = TFIXEDPOINT1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 147.72 "ofmc-fp.grm"*)update_fixedpoint knowledge ofmc_fp(*#line 756.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, ofmc_fp1right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.abstractions abstractions1, _, abstractions1right)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TABSTRACTION TABSTRACTION1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 in ((*#line 148.72 "ofmc-fp.grm"*)update_abstractions ((abstractions_of empty_ofmc_fp )@abstractions) empty_ofmc_fp(*#line 766.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, abstractions1right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.TCOLON TCOLON1, _, TCOLON1right)) :: ( _, ( MlyValue.TABSTRACTION TABSTRACTION1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 in ((*#line 149.73 "ofmc-fp.grm"*)update_abstractions ((abstractions_of empty_ofmc_fp )@[]) empty_ofmc_fp(*#line 775.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, TCOLON1right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.ofmc_fp ofmc_fp1, _, ofmc_fp1right)) :: ( _, ( MlyValue.abstractions abstractions1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TABSTRACTION TABSTRACTION1, _, _)) :: ( _, ( MlyValue.TSECTION TSECTION1, TSECTION1left, _)) :: rest671)) => let val  result = MlyValue.ofmc_fp (fn _ => let val  TSECTION1 = TSECTION1 ()
 val  TABSTRACTION1 = TABSTRACTION1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 val  (ofmc_fp as ofmc_fp1) = ofmc_fp1 ()
 in ((*#line 150.72 "ofmc-fp.grm"*)update_abstractions ((abstractions_of ofmc_fp)@abstractions) ofmc_fp(*#line 783.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TSECTION1left, ofmc_fp1right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TMINUS TMINUS1, TMINUS1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TMINUS1 = TMINUS1 ()
 val  trace1 = trace1 ()
 in ((*#line 152.73 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 793.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TMINUS1left, trace1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TIKNOWS TIKNOWS1, TIKNOWS1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TIKNOWS1 = TIKNOWS1 ()
 val  trace1 = trace1 ()
 in ((*#line 153.23 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 800.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TIKNOWS1left, trace1right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TSECRET TSECRET1, TSECRET1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TSECRET1 = TSECRET1 ()
 val  trace1 = trace1 ()
 in ((*#line 154.23 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 807.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TSECRET1left, trace1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TOBRACE TOBRACE1, TOBRACE1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TOBRACE1 = TOBRACE1 ()
 val  trace1 = trace1 ()
 in ((*#line 155.62 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 814.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TOBRACE1left, trace1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TCBRACE TCBRACE1, TCBRACE1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCBRACE1 = TCBRACE1 ()
 val  trace1 = trace1 ()
 in ((*#line 156.62 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 821.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCBRACE1left, trace1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.TCBRACE TCBRACE1, TCBRACE1left, TCBRACE1right)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCBRACE1 = TCBRACE1 ()
 in ((*#line 157.56 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 828.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCBRACE1left, TCBRACE1right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  trace1 = trace1 ()
 in ((*#line 158.62 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 834.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TOPAREN1left, trace1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TCPAREN TCPAREN1, TCPAREN1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCPAREN1 = TCPAREN1 ()
 val  trace1 = trace1 ()
 in ((*#line 159.62 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 841.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCPAREN1left, trace1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, TCOMMA1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCOMMA1 = TCOMMA1 ()
 val  trace1 = trace1 ()
 in ((*#line 160.61 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 848.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCOMMA1left, trace1right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.TCPAREN TCPAREN1, TCPAREN1left, TCPAREN1right)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 161.57 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 855.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCPAREN1left, TCPAREN1right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.TCOMMA TCOMMA1, TCOMMA1left, TCOMMA1right)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  TCOMMA1 = TCOMMA1 ()
 in ((*#line 162.56 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 861.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, TCOMMA1left, TCOMMA1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.trace trace1, _, trace1right)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, _)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  SIMPLE_NAME1 = SIMPLE_NAME1 ()
 val  trace1 = trace1 ()
 in ((*#line 163.73 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 867.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, SIMPLE_NAME1left, trace1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.trace (fn _ => let val  SIMPLE_NAME1 = SIMPLE_NAME1 ()
 in ((*#line 164.68 "ofmc-fp.grm"*)empty_ofmc_fp(*#line 874.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ((*#line 166.72 "ofmc-fp.grm"*)[(NONE, facts1, facts2)](*#line 880.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((*#line 167.72 "ofmc-fp.grm"*)(NONE, facts1, facts2)::rules(*#line 890.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (facts as facts1) = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ((*#line 168.73 "ofmc-fp.grm"*)[(NONE, facts1@nfacts, facts)](*#line 901.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 36, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (facts as facts1) = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((*#line 169.73 "ofmc-fp.grm"*)(NONE, facts1@nfacts, facts)::rules(*#line 913.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ((*#line 170.72 "ofmc-fp.grm"*)[(SOME simple_name, facts1, facts2)](*#line 926.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((*#line 171.72 "ofmc-fp.grm"*)(SOME simple_name, facts1, facts2)::rules(*#line 937.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.facts facts2, _, facts2right)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 in ((*#line 172.73 "ofmc-fp.grm"*)[(SOME simple_name, facts1@nfacts, facts2)](*#line 949.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, facts2right), rest671)
end
|  ( 40, ( ( _, ( MlyValue.rules rules1, _, rules1right)) :: ( _, ( MlyValue.facts facts2, _, _)) :: ( _, ( MlyValue.TMETAIMPLIES TMETAIMPLIES1, _, _)) :: ( _, ( MlyValue.nfacts nfacts1, _, _)) :: ( _, ( MlyValue.TBAR TBAR1, _, _)) :: ( _, ( MlyValue.facts facts1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.simple_name simple_name1, _, _)) :: ( _, ( MlyValue.TSTEP TSTEP1, TSTEP1left, _)) :: rest671)) => let val  result = MlyValue.rules (fn _ => let val  TSTEP1 = TSTEP1 ()
 val  (simple_name as simple_name1) = simple_name1 ()
 val  TCOLON1 = TCOLON1 ()
 val  facts1 = facts1 ()
 val  TBAR1 = TBAR1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 val  TMETAIMPLIES1 = TMETAIMPLIES1 ()
 val  facts2 = facts2 ()
 val  (rules as rules1) = rules1 ()
 in ((*#line 173.77 "ofmc-fp.grm"*)(SOME simple_name, facts1@nfacts, facts2)::rules(*#line 962.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 15, ( result, TSTEP1left, rules1right), rest671)
end
|  ( 41, ( ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, TSEMICOLON1right)) :: ( _, ( MlyValue.fact fact1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.factname factname1, factname1left, _)) :: rest671)) => let val  result = MlyValue.knowledge (fn _ => let val  (factname as factname1) = factname1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 in ((*#line 175.72 "ofmc-fp.grm"*)[(factname, fact)](*#line 976.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 10, ( result, factname1left, TSEMICOLON1right), rest671)
end
|  ( 42, ( ( _, ( MlyValue.knowledge knowledge1, _, knowledge1right)) :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.fact fact1, _, _)) :: ( _, ( MlyValue.TCOLON TCOLON1, _, _)) :: ( _, ( MlyValue.factname factname1, factname1left, _)) :: rest671)) => let val  result = MlyValue.knowledge (fn _ => let val  (factname as factname1) = factname1 ()
 val  TCOLON1 = TCOLON1 ()
 val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (knowledge as knowledge1) = knowledge1 ()
 in ((*#line 176.65 "ofmc-fp.grm"*)(factname, fact)::(knowledge)(*#line 985.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 10, ( result, factname1left, knowledge1right), rest671)
end
|  ( 43, ( ( _, ( MlyValue.fact fact1, fact1left, fact1right)) :: rest671)) => let val  result = MlyValue.facts (fn _ => let val  (fact as fact1) = fact1 ()
 in ((*#line 178.72 "ofmc-fp.grm"*)[fact](*#line 995.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 11, ( result, fact1left, fact1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.facts facts1, _, facts1right)) :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.fact fact1, fact1left, _)) :: rest671)) => let val  result = MlyValue.facts (fn _ => let val  (fact as fact1) = fact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (facts as facts1) = facts1 ()
 in ((*#line 179.72 "ofmc-fp.grm"*)fact::facts(*#line 1001.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 11, ( result, fact1left, facts1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.role role1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TSTATE TSTATE1, TSTATE1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TSTATE1 = TSTATE1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (role as role1) = role1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 181.72 "ofmc-fp.grm"*)State(role, msglist)(*#line 1009.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TSTATE1left, TCPAREN1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msg msg1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TIKNOWS TIKNOWS1, TIKNOWS1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TIKNOWS1 = TIKNOWS1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msg as msg1) = msg1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 182.72 "ofmc-fp.grm"*)Iknows(msg)(*#line 1022.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TIKNOWS1left, TCPAREN1right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TSECRET TSECRET1, TSECRET1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TSECRET1 = TSECRET1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 183.72 "ofmc-fp.grm"*)Secret(msglist)(*#line 1031.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TSECRET1left, TCPAREN1right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TWITNESS TWITNESS1, TWITNESS1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TWITNESS1 = TWITNESS1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 184.72 "ofmc-fp.grm"*)Witness(msglist)(*#line 1040.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TWITNESS1left, TCPAREN1right), rest671)
end
|  ( 49, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TREQUEST TREQUEST1, TREQUEST1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TREQUEST1 = TREQUEST1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 185.72 "ofmc-fp.grm"*)Request(msglist)(*#line 1049.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TREQUEST1left, TCPAREN1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.TATTACK TATTACK1, TATTACK1left, _)) :: rest671)) => let val  result = MlyValue.fact (fn _ => let val  TATTACK1 = TATTACK1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 186.71 "ofmc-fp.grm"*)Attack(msglist)(*#line 1058.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, TATTACK1left, TCPAREN1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.nfact nfact1, nfact1left, nfact1right)) :: rest671)) => let val  result = MlyValue.nfacts (fn _ => let val  (nfact as nfact1) = nfact1 ()
 in ((*#line 188.72 "ofmc-fp.grm"*)[nfact](*#line 1067.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 13, ( result, nfact1left, nfact1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.nfacts nfacts1, _, nfacts1right)) :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.nfact nfact1, nfact1left, _)) :: rest671)) => let val  result = MlyValue.nfacts (fn _ => let val  (nfact as nfact1) = nfact1 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (nfacts as nfacts1) = nfacts1 ()
 in ((*#line 189.72 "ofmc-fp.grm"*)nfact::nfacts(*#line 1073.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 13, ( result, nfact1left, nfacts1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.msg msg2, _, msg2right)) :: ( _, ( MlyValue.TNEQ TNEQ1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _)) :: rest671)) => let val  result = MlyValue.nfact (fn _ => let val  msg1 = msg1 ()
 val  TNEQ1 = TNEQ1 ()
 val  msg2 = msg2 ()
 in ((*#line 191.72 "ofmc-fp.grm"*)NotEqual(msg1,msg2)(*#line 1081.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 14, ( result, msg1left, msg2right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.msg msg1, msg1left, msg1right)) :: rest671)) => let val  result = MlyValue.msglist (fn _ => let val  (msg as msg1) = msg1 ()
 in ((*#line 194.72 "ofmc-fp.grm"*)[msg](*#line 1089.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 8, ( result, msg1left, msg1right), rest671)
end
|  ( 55, ( ( _, ( MlyValue.msglist msglist1, _, msglist1right)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _)) :: rest671)) => let val  result = MlyValue.msglist (fn _ => let val  (msg as msg1) = msg1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (msglist as msglist1) = msglist1 ()
 in ((*#line 195.72 "ofmc-fp.grm"*)msg::msglist(*#line 1095.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 8, ( result, msg1left, msglist1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.msg (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in ((*#line 197.72 "ofmc-fp.grm"*)Atom SIMPLE_NAME(*#line 1103.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 9, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), rest671)
end
|  ( 57, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msglist msglist1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, _)) :: rest671)) => let val  result = MlyValue.msg (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TOPAREN1 = TOPAREN1 ()
 val  (msglist as msglist1) = msglist1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 198.72 "ofmc-fp.grm"*)Operator(SIMPLE_NAME,msglist)(*#line 1109.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 9, ( result, SIMPLE_NAME1left, TCPAREN1right), rest671)
end
|  ( 58, ( ( _, ( MlyValue.msg msg1, _, msg1right)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, _)) :: rest671)) => let val  result = MlyValue.msg (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  (msg as msg1) = msg1 ()
 in ((*#line 199.68 "ofmc-fp.grm"*)Operator(SIMPLE_NAME,[msg])(*#line 1118.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 9, ( result, SIMPLE_NAME1left, msg1right), rest671)
end
|  ( 59, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.msg msg1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.msg (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (msg as msg1) = msg1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 200.72 "ofmc-fp.grm"*)msg(*#line 1125.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 9, ( result, TOPAREN1left, TCPAREN1right), rest671)
end
|  ( 60, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.role (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in ((*#line 202.72 "ofmc-fp.grm"*)SIMPLE_NAME(*#line 1133.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 6, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), rest671)
end
|  ( 61, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.factname (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in ((*#line 204.72 "ofmc-fp.grm"*)SIMPLE_NAME(*#line 1139.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 7, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), rest671)
end
|  ( 62, ( ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, SIMPLE_NAME1left, SIMPLE_NAME1right)) :: rest671)) => let val  result = MlyValue.simple_name (fn _ => let val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 in ((*#line 206.72 "ofmc-fp.grm"*)SIMPLE_NAME(*#line 1145.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 5, ( result, SIMPLE_NAME1left, SIMPLE_NAME1right), rest671)
end
|  ( 63, ( ( _, ( MlyValue.msg msg2, _, msg2right)) :: ( _, ( MlyValue.TARROW TARROW1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _)) :: rest671)) => let val  result = MlyValue.abstractions (fn _ => let val  msg1 = msg1 ()
 val  TARROW1 = TARROW1 ()
 val  msg2 = msg2 ()
 in ((*#line 208.72 "ofmc-fp.grm"*)[(rmOuterOp msg2,msg1)](*#line 1151.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 16, ( result, msg1left, msg2right), rest671)
end
|  ( 64, ( ( _, ( MlyValue.abstractions abstractions1, _, abstractions1right)) :: ( _, ( MlyValue.TSEMICOLON TSEMICOLON1, _, _)) :: ( _, ( MlyValue.msg msg2, _, _)) :: ( _, ( MlyValue.TARROW TARROW1, _, _)) :: ( _, ( MlyValue.msg msg1, msg1left, _)) :: rest671)) => let val  result = MlyValue.abstractions (fn _ => let val  msg1 = msg1 ()
 val  TARROW1 = TARROW1 ()
 val  msg2 = msg2 ()
 val  TSEMICOLON1 = TSEMICOLON1 ()
 val  (abstractions as abstractions1) = abstractions1 ()
 in ((*#line 209.65 "ofmc-fp.grm"*)(rmOuterOp msg2,msg1)::abstractions(*#line 1159.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 16, ( result, msg1left, abstractions1right), rest671)
end
|  ( 65, ( ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, TCBRACKET1right)) :: ( _, ( MlyValue.typlist typlist1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, TOBRACKET1left, _)) :: rest671)) => let val  result = MlyValue.types (fn _ => let val  TOBRACKET1 = TOBRACKET1 ()
 val  (typlist as typlist1) = typlist1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 in ((*#line 211.71 "ofmc-fp.grm"*)typlist(*#line 1169.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 22, ( result, TOBRACKET1left, TCBRACKET1right), rest671)
end
|  ( 66, ( ( _, ( MlyValue.typ typ1, typ1left, typ1right)) :: rest671)) => let val  result = MlyValue.typlist (fn _ => let val  (typ as typ1) = typ1 ()
 in ((*#line 213.71 "ofmc-fp.grm"*)[typ](*#line 1177.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 21, ( result, typ1left, typ1right), rest671)
end
|  ( 67, ( ( _, ( MlyValue.typlist typlist1, _, typlist1right)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.typ typ1, typ1left, _)) :: rest671)) => let val  result = MlyValue.typlist (fn _ => let val  (typ as typ1) = typ1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (typlist as typlist1) = typlist1 ()
 in ((*#line 214.71 "ofmc-fp.grm"*)typ::typlist(*#line 1183.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 21, ( result, typ1left, typlist1right), rest671)
end
|  ( 68, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.typnames typnames1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (typnames as typnames1) = typnames1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 216.71 "ofmc-fp.grm"*)(SIMPLE_NAME,typnames)(*#line 1191.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 20, ( result, TOPAREN1left, TCPAREN1right), rest671)
end
|  ( 69, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.typnames typnames1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME3, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME2, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  SIMPLE_NAME2 = SIMPLE_NAME2 ()
 val  SIMPLE_NAME3 = SIMPLE_NAME3 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  (typnames as typnames1) = typnames1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 217.97 "ofmc-fp.grm"*)(SIMPLE_NAME,typnames)(*#line 1203.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 20, ( result, TOPAREN1left, TCPAREN1right), rest671)
end
|  ( 70, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 218.64 "ofmc-fp.grm"*)(SIMPLE_NAME,[])(*#line 1217.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 20, ( result, TOPAREN1left, TCPAREN1right), rest671)
end
|  ( 71, ( ( _, ( MlyValue.TCPAREN TCPAREN1, _, TCPAREN1right)) :: ( _, ( MlyValue.TCBRACKET TCBRACKET1, _, _)) :: ( _, ( MlyValue.TOBRACKET TOBRACKET1, _, _)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME3, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME2, _, _)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TOPAREN TOPAREN1, TOPAREN1left, _)) :: rest671)) => let val  result = MlyValue.typ (fn _ => let val  TOPAREN1 = TOPAREN1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  SIMPLE_NAME2 = SIMPLE_NAME2 ()
 val  SIMPLE_NAME3 = SIMPLE_NAME3 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  TOBRACKET1 = TOBRACKET1 ()
 val  TCBRACKET1 = TCBRACKET1 ()
 val  TCPAREN1 = TCPAREN1 ()
 in ((*#line 219.88 "ofmc-fp.grm"*)(SIMPLE_NAME,[])(*#line 1228.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 20, ( result, TOPAREN1left, TCPAREN1right), rest671)
end
|  ( 72, ( ( _, ( MlyValue.typname typname1, typname1left, typname1right)) :: rest671)) => let val  result = MlyValue.typnames (fn _ => let val  (typname as typname1) = typname1 ()
 in ((*#line 223.71 "ofmc-fp.grm"*)[typname](*#line 1241.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 18, ( result, typname1left, typname1right), rest671)
end
|  ( 73, ( ( _, ( MlyValue.typnames typnames1, _, typnames1right)) :: ( _, ( MlyValue.TCOMMA TCOMMA1, _, _)) :: ( _, ( MlyValue.typname typname1, typname1left, _)) :: rest671)) => let val  result = MlyValue.typnames (fn _ => let val  (typname as typname1) = typname1 ()
 val  TCOMMA1 = TCOMMA1 ()
 val  (typnames as typnames1) = typnames1 ()
 in ((*#line 224.71 "ofmc-fp.grm"*)typname::typnames(*#line 1247.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 18, ( result, typname1left, typnames1right), rest671)
end
|  ( 74, ( ( _, ( MlyValue.simple_name simple_name1, simple_name1left, simple_name1right)) :: rest671)) => let val  result = MlyValue.simple_names (fn _ => let val  (simple_name as simple_name1) = simple_name1 ()
 in ((*#line 226.72 "ofmc-fp.grm"*)simple_name(*#line 1255.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 19, ( result, simple_name1left, simple_name1right), rest671)
end
|  ( 75, ( ( _, ( MlyValue.simple_names simple_names1, _, simple_names1right)) :: ( _, ( MlyValue.simple_name simple_name1, simple_name1left, _)) :: rest671)) => let val  result = MlyValue.simple_names (fn _ => let val  (simple_name as simple_name1) = simple_name1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in ((*#line 227.61 "ofmc-fp.grm"*)simple_name^" "^simple_names(*#line 1261.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 19, ( result, simple_name1left, simple_names1right), rest671)
end
|  ( 76, ( ( _, ( MlyValue.simple_names simple_names1, _, simple_names1right)) :: ( _, ( MlyValue.TMINUS TMINUS1, _, _)) :: ( _, ( MlyValue.simple_name simple_name1, simple_name1left, _)) :: rest671)) => let val  result = MlyValue.simple_names (fn _ => let val  (simple_name as simple_name1) = simple_name1 ()
 val  TMINUS1 = TMINUS1 ()
 val  (simple_names as simple_names1) = simple_names1 ()
 in ((*#line 228.67 "ofmc-fp.grm"*)simple_name^" "^simple_names(*#line 1268.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 19, ( result, simple_name1left, simple_names1right), rest671)
end
|  ( 77, ( ( _, ( MlyValue.TQUOTE TQUOTE2, _, TQUOTE2right)) :: ( _, ( MlyValue.SIMPLE_NAME SIMPLE_NAME1, _, _)) :: ( _, ( MlyValue.TQUOTE TQUOTE1, TQUOTE1left, _)) :: rest671)) => let val  result = MlyValue.typname (fn _ => let val  TQUOTE1 = TQUOTE1 ()
 val  (SIMPLE_NAME as SIMPLE_NAME1) = SIMPLE_NAME1 ()
 val  TQUOTE2 = TQUOTE2 ()
 in ((*#line 230.71 "ofmc-fp.grm"*)SIMPLE_NAME(*#line 1276.1 "ofmc-fp.grm.sml"*)
)
end)
 in ( LrTable.NT 17, ( result, TQUOTE1left, TQUOTE2right), rest671)
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
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.VOID,p1,p2))
fun SIMPLE_NAME (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.SIMPLE_NAME (fn () => i),p1,p2))
fun TABSTRACTION (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.TABSTRACTION (fn () => i),p1,p2))
fun TATTACK (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.TATTACK (fn () => i),p1,p2))
fun TARROW (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.TARROW (fn () => i),p1,p2))
fun TMINUS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.TMINUS (fn () => i),p1,p2))
fun TCAT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.TCAT (fn () => i),p1,p2))
fun TCBRACKET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.TCBRACKET (fn () => i),p1,p2))
fun TCOLON (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.TCOLON (fn () => i),p1,p2))
fun TWHITESPACE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.TWHITESPACE (fn () => i),p1,p2))
fun TEQ (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.TEQ (fn () => i),p1,p2))
fun TNEQ (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.TNEQ (fn () => i),p1,p2))
fun TBAR (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.TBAR (fn () => i),p1,p2))
fun TCOMMA (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.TCOMMA (fn () => i),p1,p2))
fun TCPAREN (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.TCPAREN (fn () => i),p1,p2))
fun TOBRACE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.TOBRACE (fn () => i),p1,p2))
fun TCBRACE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.TCBRACE (fn () => i),p1,p2))
fun TCRYPT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.TCRYPT (fn () => i),p1,p2))
fun TQUOTE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.TQUOTE (fn () => i),p1,p2))
fun TEXP (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.TEXP (fn () => i),p1,p2))
fun TFACT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.TFACT (fn () => i),p1,p2))
fun TFIXEDPOINT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(ParserData.MlyValue.TFIXEDPOINT (fn () => i),p1,p2))
fun TFPState (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(ParserData.MlyValue.TFPState (fn () => i),p1,p2))
fun TIKNOWS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(ParserData.MlyValue.TIKNOWS (fn () => i),p1,p2))
fun TINITIAL (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(ParserData.MlyValue.TINITIAL (fn () => i),p1,p2))
fun TINV (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(ParserData.MlyValue.TINV (fn () => i),p1,p2))
fun TKNOWLEDGE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(ParserData.MlyValue.TKNOWLEDGE (fn () => i),p1,p2))
fun TMETAIMPLIES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(ParserData.MlyValue.TMETAIMPLIES (fn () => i),p1,p2))
fun TOBRACKET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(ParserData.MlyValue.TOBRACKET (fn () => i),p1,p2))
fun TOPAREN (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(ParserData.MlyValue.TOPAREN (fn () => i),p1,p2))
fun TPROTOCOL (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(ParserData.MlyValue.TPROTOCOL (fn () => i),p1,p2))
fun TBACKEND (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(ParserData.MlyValue.TBACKEND (fn () => i),p1,p2))
fun TREQUEST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(ParserData.MlyValue.TREQUEST (fn () => i),p1,p2))
fun TRULES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(ParserData.MlyValue.TRULES (fn () => i),p1,p2))
fun TSCRYPT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(ParserData.MlyValue.TSCRYPT (fn () => i),p1,p2))
fun TSECRET (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(ParserData.MlyValue.TSECRET (fn () => i),p1,p2))
fun TSECSTATE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(ParserData.MlyValue.TSECSTATE (fn () => i),p1,p2))
fun TSECTION (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(ParserData.MlyValue.TSECTION (fn () => i),p1,p2))
fun TSEMICOLON (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(ParserData.MlyValue.TSEMICOLON (fn () => i),p1,p2))
fun TSTATE (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(ParserData.MlyValue.TSTATE (fn () => i),p1,p2))
fun TSTEP (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(ParserData.MlyValue.TSTEP (fn () => i),p1,p2))
fun TTYPES (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(ParserData.MlyValue.TTYPES (fn () => i),p1,p2))
fun TWITNESS (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(ParserData.MlyValue.TWITNESS (fn () => i),p1,p2))
fun TXOR (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(ParserData.MlyValue.TXOR (fn () => i),p1,p2))
fun TDERIVATION (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(ParserData.MlyValue.TDERIVATION (fn () => i),p1,p2))
end
end
