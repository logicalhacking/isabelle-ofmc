chapter {* Analysing ISO_twopass_symm *}
(* *********************************** 
   This file is automatically generated from the AnB file "AnB/ISOsymKeyTwoPassUnilateralAuthProt.AnB".
   Backend: Open Source Fixedpoint Model Checker version 2009c
************************************ *)

theory
     "ISOsymKeyTwoPassUnilateralAuthProt"
 imports
   "../src/ofmc"
begin



section {* Protocol Model (ISO_twopass_symm) *}
datatype Role = rA | rB

datatype Purpose = purposeNI | purposeNB | purposeText1 | purposeText2 | purposeText3
datatype Agent = honest nat
               | dishonest nat

datatype Nonce = "ni" "nat"
 | "absNB" "Msg" "nat"
 | "absText2" "Msg" "nat"
 | "NI"
 | "NB"
 | "Text1"
 | "Text2"
 | "Text3"
       and Msg  = Nonce   "Nonce" 
          | Agent  "Agent"     
          | Purpose "Purpose"
          | pair  "Msg*Msg"    
          | scrypt "Msg*Msg"   
          | crypt  "Msg*Msg"   
          | inv    "Msg"       
          | SID    "nat"        
          | Step   "nat"         
          | authentication 
          | secrecy 
(* SymKeys *)
          | SymKey "Msg"
(* Functions *)
          | "sk" "Msg"

    datatype Fact = Iknows Msg
                  | State "Role * (Msg list)"
                  | Secret "Msg * Msg"
                  | Attack "Msg"
                  | Witness "Msg * Msg * Msg * Msg"
                  | Request "Msg * Msg * Msg * Msg * Msg"




section {* Inductive Protocol Definition (ISO_twopass_symm) *}
inductive_set
  ISO_twopass_symm::"Fact list set"
where
   init_0: "[ Iknows(Nonce((ni Abs_NI)))] : ISO_twopass_symm"
 | init_1: "[ Iknows(Agent(dishonest(i)))] : ISO_twopass_symm"
 | init_2: "[ State(rA, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(dishonest(i))))), Agent(dishonest(i)), SID(sid)] )] : ISO_twopass_symm"
 | init_3: "[ State(rA, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(honest(a))))), Agent(honest(a)), SID(sid)] )] : ISO_twopass_symm"
 | init_4: "[ Iknows(Step(0))] : ISO_twopass_symm"
 | init_5: "[ Iknows(SymKey(sk(pair(Agent(dishonest(i)), Agent(dishonest(i))))))] : ISO_twopass_symm"
 | init_6: "[ Iknows(SID(sid))] : ISO_twopass_symm"
 | init_7: "[ Iknows(SymKey(sk(pair(Agent(dishonest(i)), Agent(honest(a))))))] : ISO_twopass_symm"
 | init_8: "[ Iknows(Agent(honest(a)))] : ISO_twopass_symm"
 | init_9: "[ State(rB, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(dishonest(i)), Agent(honest(a))))), Agent(dishonest(i)), SID(sid)] )] : ISO_twopass_symm"
 | init_10: "[ State(rB, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(honest(a))))), Agent(honest(a)), SID(sid)] )] : ISO_twopass_symm"
 | init_11: "[ Iknows(SymKey(sk(pair(Agent(honest(a)), Agent(dishonest(i))))))] : ISO_twopass_symm"
 | rule_0:  "[| t :ISO_twopass_symm;
   Iknows(crypt(K, M)) : (set t);
   Iknows(inv(K)) : (set t)|] 
 ==> 
((Iknows(M))
  #t) : ISO_twopass_symm"
 | rule_1:  "[| t :ISO_twopass_symm;
   Iknows(crypt(inv(K), M)) : (set t);
   Iknows(K) : (set t)|] 
 ==> 
((Iknows(M))
  #t) : ISO_twopass_symm"
 | rule_2:  "[| t :ISO_twopass_symm;
   Iknows(scrypt(K, M)) : (set t);
   Iknows(K) : (set t)|] 
 ==> 
