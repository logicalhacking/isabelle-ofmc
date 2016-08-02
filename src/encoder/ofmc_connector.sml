(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * ofmc_connector.sml --- 
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

signature OFMC_CONNECTOR = 
sig
  val ofmc_home:         unit -> string
  val ofmc:              string
  val wauth:             bool ref
(*  val generate_fp : string -> theory -> theory *)
  val parseOfmcFpOutput: string -> OfmcFp.ofmc_fp
  val parseOfmcFpFile:   string -> OfmcFp.ofmc_fp
  val parseAnBFile:      string -> OfmcFp.ofmc_fp
end

structure ofmc_connector :> OFMC_CONNECTOR = 
struct


structure OfmcFpParserLrVals =
OfmcFpParserLrValsFun(structure Token = LrParser.Token)

structure OfmcFpParserLex =
OfmcFpParserLexFun(structure Tokens = OfmcFpParserLrVals.Tokens)

structure OfmcFpParserParser = Join(structure LrParser = LrParser
                                    structure ParserData = OfmcFpParserLrVals.ParserData
                                    structure Lex = OfmcFpParserLex)

val ofmc = "ofmc"
val wauth = ref false

fun ofmc_home () = case OS.Process.getEnv "OFMC_HOME" of
                     SOME p => p^"/bin"
                   | NONE   => "" 

fun invoke lexstream =
    let fun print_error (s,i:(int * int * int),_) =
	    TextIO.output(TextIO.stdOut,
			  "Error, line .... " ^ (Int.toString (#1 i)) ^"."
			  ^(Int.toString (#2 i ))^ ", " ^ s ^ "\n")
    in 
      OfmcFpParserParser.parse(0,lexstream,print_error,())
    end
   
fun parseOfmcFpFile ofmc_output_file = 
    let 
      val infile = TextIO.openIn ofmc_output_file
      val lexer =  OfmcFpParserParser.makeLexer  (fn _ => case ((TextIO.inputLine) infile) of
                                                      SOME s => s
                                                    | NONE   => "")
      val dummyEOF = OfmcFpParserLrVals.Tokens.EOF((0,0,0),(0,0,0))
      fun loop lexer =
	  let 
	    val _ = (OfmcFpParserLex.UserDeclarations.pos := (0,0,0);())
	    val (res,lexer) = invoke lexer
	    val (nextToken,lexer) = OfmcFpParserParser.Stream.get lexer
          in 
	    if OfmcFpParserParser.sameToken(nextToken,dummyEOF)
	    then ((),res)
	    else loop lexer
	  end
    in 
      (#2(loop lexer))
    end

fun parseOfmcFpOutput ofmc_output= 
    let 
      val line   = ref ofmc_output
      fun readString _ = let val f = !line val _ = (line := "") in f end
      val lexer =  OfmcFpParserParser.makeLexer  (readString)
      val dummyEOF = OfmcFpParserLrVals.Tokens.EOF((0,0,0),(0,0,0))
      fun loop lexer =
	  let 
	    val _ = (OfmcFpParserLex.UserDeclarations.pos := (0,0,0);())
	    val (res,lexer) = invoke lexer
	    val (nextToken,lexer) = OfmcFpParserParser.Stream.get lexer
          in 
	    if OfmcFpParserParser.sameToken(nextToken,dummyEOF)
	    then ((),res)
	    else loop lexer
	  end
    in 
      (#2(loop lexer))
    end
	
fun parseAnBFile filename = 
    let
      val cmd = if !wauth 
                then (ofmc_home())^ofmc^" "^filename^" -wauth -ot Isa"
                else (ofmc_home())^ofmc^" "^filename^" -ot Isa"
	
      val tmpFile = OS.FileSys.tmpName ()
      val ofmcStatus = OS.Process.system(cmd^" > "^tmpFile)
      val ofmcOutput = parseOfmcFpFile tmpFile
	  handle e => (OS.FileSys.remove tmpFile; raise e)	   
      val _ = OS.FileSys.remove tmpFile
    in
      OfmcFp.update_source filename ofmcOutput 
    end
    
end
