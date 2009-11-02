(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * config.sml.in --- main configuration file for Isabelle-OFMC
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
(* $Id: ofmc.thy 935 2009-11-02 00:02:50Z brucker $ *)


theory 
  ofmc
imports
  Main
(* uses  
  "kernel_ext/isabelle2009_kernel_patch.ML" 
(*  "kernel_ext/ProofObligationMgr2008.sml" *) 
*)
begin


section {* Auxiliary Lemmata *}

lemma set2pred: " x \<in>  {m . P(m)} \<equiv>  P(x)"
  by(auto)

section {* Proof Obligation Manager Configuration *}


section {* Isabelle/ofmc Specific Tactics *}

(*


setup {*
Method.add_method ("propagate_fp_cterm",
let 
  fun propagate_fp_tac ctxt facts = 
  let
    val thy       = ProofContext.theory_of ctxt
    fun m_tac  thm =
    let
      fun collect_facts (((Const ("op :",_))$(t)$(Const("List.set",_)$_))) = [t]
        | collect_facts (t1$t2)           = ((collect_facts t1)@(collect_facts t2))
        | collect_facts (Abs (_,_,t))     = collect_facts t
        | collect_facts _                 = []
      val cand = collect_facts (hd(prems_of(thm)))
      fun subst v t = let
val _ = warning ("substituting "^(Syntax.string_of_term ctxt t))
in
                 (Thm.cterm_of thy (Var((v,0),type_of t)),
                       Thm.cterm_of thy t)
end
     val _ = warning ("Candidates found:")
     val _ = map (fn p => warning (" "^(Syntax.string_of_term ctxt p)
                  )) cand

       fun foo [f]  = (forw_terminst_tac  [] [subst "c" f] (instantiate' [SOME (ctyp_of thy (type_of f))] [] (PureThy.get_thm thy "subsetD")) 1)
                             THEN (simp_tac HOL_ss 1)
         | foo (f::facts)  = foo [f] THEN (foo facts)
         | foo [] = all_tac    
     in
         (foo cand) thm
     end
  in
    m_tac
  end
in
  Method.ctxt_args (fn ctxt => Method.METHOD (fn facts => propagate_fp_tac ctxt facts))
end,
"propagate fixed-point")
*})

*)


setup {*
Method.add_method("propagate_fp",
let
  fun propagate_fp_tac_str ctxt facts =
  let
    val thy       = ProofContext.theory_of ctxt
    fun m_tac  thm =
    let
      fun replace_bounded b (t1$t2) =  (replace_bounded b t1)$(replace_bounded b t2)
       | replace_bounded b (Bound c) =  Free(List.nth (b,(List.length b) - c -1)) 
       | replace_bounded _ t  =  t 

      fun collect_facts b (((Const ("op :",_))$(t)$(Const("List.set",_)$_))) = [replace_bounded b t]
        | collect_facts b (t1$t2)           = ((collect_facts b t1)@(collect_facts b t2))
        | collect_facts b (Abs (n,ty,t))     = collect_facts (b@[(n,ty)]) t 
        | collect_facts _ _                 = []
  fun to_string f = (PrintMode.setmp [] Display.string_of_cterm (cterm_of thy f))
  val cand = case prems_of(thm) of 
                 [] => []
               | (p::ps) => collect_facts [] p
(*      val _ = warning "Candiates are"
      val _ = map (fn s => warning (Syntax.string_of_term ctxt s)) cand *)
(*       fun foo [f]  = (forw_inst_tac ctxt [("c", to_string f )] (PureThy.get_thm thy "subsetD") 1) *)
       fun foo [f]  = (forw_inst_tac ctxt [(("c",0), to_string f )] (PureThy.get_thm thy "subsetD") 1)
                             THEN (simp_tac HOL_ss 1)
         | foo (f::facts)  = foo [f] THEN (foo facts)
         | foo [] = all_tac
     in
         (foo cand) thm
     end
  in
    m_tac
  end
in
  Method.ctxt_args (fn ctxt => Method.METHOD (fn facts => propagate_fp_tac_str ctxt facts))
end
,"propagate fixed-point")
*} 


end
