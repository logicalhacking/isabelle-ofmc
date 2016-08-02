(*****************************************************************************
 * HOL-OCL --- connecting OFMC and Isabelle/HOL
 *                                                                            
 * ROOT.ML --- 
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

val today = (Date.toString(Date.fromTimeUniv (Time.now())))^" (UTC)"
val hostname = getOpt (OS.Process.getEnv "HOSTNAME", "hostname not set")
val timer =  Timer.startRealTimer ()
val log_file = "document/report.tex"
	       
val _ = File.write (Path.explode (log_file))
		   (  "% This file was generated automatically \n"
		      ^"\\section{Runtime Report}\n"
		      ^"All reported runtime are measured on host ``"^hostname^"'' on "^today^".\n\n"
		      ^"\\begin{tabular}{lr}\n"
		   )
	
fun log_thy thy = 
    let
      val start = Timer.checkRealTimer timer
      val _   = use_thy thy
      val stop = Timer.checkRealTimer timer
      val duration = Time.-(stop,start)
      val _ = File.append (Path.explode(log_file)) ("  "^thy^" & "^(Time.toString duration)^"\\\\\n")
    in () end



val _ = map log_thy [	
	"ISOsymKeyTwoPassUnilateralAuthProt",
	"Denning-Sacco",
	"nsl",
	"ISOpubKeyOnePassUnilateralAuthProt",
	"WideMouthFrog",
	"Bilateral-Key_Exchange",
	"nsl-ks"
	]

val _ = File.append (Path.explode (log_file)) ("\\end{tabular}")