((Iknows(M))
  #t) : ISO_twopass_symm"
 | rule_3:  "[| t :ISO_twopass_symm;
   Iknows(pair(M1, M2)) : (set t)|] 
 ==> 
((Iknows(M1))
  #(Iknows(M2))
  #t) : ISO_twopass_symm"
 | rule_4:  "[| t :ISO_twopass_symm;
   Secret(M, Agent(honest(a))) : (set t);
   Iknows(M) : (set t)|] 
 ==> 
((Attack(pair(secrecy, M)))
  #t) : ISO_twopass_symm"
 | rule_5:  "[| t :ISO_twopass_symm;
   Request(A, B, Purpose(purposeNB), M, SID(sid)) : (set t);
   ~ ( ? i . 
   B = Agent(dishonest(i)));
   ~ ( ? B A Abs_NB . 
   M = Nonce((absNB(pair(B, A)) Abs_NB)))|] 
 ==> 
((Attack(pair(authentication, pair(A, pair(B, M)))))
  #t) : ISO_twopass_symm"
 | rule_6:  "[| t :ISO_twopass_symm;
   Request(A, B, Purpose(purposeText2), M, SID(sid)) : (set t);
   ~ ( ? i . 
   B = Agent(dishonest(i)));
   ~ ( ? B A Abs_Text2 . 
   M = Nonce((absText2(pair(B, A)) Abs_Text2)))|] 
 ==> 
((Attack(pair(authentication, pair(A, pair(B, M)))))
  #t) : ISO_twopass_symm"
 | rule_7:  "[| t :ISO_twopass_symm;
   State(rB, [Agent(B), Step(0), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), SID(sid)] ) : (set t)|] 
 ==> 
((State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce((absNB(pair(Agent(B), Agent(A))) Abs_NB)), SID(sid)] ))
  #(Iknows(Nonce((absNB(pair(Agent(B), Agent(A))) Abs_NB))))
  #t) : ISO_twopass_symm"
 | rule_8:  "[| t :ISO_twopass_symm;
   State(rA, [Agent(A), Step(0), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(B), SID(sid)] ) : (set t);
   Iknows(Nonce(NB)) : (set t)|] 
 ==> 
((Witness(Agent(A), Agent(B), Purpose(purposeText2), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2))))
  #(State(rA, [Agent(A), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(B), Nonce(NB), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2)), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2))))), SID(sid)] ))
  #(Iknows(scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2)))))))
  #t) : ISO_twopass_symm"
 | rule_9:  "[| t :ISO_twopass_symm;
   State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), SID(sid)] ) : (set t);
   Iknows(scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2))))) : (set t)|] 
 ==> 
((Request(Agent(B), Agent(A), Purpose(purposeText2), Nonce(Text2), SID(sid)))
  #(State(rB, [Agent(B), Step(2), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), Nonce(Text2), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2)))), SID(sid)] ))
  #t) : ISO_twopass_symm"
 | rule_10:  "[| t :ISO_twopass_symm;
   State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), SID(sid)] ) : (set t);
   Iknows(SymKey(sk(pair(Agent(A), Agent(B))))) : (set t);
   Iknows(Nonce(NB)) : (set t);
   Iknows(Agent(B)) : (set t);
   Iknows(Nonce(Text2)) : (set t)|] 
 ==> 
