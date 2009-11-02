(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * ofmc_encoder.sml --- 
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
(* $Id: ofmc_encoder.sml 450 2009-02-02 08:59:41Z brucker $ *)

signature OFMC_ENCODER = 
sig
  val encode_ofmc :         OfmcFp.ofmc_fp -> theory -> theory 
  val ofmcFpTerm_to_term:   OfmcFp.ofmc_fp -> term
end


structure ofmc_encoder = 
struct

open ofmc_connector
open OfmcFp
open ofmc_abstraction

fun encode_ofmc abstractions thy = 
    let  
      val _ = warning "Defining Protocol"
      val _ = warning "Defining Fixpoint"
    in 
      thy
    end


fun ofmcFpTerm_to_term (CVariable (n,t))       = Free(n,dummyT)
  | ofmcFpTerm_to_term (COperator(n,t,ms))     = (Const(n,dummyT)$(foldr1 (op $) (map ofmcFpTerm_to_term ms)))  
					  


end

