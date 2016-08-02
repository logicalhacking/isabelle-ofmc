(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * ofmcfp.sml --- 
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


structure OfmcFp = struct

(*
datatype Operator = Crypt | Scrypt | Cat | Inv 
*)

datatype Msg = Atom of string
             | Operator of string * Msg list

type MsgPat = (Msg * Msg)
type ProtocolState = MsgPat list

datatype  Fact = State of string * Msg list
               | FPState of string * Msg
               | Iknows of Msg
               | Attack of Msg
               | Witness  of Msg list
               | Request  of Msg list
               | Secret   of Msg list
               | Fact of string * Msg
               | NotEqual of (Msg * Msg)

type Rule = (string option * Fact list * Fact list)


type ofmc_fp = {
     Protocol: string,
     Backend: string,
     Types: (string * (string list)) list,
     Rules: Rule list,
     Knowledge: (string * Fact) list,
     FixedPoint: (string * Fact) list,
     Abstractions : (Msg * Msg) list,
     Source : string
} 


val empty_ofmc_fp = {Backend="", Protocol="", Types = [("Number",["NI"])], Rules = [], Knowledge=[], FixedPoint=[], 
		     Abstractions=[(Atom "ni",Atom "NI")], Source=""}:ofmc_fp
(*  Abstractions=[(Atom "purpose",Atom "PURPOSE"),(Atom "ni",Atom "NI")], Source=""}:ofmc_fp *)

fun update_protocol protocol ({Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_backend backend ({Protocol=protocol, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_types  types ({Backend=backend, Protocol=protocol,  Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_rules  rules ({Backend=backend, Protocol=protocol, Types=types, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_knowledge  knowledge ({Backend=backend, Protocol=protocol, Types=types, Rules=rules, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_fixedpoint fixedpoint ({Backend=backend, Protocol=protocol, Types=types, Rules=rules, Knowledge = knowledge, Abstractions=abstractions,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_abstractions abstractions ({Backend=backend, Protocol=protocol, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint,Source=source, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
fun update_source source  ({Backend=backend, Protocol=protocol, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint,Abstractions=abstractions, ...}:ofmc_fp) 
    = ({Protocol=protocol, Backend=backend, Types=types, Rules=rules, Knowledge = knowledge, FixedPoint=fixedpoint, Abstractions=abstractions,Source=source}:ofmc_fp) 
    
    
fun mk_unique []      = []
  | mk_unique (x::xs) = if (List.exists (fn e => e = x) xs) then (mk_unique xs) else (x::(mk_unique xs))


fun backend_of (ofmcfp:ofmc_fp)  = case #Backend ofmcfp of "" => "unknown" | s => s
fun protocol_of (ofmcfp:ofmc_fp)  = case #Protocol ofmcfp of "" => "protocol" | s => s
fun knowledge_of (ofmcfp:ofmc_fp) = #Knowledge ofmcfp
fun rules_of (ofmcfp:ofmc_fp)     = #Rules ofmcfp
fun types_of (ofmcfp:ofmc_fp)     = #Types ofmcfp
fun sel_types_of t (ofmcfp:ofmc_fp) = mk_unique (List.concat (map #2 (List.filter (fn (a,b) => a = t) (#Types ofmcfp))))

fun fixedpoint_of (ofmcfp:ofmc_fp)     = #FixedPoint ofmcfp
fun abstractions_of (ofmcfp:ofmc_fp)     = #Abstractions ofmcfp
fun source_of (ofmcfp:ofmc_fp)     = #Source ofmcfp

end