((Request(Agent(B), Agent(A), Purpose(purposeText2), Nonce(Text2), SID(sid)))
  #(State(rB, [Agent(B), Step(2), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), Nonce(Text2), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2)))), SID(sid)] ))
  #t) : ISO_twopass_symm"


section {* Fixed-point Definition (ISO_twopass_symm) *}
definition
"ISO_twopass_symm_fp = {m. ( ? Abs_NB2 Abs_NB3 Abs_NI1 i7 Abs_Text22 Abs_Text23 a8 a9 a10 a11 a12 a13 a14 i4 i5 Abs_NB1 a6 a7 i6 sid0 a3 a4 a5 i3 Abs_NI0 Abs_NB0 a2 a0 i0 Abs_Text20 i1 a1 i2 Abs_Text21 .
   (m = Iknows(Nonce((ni Abs_NI0))))
 | (m = Iknows(Agent(dishonest(i0))))
 | (m = State(rA, [Agent(honest(a0)), Step(0), SymKey(sk(pair(Agent(honest(a1)), Agent(dishonest(i0))))), Agent(dishonest(i1)), SID(sid0)] ))
 | (m = State(rA, [Agent(honest(a0)), Step(0), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), SID(sid0)] ))
 | (m = Iknows(Step(0)))
 | (m = Iknows(SymKey(sk(pair(Agent(dishonest(i0)), Agent(dishonest(i1)))))))
 | (m = Iknows(SID(sid0)))
 | (m = Iknows(SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a0)))))))
 | (m = Iknows(Agent(honest(a0))))
 | (m = State(rB, [Agent(honest(a0)), Step(0), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), SID(sid0)] ))
 | (m = State(rB, [Agent(honest(a0)), Step(0), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), SID(sid0)] ))
 | (m = Iknows(SymKey(sk(pair(Agent(honest(a0)), Agent(dishonest(i0)))))))
 | (m = State(rB, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((absNB(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_NB0)), SID(sid0)] ))
 | (m = State(rB, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), SID(sid0)] ))
 | (m = Witness(Agent(honest(a0)), Agent(dishonest(i0)), Purpose(purposeText2), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i1)))) Abs_Text20))))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(dishonest(i0))))), Agent(dishonest(i1)), Nonce((ni Abs_NI0)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a3)), Agent(dishonest(i3))))), pair(Nonce((ni Abs_NI1)), pair(Agent(dishonest(i4)), Nonce((absText2(pair(Agent(honest(a4)), Agent(dishonest(i5)))) Abs_Text21))))), SID(sid0)] ))
 | (m = Witness(Agent(honest(a0)), Agent(honest(a1)), Purpose(purposeText2), Nonce((absText2(pair(Agent(honest(a2)), Agent(honest(a3)))) Abs_Text20))))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((ni Abs_NI0)), Nonce((absText2(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a6)), Agent(honest(a7))))), pair(Nonce((ni Abs_NI1)), pair(Agent(honest(a8)), Nonce((absText2(pair(Agent(honest(a9)), Agent(honest(a10)))) Abs_Text21))))), SID(sid0)] ))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(honest(a1))))), pair(Nonce((ni Abs_NI0)), pair(Agent(honest(a2)), Nonce((absText2(pair(Agent(honest(a3)), Agent(honest(a4)))) Abs_Text20)))))))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(dishonest(i0))))), pair(Nonce((ni Abs_NI0)), pair(Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i2)))) Abs_Text20)))))))
 | (m = Iknows(Nonce((absNB(pair(Agent(honest(a0)), Agent(dishonest(i0)))) Abs_NB0))))
 | (m = Iknows(Nonce((absNB(pair(Agent(honest(a0)), Agent(honest(a1)))) Abs_NB0))))
 | (m = Iknows(pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20)))))
 | (m = Iknows(pair(Nonce((ni Abs_NI0)), pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20))))))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(dishonest(i0))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a3)), Agent(dishonest(i3)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a4)), Agent(dishonest(i4))))), pair(Nonce((absNB(pair(Agent(honest(a5)), Agent(dishonest(i5)))) Abs_NB1)), pair(Agent(dishonest(i6)), Nonce((absText2(pair(Agent(honest(a6)), Agent(dishonest(i7)))) Abs_Text21))))), SID(sid0)] ))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(dishonest(i0))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(honest(a3)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a4)), Agent(dishonest(i2)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a5)), Agent(dishonest(i3))))), pair(Nonce((absNB(pair(Agent(honest(a6)), Agent(honest(a7)))) Abs_NB1)), pair(Agent(dishonest(i4)), Nonce((absText2(pair(Agent(honest(a8)), Agent(dishonest(i5)))) Abs_Text21))))), SID(sid0)] ))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((absNB(pair(Agent(honest(a4)), Agent(dishonest(i0)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a5)), Agent(honest(a6)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a7)), Agent(honest(a8))))), pair(Nonce((absNB(pair(Agent(honest(a9)), Agent(dishonest(i1)))) Abs_NB1)), pair(Agent(honest(a10)), Nonce((absText2(pair(Agent(honest(a11)), Agent(honest(a12)))) Abs_Text21))))), SID(sid0)] ))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((absNB(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a6)), Agent(honest(a7)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a8)), Agent(honest(a9))))), pair(Nonce((absNB(pair(Agent(honest(a10)), Agent(honest(a11)))) Abs_NB1)), pair(Agent(honest(a12)), Nonce((absText2(pair(Agent(honest(a13)), Agent(honest(a14)))) Abs_Text21))))), SID(sid0)] ))
 | (m = Request(Agent(honest(a0)), Agent(dishonest(i0)), Purpose(purposeText2), Nonce((absNB(pair(Agent(honest(a1)), Agent(dishonest(i1)))) Abs_NB0)), SID(sid0)))
 | (m = State(rB, [Agent(honest(a0)), Step(2), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), Nonce((absNB(pair(Agent(honest(a3)), Agent(dishonest(i3)))) Abs_NB1)), scrypt(SymKey(sk(pair(Agent(dishonest(i4)), Agent(honest(a4))))), pair(Nonce((absNB(pair(Agent(honest(a5)), Agent(dishonest(i5)))) Abs_NB2)), pair(Agent(honest(a6)), Nonce((absNB(pair(Agent(honest(a7)), Agent(dishonest(i6)))) Abs_NB3))))), SID(sid0)] ))
 | (m = Request(Agent(honest(a0)), Agent(dishonest(i0)), Purpose(purposeText2), Nonce((absNB(pair(Agent(honest(a1)), Agent(honest(a2)))) Abs_NB0)), SID(sid0)))
 | (m = State(rB, [Agent(honest(a0)), Step(2), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), Nonce((absNB(pair(Agent(honest(a3)), Agent(honest(a4)))) Abs_NB1)), scrypt(SymKey(sk(pair(Agent(dishonest(i3)), Agent(honest(a5))))), pair(Nonce((absNB(pair(Agent(honest(a6)), Agent(dishonest(i4)))) Abs_NB2)), pair(Agent(honest(a7)), Nonce((absNB(pair(Agent(honest(a8)), Agent(honest(a9)))) Abs_NB3))))), SID(sid0)] ))
 | (m = Request(Agent(honest(a0)), Agent(dishonest(i0)), Purpose(purposeText2), Nonce((ni Abs_NI0)), SID(sid0)))
 | (m = State(rB, [Agent(honest(a0)), Step(2), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), Nonce((ni Abs_NI0)), scrypt(SymKey(sk(pair(Agent(dishonest(i3)), Agent(honest(a3))))), pair(Nonce((absNB(pair(Agent(honest(a4)), Agent(dishonest(i4)))) Abs_NB1)), pair(Agent(honest(a5)), Nonce((ni Abs_NI1))))), SID(sid0)] ))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(honest(a1))))), pair(Nonce((absNB(pair(Agent(honest(a2)), Agent(honest(a3)))) Abs_NB0)), pair(Agent(honest(a4)), Nonce((absText2(pair(Agent(honest(a5)), Agent(honest(a6)))) Abs_Text20)))))))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(honest(a1))))), pair(Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i0)))) Abs_NB0)), pair(Agent(honest(a3)), Nonce((absText2(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_Text20)))))))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(dishonest(i0))))), pair(Nonce((absNB(pair(Agent(honest(a1)), Agent(honest(a2)))) Abs_NB0)), pair(Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a3)), Agent(dishonest(i2)))) Abs_Text20)))))))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(dishonest(i0))))), pair(Nonce((absNB(pair(Agent(honest(a1)), Agent(dishonest(i1)))) Abs_NB0)), pair(Agent(dishonest(i2)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i3)))) Abs_Text20)))))))
 | (m = Iknows(Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i0)))) Abs_Text20))))
 | (m = Iknows(pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20)))))
 | (m = Iknows(pair(Nonce((ni Abs_NI0)), pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20))))))
 | (m = Iknows(pair(Nonce((absNB(pair(Agent(honest(a0)), Agent(dishonest(i0)))) Abs_NB0)), pair(Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i2)))) Abs_Text20))))))
 | (m = Iknows(pair(Nonce((absNB(pair(Agent(honest(a0)), Agent(honest(a1)))) Abs_NB0)), pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i1)))) Abs_Text20))))))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(dishonest(i0))))), Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_Text20)), Nonce((absText2(pair(Agent(honest(a3)), Agent(dishonest(i3)))) Abs_Text21)), scrypt(SymKey(sk(pair(Agent(honest(a4)), Agent(dishonest(i4))))), pair(Nonce((absText2(pair(Agent(honest(a5)), Agent(dishonest(i5)))) Abs_Text22)), pair(Agent(dishonest(i6)), Nonce((absText2(pair(Agent(honest(a6)), Agent(dishonest(i7)))) Abs_Text23))))), SID(sid0)] ))
 | (m = State(rA, [Agent(honest(a0)), Step(1), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((absText2(pair(Agent(honest(a4)), Agent(dishonest(i0)))) Abs_Text20)), Nonce((absText2(pair(Agent(honest(a5)), Agent(honest(a6)))) Abs_Text21)), scrypt(SymKey(sk(pair(Agent(honest(a7)), Agent(honest(a8))))), pair(Nonce((absText2(pair(Agent(honest(a9)), Agent(dishonest(i1)))) Abs_Text22)), pair(Agent(honest(a10)), Nonce((absText2(pair(Agent(honest(a11)), Agent(honest(a12)))) Abs_Text23))))), SID(sid0)] ))
 | (m = Request(Agent(honest(a0)), Agent(honest(a1)), Purpose(purposeText2), Nonce((absText2(pair(Agent(honest(a2)), Agent(honest(a3)))) Abs_Text20)), SID(sid0)))
 | (m = State(rB, [Agent(honest(a0)), Step(2), SymKey(sk(pair(Agent(honest(a1)), Agent(honest(a2))))), Agent(honest(a3)), Nonce((absNB(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a6)), Agent(honest(a7)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(honest(a8)), Agent(honest(a9))))), pair(Nonce((absNB(pair(Agent(honest(a10)), Agent(honest(a11)))) Abs_NB1)), pair(Agent(honest(a12)), Nonce((absText2(pair(Agent(honest(a13)), Agent(honest(a14)))) Abs_Text21))))), SID(sid0)] ))
 | (m = Request(Agent(honest(a0)), Agent(dishonest(i0)), Purpose(purposeText2), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i1)))) Abs_Text20)), SID(sid0)))
 | (m = State(rB, [Agent(honest(a0)), Step(2), SymKey(sk(pair(Agent(dishonest(i0)), Agent(honest(a1))))), Agent(dishonest(i1)), Nonce((absNB(pair(Agent(honest(a2)), Agent(dishonest(i2)))) Abs_NB0)), Nonce((absText2(pair(Agent(honest(a3)), Agent(dishonest(i3)))) Abs_Text20)), scrypt(SymKey(sk(pair(Agent(dishonest(i4)), Agent(honest(a4))))), pair(Nonce((absNB(pair(Agent(honest(a5)), Agent(dishonest(i5)))) Abs_NB1)), pair(Agent(honest(a6)), Nonce((absText2(pair(Agent(honest(a7)), Agent(dishonest(i6)))) Abs_Text21))))), SID(sid0)] ))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(honest(a1))))), pair(Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i0)))) Abs_Text20)), pair(Agent(honest(a3)), Nonce((absText2(pair(Agent(honest(a4)), Agent(honest(a5)))) Abs_Text21)))))))
 | (m = Iknows(scrypt(SymKey(sk(pair(Agent(honest(a0)), Agent(dishonest(i0))))), pair(Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i1)))) Abs_Text20)), pair(Agent(dishonest(i2)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i3)))) Abs_Text21)))))))
 | (m = Iknows(pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20)))))
 | (m = Iknows(pair(Nonce((ni Abs_NI0)), pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i1)))) Abs_Text20))))))
 | (m = Iknows(pair(Nonce((absNB(pair(Agent(honest(a0)), Agent(dishonest(i0)))) Abs_NB0)), pair(Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i2)))) Abs_Text20))))))
 | (m = Iknows(pair(Nonce((absNB(pair(Agent(honest(a0)), Agent(honest(a1)))) Abs_NB0)), pair(Agent(dishonest(i0)), Nonce((absText2(pair(Agent(honest(a2)), Agent(dishonest(i1)))) Abs_Text20))))))
 | (m = Iknows(pair(Nonce((absText2(pair(Agent(honest(a0)), Agent(dishonest(i0)))) Abs_Text20)), pair(Agent(dishonest(i1)), Nonce((absText2(pair(Agent(honest(a1)), Agent(dishonest(i2)))) Abs_Text21))))))
)}"


