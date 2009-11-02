Backend: Open-Source Fixedpoint Model-Checker version 2009c 
Protocol: WideMouthFrog
Types:
[(Purpose,["purposeKAB"]),(Agent False False,["A","B","s"]),(Number,["TA","TS"]),(SymmetricKey,["KAB"]),(Function,["sk"])]
section rules:
step rule_0:
iknows(crypt(K,M));
iknows(inv(K))

=>
iknows(M)

step rule_1:
iknows(crypt(inv(K),M));
iknows(K)

=>
iknows(M)

step rule_2:
iknows(scrypt(K,M));
iknows(K)

=>
iknows(M)

step rule_3:
iknows(pair(M1,M2))

=>
iknows(M1);
iknows(M2)

step rule_4:
secret(M,Agent (honest a));
iknows(M)

=>
attack(pair(secrecy,M))

step rule_5:
request(A,B,Purpose (purposeTA),M,(SID sid))
 | B/=Agent (dishonest i);
M/=Nonce (absTA(pair(B,A)))
=>
attack(pair(authentication,pair(A,pair(B,M))))

step rule_6:
request(A,B,Purpose (purposeKAB),M,(SID sid))
 | B/=Agent (dishonest i);
M/=SymKey (absKAB(pair(B,A)))
=>
attack(pair(authentication,pair(A,pair(B,M))))

step rule_7:
request(A,B,Purpose (purposeTS),M,(SID sid))
 | B/=Agent (dishonest i);
M/=Nonce (absTS(pair(B,A)))
=>
attack(pair(authentication,pair(A,pair(B,M))))

step rule_8:
State (rA,[Agent (A),Step 0,SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),(SID sid)])

=>
secret(SymKey (absKAB(pair(Agent (A),Agent (B)))),Agent (B));
witness(Agent (A),Agent (B),Purpose (purposeKAB),SymKey (absKAB(pair(Agent (A),Agent (B)))));
State (rA,[Agent (A),Step 1,SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),Nonce (absTA(pair(Agent (A),Agent (B)))),SymKey (absKAB(pair(Agent (A),Agent (B)))),pair(Agent (A),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (A),Agent (B)))),pair(Agent (B),SymKey (absKAB(pair(Agent (A),Agent (B)))))))),(SID sid)]);
iknows(pair(Agent (A),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (A),Agent (B)))),pair(Agent (B),SymKey (absKAB(pair(Agent (A),Agent (B)))))))))

step rule_9:
State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (B),Agent (honest a)))),SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),Agent (A),(SID sid)]);
iknows(Agent (A));
iknows(scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (TA),pair(Agent (B),SymKey (KAB)))))

=>
State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (B),Agent (honest a)))),SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),Agent (A),SymKey (KAB),Nonce (TA),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (TA),pair(Agent (B),SymKey (KAB)))),pair(Agent (A),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (TA),pair(Agent (B),SymKey (KAB))))),Nonce (absTS(pair(Agent (B),Agent (A)))),scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (B),Agent (A)))),pair(Agent (A),SymKey (KAB)))),(SID sid)]);
iknows(scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (B),Agent (A)))),pair(Agent (A),SymKey (KAB)))))

step rule_10:
State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (B),Agent (honest a)))),SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),Agent (A),(SID sid)]);
iknows(Agent (A));
iknows(SymKey (sk(pair(Agent (A),Agent (honest a)))));
iknows(Nonce (TA));
iknows(Agent (B));
iknows(SymKey (KAB))

=>
State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (B),Agent (honest a)))),SymKey (sk(pair(Agent (A),Agent (honest a)))),Agent (B),Agent (A),SymKey (KAB),Nonce (TA),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (TA),pair(Agent (B),SymKey (KAB)))),pair(Agent (A),scrypt(SymKey (sk(pair(Agent (A),Agent (honest a)))),pair(Nonce (TA),pair(Agent (B),SymKey (KAB))))),Nonce (absTS(pair(Agent (B),Agent (A)))),scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (B),Agent (A)))),pair(Agent (A),SymKey (KAB)))),(SID sid)]);
iknows(scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (B),Agent (A)))),pair(Agent (A),SymKey (KAB)))))

step rule_11:
State (rB,[Agent (B),Step 0,SymKey (sk(pair(Agent (B),Agent (honest a)))),Agent (A),(SID sid)]);
iknows(scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (TS),pair(Agent (A),SymKey (KAB)))))

=>
request(Agent (B),Agent (A),Purpose (purposeKAB),SymKey (KAB),(SID sid));
State (rB,[Agent (B),Step 1,SymKey (sk(pair(Agent (B),Agent (honest a)))),Agent (A),SymKey (KAB),Nonce (TS),scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (TS),pair(Agent (A),SymKey (KAB)))),(SID sid)])

