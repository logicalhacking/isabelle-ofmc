(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *
 * ofmc-fp.lex ---
 * This file is part of Isabelle-OFMC.
 *
 * Copyright (c) 2009 Achim D. Brucker, Germany
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *
 *     * Neither the name of the copyright holders nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************)
(* $Id: ofmc-fp.lex 869 2009-10-30 10:36:14Z brucker $ *)

structure Tokens = Tokens

type pos = int * int * int
type svalue = Tokens.svalue
	      
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult= (svalue,pos) token


val pos = ref (0,0,0)

fun eof () = Tokens.EOF((!pos,!pos))
fun error (e,p : (int * int * int),_) = TextIO.output (TextIO.stdOut,
                                                         String.concat[
								       "line ", (Int.toString ((#1 p)+1)), "/",
                                                         (Int.toString (#2 p - #3 p)),": ", e, "\n"
                                                      ])

fun inputPos yypos = ((#1 (!pos), yypos - (#3(!pos)), (#3 (!pos))),
                      (#1 (!pos), yypos - (#3(!pos)), (#3 (!pos))))
fun inputPos_half yypos = (#1 (!pos), yypos - (#3(!pos)), (#3 (!pos)))
			  

%%
%header (functor OfmcFpParserLexFun(structure Tokens: OfmcFpParser_TOKENS));
alpha=[A-Za-z_];
digit=[0-9];
ws = [\ \t];
%%

\n       => (pos := ((#1 (!pos)) + 1, yypos - (#3(!pos)),yypos  ); lex());

"(%)[^\n]*\n"  => (pos := ((#1 (!pos)) + 1, yypos - (#3(!pos)),yypos  ); lex());

"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/" => (lex());

"(*""("*([^*/]|[^*]"("|"*"[^/])*"*"*"*)" => (lex());

{ws}+    => (pos := (#1 (!pos), yypos - (#3(!pos)), (#3 (!pos))); lex()); 


"-"           => (Tokens.TMINUS(yytext,inputPos_half yypos,inputPos_half yypos));
"->"           => (Tokens.TARROW(yytext,inputPos_half yypos,inputPos_half yypos));
":"            => (Tokens.TCOLON(yytext,inputPos_half yypos,inputPos_half yypos)); 
"="            => (Tokens.TEQ(yytext,inputPos_half yypos,inputPos_half yypos)); 
"/="           => (Tokens.TNEQ(yytext,inputPos_half yypos,inputPos_half yypos)); 
"|"            => (Tokens.TBAR(yytext,inputPos_half yypos,inputPos_half yypos)); 
"\""           => (Tokens.TQUOTE(yytext,inputPos_half yypos,inputPos_half yypos));
","            => (Tokens.TCOMMA(yytext,inputPos_half yypos,inputPos_half yypos));
";"            => (Tokens.TSEMICOLON(yytext,inputPos_half yypos,inputPos_half yypos));
"("            => (Tokens.TOPAREN(yytext,inputPos_half yypos,inputPos_half yypos));
")"            => (Tokens.TCPAREN(yytext,inputPos_half yypos,inputPos_half yypos));
"["            => (Tokens.TOBRACKET(yytext,inputPos_half yypos,inputPos_half yypos));
"]"            => (Tokens.TCBRACKET(yytext,inputPos_half yypos,inputPos_half yypos));
"=>"           => (Tokens.TMETAIMPLIES(yytext,inputPos_half yypos,inputPos_half yypos));
"section"      => (Tokens.TSECTION(yytext,inputPos_half yypos,inputPos_half yypos));
"rules"        => (Tokens.TRULES(yytext,inputPos_half yypos,inputPos_half yypos));
"initial"      => (Tokens.TINITIAL(yytext,inputPos_half yypos,inputPos_half yypos));
"state"        => (Tokens.TSECSTATE(yytext,inputPos_half yypos,inputPos_half yypos));
"fixedpoint"   => (Tokens.TFIXEDPOINT(yytext,inputPos_half yypos,inputPos_half yypos));
"abstraction"  => (Tokens.TABSTRACTION(yytext,inputPos_half yypos,inputPos_half yypos));
"Protocol"     => (Tokens.TPROTOCOL(yytext,inputPos_half yypos,inputPos_half yypos));
"Backend"      => (Tokens.TBACKEND(yytext,inputPos_half yypos,inputPos_half yypos));
"Types"        => (Tokens.TTYPES(yytext,inputPos_half yypos,inputPos_half yypos));
"Knowledge"    => (Tokens.TKNOWLEDGE(yytext,inputPos_half yypos,inputPos_half yypos));
"Fixed-point"  => (Tokens.TFIXEDPOINT(yytext,inputPos_half yypos,inputPos_half yypos));
"Abstraction"  => (Tokens.TABSTRACTION(yytext,inputPos_half yypos,inputPos_half yypos));
"State"        => (Tokens.TSTATE(yytext,inputPos_half yypos,inputPos_half yypos));
"FPState"      => (Tokens.TFPState(yytext,inputPos_half yypos,inputPos_half yypos));
"iknows"       => (Tokens.TIKNOWS(yytext,inputPos_half yypos,inputPos_half yypos));
"attack"       => (Tokens.TATTACK(yytext,inputPos_half yypos,inputPos_half yypos));
"witness"      => (Tokens.TWITNESS(yytext,inputPos_half yypos,inputPos_half yypos));
"request"      => (Tokens.TREQUEST(yytext,inputPos_half yypos,inputPos_half yypos));
"wrequest"      => (Tokens.TREQUEST(yytext,inputPos_half yypos,inputPos_half yypos));
"secret"       => (Tokens.TSECRET(yytext,inputPos_half yypos,inputPos_half yypos));
"Fact"         => (Tokens.TFACT(yytext,inputPos_half yypos,inputPos_half yypos));
"Crypt"        => (Tokens.TCRYPT(yytext,inputPos_half yypos,inputPos_half yypos));
"step"         => (Tokens.TSTEP(yytext,inputPos_half yypos,inputPos_half yypos));
"Scrypt"       => (Tokens.TSCRYPT(yytext,inputPos_half yypos,inputPos_half yypos));
"Cat"          => (Tokens.TCAT(yytext,inputPos_half yypos,inputPos_half yypos));
"Inv"          => (Tokens.TINV(yytext,inputPos_half yypos,inputPos_half yypos));
"Exp"          => (Tokens.TEXP(yytext,inputPos_half yypos,inputPos_half yypos));
"Xor"          => (Tokens.TXOR(yytext,inputPos_half yypos,inputPos_half yypos));

(_|{alpha}|{digit})+      => (Tokens.SIMPLE_NAME(yytext,inputPos_half yypos,inputPos_half yypos));

.      => (error ("ignoring bad character "^yytext,
                    ((#1 (!pos), yypos - (#3(!pos)), (#3 (!pos)))),
                    ((#1 (!pos), yypos - (#3(!pos)), (#3 (!pos)))));
             lex());
 
