(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * config.sml.in --- main configuration file for Isabelle-OFMC
 * This file is part of Isabelle-OFMC.
 *
 * Copyright (c) 2009-2016 Achim D. Brucker, Germany
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

theory 
  ofmc
imports
  Main
begin


section {* Auxiliary Lemmata *}

lemma set2pred: " x \<in>  {m . P(m)} \<equiv>  P(x)"
  by(auto)

section {* Proof Obligation Manager Configuration *}


section {* Isabelle/ofmc Specific Tactics *}

method_setup propagate_fp = {*
let
  fun propagate_fp_tac_str ctxt =
  let
    val thy       = Proof_Context.theory_of ctxt
    fun m_tac  thm =
    let
      fun replace_bounded b (t1$t2) =  (replace_bounded b t1)$(replace_bounded b t2)
       | replace_bounded b (Bound c) =  Free(List.nth (b,(List.length b) - c -1)) 
       | replace_bounded _ t  =  t 

      fun collect_facts b (((Const (@{const_name Set.member},_))$(t)$(Const(@{const_name List.set},_)$_))) = [replace_bounded b t]
        | collect_facts b (t1$t2)           = ((collect_facts b t1)@(collect_facts b t2))
        | collect_facts b (Abs (n,ty,t))     = collect_facts (b@[(n,ty)]) t 
        | collect_facts _ _                 = []
 
      val string_of_term  = Sledgehammer_Util.hackish_string_of_term ctxt
      val string_of_cterm = string_of_term o Thm.term_of 
 
      val cand = case Thm.prems_of thm of 
                 [] => []
               | (p::ps) => collect_facts [] p

       fun my_inst_tac f  = (Rule_Insts.forw_inst_tac ctxt [((("c",0),Position.none), string_of_term f )] 
                         [] (@{thm subsetD}) 1) 

       fun foo [f]         = (my_inst_tac f) THEN (simp_tac ctxt 1)
         | foo (f::facts)  = foo [f] THEN (foo facts)
         | foo [] = all_tac
     in
         (foo cand) thm
     end
  in
    m_tac
  end
in
Scan.succeed (fn ctxt: Proof.context =>
      SIMPLE_METHOD' (fn i: int => propagate_fp_tac_str ctxt))
end
*} "propagate fixed-point"



end