step rule_12:
State (rB,[Agent (B),Step 0,SymKey (sk(pair(Agent (B),Agent (honest a)))),Agent (A),(SID sid)]);
iknows(SymKey (sk(pair(Agent (B),Agent (honest a)))));
iknows(Nonce (TS));
iknows(Agent (A));
iknows(SymKey (KAB))

=>
request(Agent (B),Agent (A),Purpose (purposeKAB),SymKey (KAB),(SID sid));
State (rB,[Agent (B),Step 1,SymKey (sk(pair(Agent (B),Agent (honest a)))),Agent (A),SymKey (KAB),Nonce (TS),scrypt(SymKey (sk(pair(Agent (B),Agent (honest a)))),pair(Nonce (TS),pair(Agent (A),SymKey (KAB)))),(SID sid)])


section initial state:
init_0: iknows(Nonce (ni));
init_1: iknows(Agent (dishonest i));
init_2: State (rA,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),(SID sid)]);
init_3: State (rA,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),(SID sid)]);
init_4: iknows(Step 0);
init_5: iknows(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))));
init_6: iknows((SID sid));
init_7: iknows(Agent (honest a));
init_8: State (rB,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),(SID sid)]);
init_9: State (rB,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),(SID sid)]);
init_10: State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),(SID sid)]);
init_11: State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),Agent (honest a),(SID sid)]);
init_12: State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),(SID sid)]);
init_13: State (rs,[Agent (honest a),Step 0,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),Agent (honest a),(SID sid)]);

section fixedpoint:
fp_0: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))));
fp_1: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))));
fp_2: secret(SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i));
fp_3: witness(Agent (honest a),Agent (dishonest i),Purpose (purposeKAB),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))));
fp_4: State (rA,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),(SID sid)]);
fp_5: secret(SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),Agent (honest a));
fp_6: witness(Agent (honest a),Agent (honest a),Purpose (purposeKAB),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))));
fp_7: State (rA,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))),(SID sid)]);
fp_8: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (ni),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_9: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (ni),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_10: iknows(scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))));
fp_11: iknows(scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))));
fp_12: iknows(scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))));
fp_13: iknows(scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))));
fp_14: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))));
fp_15: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))));
fp_16: iknows(pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_17: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_18: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_19: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_20: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_21: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))),Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),(SID sid)]);
fp_22: request(Agent (honest a),Agent (dishonest i),Purpose (purposeKAB),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),(SID sid));
fp_23: State (rB,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_24: request(Agent (honest a),Agent (dishonest i),Purpose (purposeKAB),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),(SID sid));
fp_25: State (rB,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_26: request(Agent (honest a),Agent (honest a),Purpose (purposeKAB),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),(SID sid));
fp_27: State (rB,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),(SID sid)]);
fp_28: iknows(scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))));
fp_29: iknows(scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))));
fp_30: iknows(scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))));
fp_31: iknows(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))));
fp_32: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))));
fp_33: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))));
fp_34: iknows(pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_35: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_36: iknows(pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_37: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_38: iknows(pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))));
fp_39: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))));
fp_40: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_41: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_42: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))),Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),(SID sid)]);
fp_43: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_44: State (rB,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))),Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a))))))),(SID sid)]);
fp_45: iknows(scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))));
fp_46: iknows(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))));
fp_47: iknows(SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))));
fp_48: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))));
fp_49: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))));
fp_50: iknows(pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_51: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_52: iknows(pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_53: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_54: iknows(pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))));
fp_55: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))));
fp_56: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_57: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_58: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))))),(SID sid)]);
fp_59: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_60: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (dishonest i),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (ni),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_61: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_62: State (rs,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),Agent (honest a),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (ni),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),pair(Agent (dishonest i),scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (ni),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_63: State (rB,[Agent (honest a),Step 1,SymKey (sk(pair(Agent (honest a),Agent (honest a)))),Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))),Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))),(SID sid)]);
fp_64: iknows(scrypt(SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))),pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))))));
fp_65: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (honest a)))))))));
fp_66: iknows(pair(Agent (honest a),scrypt(SymKey (sk(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (absTA(pair(Agent (honest a),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))))));
fp_67: iknows(pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_68: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_69: iknows(pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a))))));
fp_70: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (sk(pair(Agent (dishonest i),Agent (honest a)))))));
fp_71: iknows(pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))));
fp_72: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (honest a)))),pair(Agent (honest a),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))));
fp_73: iknows(pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i))))));
fp_74: iknows(pair(Nonce (absTS(pair(Agent (dishonest i),Agent (dishonest i)))),pair(Agent (dishonest i),SymKey (absKAB(pair(Agent (honest a),Agent (dishonest i)))))));

section abstraction:
TA->Nonce (absTA(pair(A,B)));
KAB->SymKey (absKAB(pair(A,B)));
TS->Nonce (absTS(pair(B,A)))

