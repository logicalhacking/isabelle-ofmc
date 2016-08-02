(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * ofmc_abstraction.sml --- 
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

structure ofmc_abstraction = 
struct

open ofmc_connector
open OfmcFp

datatype CMsg = CVariable of string * string 
              | COperator of string * string * CMsg list
	      | Abstraction of CMsg * CMsg
	    
datatype  CFact = CState of string * CMsg list
		| CIknows of CMsg
		| CAttack of CMsg
		| CWitness of CMsg list
		| CRequest of CMsg list
		| CSecret of CMsg list
		| CFact of string * CMsg
		| CNotEqual of CMsg * CMsg

exception error of string


      fun mk_unique []      = []
	| mk_unique (x::xs) = if (List.exists (fn e => e = x) xs) then (mk_unique xs) else (x::(mk_unique xs))


fun type_abstraction ofmcfp t =
    let
      val abs = abstractions_of ofmcfp
      val types = sel_types_of t ofmcfp 

      fun decl_of (Atom a, Atom a') = "\""^a^"\" \"nat\""
	| decl_of (Operator (opname,_), Atom a) = "\""^opname^"\" \"Msg\" \"nat\"" 

      fun is_t (_,Atom a) = if (List.exists (fn n => (n=a)) types) then true else false
	| is_t (_,_) = false 

      fun name_of (Atom n, _ )    = n
	| name_of (Operator (n,_), _) = n

      fun is_not_abs s = if (List.exists (fn a => ((name_of a) =s)) abs) then false else true

      val abs_t = List.filter is_t abs

      fun is_not_t n  = if (List.exists (fn a => (name_of a = n)) abs_t)
			then false else true

      val abs_nott = List.filter is_not_t types

    in
      case t of 
	"Function" => mk_unique (map (fn x => "\""^x^"\" \"Msg\"") (List.filter is_not_abs types))
      | "Number"   => mk_unique ((map decl_of abs_t)@(map (fn a => "\""^(a)^"\"" ) abs_nott))
      | _          => mk_unique ((map decl_of abs_t))
    end  
						  


fun check_abstraction ofmcfp s = 
    let
      fun name_of (Operator(n,_)) = if (String.isPrefix "__" n) 
				    then String.substring(n,2,(String.size n)-2)
				    else  n
	| name_of (Atom (n))      = if (String.isPrefix "__" n) 
				    then String.substring(n,2,(String.size n)-2)
				    else n
      val abstractions = List.filter (fn (a,b) => (name_of a) = s) (abstractions_of ofmcfp)
    in
      case abstractions of 
	[] => NONE 
      | ((a,b)::xs) => SOME ("Abs_"^(name_of b))
    end


fun deabstractMsg abstractions (Atom s)         = (case check_abstraction abstractions s of 
						     NONE => CVariable(s,"")
						   | SOME a => Abstraction(COperator(s,"",[]),CVariable(a,"")))
  | deabstractMsg abstractions (Operator(s,ms)) = (case check_abstraction abstractions s of 
						     NONE => COperator(s,"", map (deabstractMsg abstractions) ms) 
						   | SOME a => Abstraction(COperator(s,"", map (deabstractMsg abstractions) ms),
									  CVariable(a,"")))
						  
fun deabstractFact abstractions (State (n,ms)) = (CState (n, map (deabstractMsg abstractions) ms))
  | deabstractFact abstractions (Iknows m)     = (CIknows (deabstractMsg abstractions m))
  | deabstractFact abstractions (Attack m)     = (CAttack (deabstractMsg abstractions m))
  | deabstractFact abstractions (Witness ms)   = (CWitness (map (deabstractMsg abstractions) ms)) 
  | deabstractFact abstractions (Request ms)   = (CRequest (map (deabstractMsg abstractions) ms))
  | deabstractFact abstractions (Secret ms)    = (CSecret (map (deabstractMsg abstractions) ms))
  | deabstractFact abstractions (Fact (n,m))   = (CFact (n, deabstractMsg abstractions m))
  | deabstractFact abstractions (NotEqual (n,m))   = (CNotEqual (deabstractMsg abstractions n, deabstractMsg abstractions m))
  | deabstractFact _ _ = raise (error "unknown abstract in deabstractFAct")

end