section {* Checking Fixed-point (ISO_twopass_symm) *}
lemma fp_attack_free: "~ (Attack m : ISO_twopass_symm_fp)"
  by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_0: "Iknows(Nonce((ni Abs_NI))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_1: "Iknows(Agent(dishonest(i))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_2: "State(rA, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(dishonest(i))))), Agent(dishonest(i)), SID(sid)] ) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_3: "State(rA, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(honest(a))))), Agent(honest(a)), SID(sid)] ) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_4: "Iknows(Step(0)) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_5: "Iknows(SymKey(sk(pair(Agent(dishonest(i)), Agent(dishonest(i)))))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_6: "Iknows(SID(sid)) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_7: "Iknows(SymKey(sk(pair(Agent(dishonest(i)), Agent(honest(a)))))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_8: "Iknows(Agent(honest(a))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_9: "State(rB, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(dishonest(i)), Agent(honest(a))))), Agent(dishonest(i)), SID(sid)] ) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_10: "State(rB, [Agent(honest(a)), Step(0), SymKey(sk(pair(Agent(honest(a)), Agent(honest(a))))), Agent(honest(a)), SID(sid)] ) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma init_11: "Iknows(SymKey(sk(pair(Agent(honest(a)), Agent(dishonest(i)))))) : ISO_twopass_symm_fp"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_0:  "[| 
  Iknows(crypt(K, M)) : ISO_twopass_symm_fp;
 Iknows(inv(K)) : ISO_twopass_symm_fp|] 
 ==> 
 (Iknows(M) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_1:  "[| 
  Iknows(crypt(inv(K), M)) : ISO_twopass_symm_fp;
 Iknows(K) : ISO_twopass_symm_fp|] 
 ==> 
 (Iknows(M) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_2:  "[| 
  Iknows(scrypt(K, M)) : ISO_twopass_symm_fp;
 Iknows(K) : ISO_twopass_symm_fp|] 
 ==> 
 (Iknows(M) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_3:  "[| 
  Iknows(pair(M1, M2)) : ISO_twopass_symm_fp|] 
 ==> 
 (Iknows(M1) : ISO_twopass_symm_fp) &
 (Iknows(M2) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_4:  "[| 
  Secret(M, Agent(honest(a))) : ISO_twopass_symm_fp;
 Iknows(M) : ISO_twopass_symm_fp|] 
 ==> 
 (Attack(pair(secrecy, M)) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_5:  "[| 
  Request(A, B, Purpose(purposeNB), M, SID(sid)) : ISO_twopass_symm_fp;
 ~ ( ? i . 
   B = Agent(dishonest(i)));
 ~ ( ? B A Abs_NB . 
   M = Nonce((absNB(pair(B, A)) Abs_NB)))|] 
 ==> 
 (Attack(pair(authentication, pair(A, pair(B, M)))) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_6:  "[| 
  Request(A, B, Purpose(purposeText2), M, SID(sid)) : ISO_twopass_symm_fp;
 ~ ( ? i . 
   B = Agent(dishonest(i)));
 ~ ( ? B A Abs_Text2 . 
   M = Nonce((absText2(pair(B, A)) Abs_Text2)))|] 
 ==> 
 (Attack(pair(authentication, pair(A, pair(B, M)))) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_7:  "[| 
  State(rB, [Agent(B), Step(0), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), SID(sid)] ) : ISO_twopass_symm_fp|] 
 ==> 
 (State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce((absNB(pair(Agent(B), Agent(A))) Abs_NB)), SID(sid)] ) : ISO_twopass_symm_fp) &
 (Iknows(Nonce((absNB(pair(Agent(B), Agent(A))) Abs_NB))) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_8:  "[| 
  State(rA, [Agent(A), Step(0), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(B), SID(sid)] ) : ISO_twopass_symm_fp;
 Iknows(Nonce(NB)) : ISO_twopass_symm_fp|] 
 ==> 
 (Witness(Agent(A), Agent(B), Purpose(purposeText2), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2))) : ISO_twopass_symm_fp) &
 (State(rA, [Agent(A), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(B), Nonce(NB), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2)), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2))))), SID(sid)] ) : ISO_twopass_symm_fp) &
 (Iknows(scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce((absText2(pair(Agent(A), Agent(B))) Abs_Text2)))))) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_9:  "[| 
  State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), SID(sid)] ) : ISO_twopass_symm_fp;
 Iknows(scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2))))) : ISO_twopass_symm_fp|] 
 ==> 
 (Request(Agent(B), Agent(A), Purpose(purposeText2), Nonce(Text2), SID(sid)) : ISO_twopass_symm_fp) &
 (State(rB, [Agent(B), Step(2), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), Nonce(Text2), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2)))), SID(sid)] ) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+

