(*****************************************************************************
 * Isabelle/OFMC --- connecting OFMC and Isabelle/HOL
 *                                                                            
 * ROOT.ML --- main file for Isabelle-OFMC.
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
(* $Id: ROOT.ML 978 2009-11-19 04:34:12Z brucker $ *)

use "config.sml";

OS.FileSys.chDir "encoder"; 
use "root.sml"; 
OS.FileSys.chDir "..";

use "config.sml";

val isabelle_version = Distribution.version
val ofmc_version = Int.toString(ofmc_ver_major)^"."^Int.toString(ofmc_ver_minor)^"."
                        ^Int.toString(ofmc_ver_micro)^ofmc_ver_tag
val version = "Isabelle/ofmc "^ofmc_version^", based on "^isabelle_version;

fun infostr _ = (
   ("\n")^
   ("                Isabelle/ofmc "^ofmc_version^"           \n")^
   ("           connecting OFMC and Isabelle/HOL              \n")^
   (" Copyright (c) 2009 Achim D. Brucker   \n")^
   ("                                                         \n")^
   (" Configuration:                                          \n")^
   (" - ofmc binary: "^(ofmc_connector.ofmc_home()^ofmc_connector.ofmc)^"\n" )^
   (" - Isabelle: "^(isabelle_version)^"\n" )^
   (" - ML-system: "^(ml_system)^"\n" ));

fun info () = writeln (infostr());

use_thy "ofmc";


fun check_thy thyname =
    let 
      val success   = (use_thy thyname; true)
	  handle _ => false
    in
      if success
      then print ("  ***\n  *** Successfully proofed theory \""^thyname^"\".\n  ***\n")
      else 
	print ("  ***\n  *** Proving theory \""^thyname^"\" FAILED.\n  ***\n")
    end


val timer =  Timer.startRealTimer ()

fun log_thy thyname =
    let
      val start = Timer.checkRealTimer timer
      val success   = (use_thy thyname; true)
                 handle _ => false
      val stop = Timer.checkRealTimer timer
      val duration = Time.-(stop,start)
      fun warning s = (TextIO.output (TextIO.stdErr, s); TextIO.flushOut TextIO.stdErr)
		
      val _ = warning ("\nresult:      "^(Bool.toString success)^"\n")
      val _ = warning ("duration:    "^(Time.toString duration)^"\n")
    in () end

val welcome = Toplevel.imperative (info);
val welcomeP =
    OuterSyntax.improper_command "welcome" "print welcome message" OuterKeyword.diag
                                 (Scan.succeed (Toplevel.no_timing o welcome));