lemma rule_10:  "[| 
  State(rB, [Agent(B), Step(1), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), SID(sid)] ) : ISO_twopass_symm_fp;
 Iknows(SymKey(sk(pair(Agent(A), Agent(B))))) : ISO_twopass_symm_fp;
 Iknows(Nonce(NB)) : ISO_twopass_symm_fp;
 Iknows(Agent(B)) : ISO_twopass_symm_fp;
 Iknows(Nonce(Text2)) : ISO_twopass_symm_fp|] 
 ==> 
 (Request(Agent(B), Agent(A), Purpose(purposeText2), Nonce(Text2), SID(sid)) : ISO_twopass_symm_fp) &
 (State(rB, [Agent(B), Step(2), SymKey(sk(pair(Agent(A), Agent(B)))), Agent(A), Nonce(NB), Nonce(Text2), scrypt(SymKey(sk(pair(Agent(A), Agent(B)))), pair(Nonce(NB), pair(Agent(B), Nonce(Text2)))), SID(sid)] ) : ISO_twopass_symm_fp)"
by(simp only: ISO_twopass_symm_fp_def, simp only: set2pred, simp, auto?)+



section {* Security Proof(s) (ISO_twopass_symm) *}
lemma over_approx: "t :  ISO_twopass_symm ==> (set t) <= ISO_twopass_symm_fp"
  apply(rule ISO_twopass_symm.induct, simp_all)
  apply(propagate_fp, cut_tac init_0, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_1, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_2, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_3, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_4, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_5, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_6, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_7, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_8, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_9, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_10, (assumption | simp)+)
  apply(propagate_fp, cut_tac init_11, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_0, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_1, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_2, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_3, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_4, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_5, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_6, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_7, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_8, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_9, (assumption | simp)+)
  apply(propagate_fp, cut_tac rule_10, (assumption | simp)+)
done



end (* theory *)
