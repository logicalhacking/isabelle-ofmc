Backend: Open-Source Fixedpoint Model-Checker version 2009c 
Protocol: NSL
Types:
[(Purpose,["purposeNA","purposeNB"]),(Agent False False,["A","B","s"]),(Number,["NA","NB"]),(Function,["pk"])]
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
request(A,B,Purpose (purposeNA),M,(SID sid))
 | B/=Agent (dishonest i);
M/=Nonce (na(pair(B,A)))
=>
attack(pair(authentication,pair(A,pair(B,M))))

step rule_6:
request(A,B,Purpose (purposeNB),M,(SID sid))
 | B/=Agent (dishonest i);
M/=Nonce (nb(pair(B,pair(A,Arg1))))
=>
attack(pair(authentication,pair(A,pair(B,M))))

step rule_7:
State (rA,[Agent (A),Step 0,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),(SID sid)])

=>
State (rA,[Agent (A),Step 1,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),(SID sid)]);
iknows(pair(Agent (A),Agent (B)))

step rule_8:
State (rs,[Agent (honest a),Step 0,inv(pk(Agent (honest a))),(SID sid)]);
iknows(Agent (A));
iknows(Agent (B))

=>
State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (B),Agent (A),pair(Agent (A),Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),(SID sid)]);
iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))))

step rule_9:
State (rA,[Agent (A),Step 1,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),(SID sid)]);
iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))))

=>
secret(Nonce (na(pair(Agent (A),Agent (B)))),Agent (B));
witness(Agent (A),Agent (B),Purpose (purposeNA),Nonce (na(pair(Agent (A),Agent (B)))));
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),(SID sid)]);
iknows(crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))))

step rule_10:
State (rA,[Agent (A),Step 1,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (B));
iknows(pk(Agent (B)))

=>
secret(Nonce (na(pair(Agent (A),Agent (B)))),Agent (B));
witness(Agent (A),Agent (B),Purpose (purposeNA),Nonce (na(pair(Agent (A),Agent (B)))));
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),(SID sid)]);
iknows(crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))))

step rule_11:
State (rA,[Agent (A),Step 1,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (B))

=>
secret(Nonce (na(pair(Agent (A),Agent (B)))),Agent (B));
witness(Agent (A),Agent (B),Purpose (purposeNA),Nonce (na(pair(Agent (A),Agent (B)))));
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),(SID sid)]);
iknows(crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))))

step rule_12:
State (rB,[Agent (B),Step 0,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),(SID sid)]);
iknows(crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))))

=>
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(pair(Agent (B),Agent (A)))

step rule_13:
State (rB,[Agent (B),Step 0,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),(SID sid)]);
iknows(pk(Agent (B)));
iknows(Nonce (NA));
iknows(Agent (A))

=>
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(pair(Agent (B),Agent (A)))

step rule_14:
State (rB,[Agent (B),Step 0,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),(SID sid)]);
iknows(Agent (B));
iknows(Nonce (NA));
iknows(Agent (A))

=>
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(pair(Agent (B),Agent (A)))

step rule_15:
State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (B),Agent (A),pair(Agent (A),Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),(SID sid)]);
iknows(Agent (B));
iknows(Agent (A))

=>
State (rs,[Agent (honest a),Step 2,inv(pk(Agent (honest a))),Agent (B),Agent (A),pair(Agent (A),Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),pair(Agent (B),Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),(SID sid)]);
iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))))

step rule_16:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))))

=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))))

step rule_17:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (A));
iknows(pk(Agent (A)))

=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))))

step rule_18:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (A))

=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (na(pair(Agent (A),Agent (B)))),crypt(pk(Agent (B)),pair(Nonce (na(pair(Agent (A),Agent (B)))),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (na(pair(Agent (A),Agent (B)))),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 1)))),Agent (B)))))

step rule_19:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))))
 | Nonce (NA)/=Nonce (na(pair(Agent (A),Agent (B))))
=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))))

step rule_20:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (A));
iknows(pk(Agent (A)))
 | Nonce (NA)/=Nonce (na(pair(Agent (A),Agent (B))))
=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))))

step rule_21:
State (rB,[Agent (B),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),(SID sid)]);
iknows(inv(pk(Agent (honest a))));
iknows(Agent (A))
 | Nonce (NA)/=Nonce (na(pair(Agent (A),Agent (B))))
=>
secret(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (A));
witness(Agent (B),Agent (A),Purpose (purposeNB),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))));
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (nb(pair(Agent (B),pair(Agent (A),Step 0)))),Agent (B)))))

step rule_22:
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),(SID sid)]);
iknows(crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))))

=>
request(Agent (A),Agent (B),Purpose (purposeNB),Nonce (NB),(SID sid));
State (rA,[Agent (A),Step 3,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)]);
iknows(crypt(pk(Agent (B)),Nonce (NB)))

step rule_23:
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),(SID sid)]);
iknows(pk(Agent (A)));
iknows(Nonce (NA));
iknows(Nonce (NB));
iknows(Agent (B))

=>
request(Agent (A),Agent (B),Purpose (purposeNB),Nonce (NB),(SID sid));
State (rA,[Agent (A),Step 3,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)]);
iknows(crypt(pk(Agent (B)),Nonce (NB)))

step rule_24:
State (rA,[Agent (A),Step 2,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),(SID sid)]);
iknows(Agent (A));
iknows(Nonce (NA));
iknows(Nonce (NB));
iknows(Agent (B))

=>
request(Agent (A),Agent (B),Purpose (purposeNB),Nonce (NB),(SID sid));
State (rA,[Agent (A),Step 3,Agent (B),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (A))),pk(Agent (A)),pair(Agent (A),Agent (B)),pk(Agent (B)),crypt(inv(pk(Agent (honest a))),pair(Agent (B),pk(Agent (B)))),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)]);
iknows(crypt(pk(Agent (B)),Nonce (NB)))

step rule_25:
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),(SID sid)]);
iknows(crypt(pk(Agent (B)),Nonce (NB)))

=>
request(Agent (B),Agent (A),Purpose (purposeNA),Nonce (NA),(SID sid));
State (rB,[Agent (B),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)])

step rule_26:
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),(SID sid)]);
iknows(pk(Agent (B)));
iknows(Nonce (NB))

=>
request(Agent (B),Agent (A),Purpose (purposeNA),Nonce (NA),(SID sid));
State (rB,[Agent (B),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)])

step rule_27:
State (rB,[Agent (B),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),(SID sid)]);
iknows(Agent (B));
iknows(Nonce (NB))

=>
request(Agent (B),Agent (A),Purpose (purposeNA),Nonce (NA),(SID sid));
State (rB,[Agent (B),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (B))),pk(Agent (B)),Agent (A),Nonce (NA),crypt(pk(Agent (B)),pair(Nonce (NA),Agent (A))),pair(Agent (B),Agent (A)),pk(Agent (A)),crypt(inv(pk(Agent (honest a))),pair(Agent (A),pk(Agent (A)))),Nonce (NB),crypt(pk(Agent (A)),pair(Nonce (NA),pair(Nonce (NB),Agent (B)))),crypt(pk(Agent (B)),Nonce (NB)),(SID sid)])


section initial state:
init_0: iknows(Nonce (ni));
init_1: iknows(Agent (dishonest i));
init_2: State (rA,[Agent (honest a),Step 0,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),(SID sid)]);
init_3: State (rA,[Agent (honest a),Step 0,Agent (honest a),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),(SID sid)]);
init_4: iknows(Step 0);
init_5: iknows(pk(Agent (honest a)));
init_6: iknows(Agent (honest a));
init_7: iknows(inv(pk(Agent (dishonest i))));
init_8: iknows(pk(Agent (dishonest i)));
init_9: iknows((SID sid));
init_10: iknows(Agent (honest a));
init_11: State (rB,[Agent (honest a),Step 0,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),(SID sid)]);
init_12: State (rs,[Agent (honest a),Step 0,inv(pk(Agent (honest a))),(SID sid)]);

section fixedpoint:
fp_0: iknows(pair(Agent (honest a),Agent (honest a)));
fp_1: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_2: State (rA,[Agent (honest a),Step 1,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (dishonest i)),(SID sid)]);
fp_3: State (rA,[Agent (honest a),Step 1,Agent (honest a),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (honest a)),(SID sid)]);
fp_4: State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (dishonest i),Agent (dishonest i),pair(Agent (dishonest i),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),(SID sid)]);
fp_5: State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (honest a),Agent (dishonest i),pair(Agent (dishonest i),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),(SID sid)]);
fp_6: State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (dishonest i),Agent (honest a),pair(Agent (honest a),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),(SID sid)]);
fp_7: State (rs,[Agent (honest a),Step 1,inv(pk(Agent (honest a))),Agent (honest a),Agent (honest a),pair(Agent (honest a),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),(SID sid)]);
fp_8: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (ni),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),(SID sid)]);
fp_9: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (ni),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),(SID sid)]);
fp_10: iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))));
fp_11: iknows(crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))));
fp_12: iknows(pair(Agent (honest a),Agent (honest a)));
fp_13: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_14: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_15: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_16: secret(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i));
fp_17: witness(Agent (honest a),Agent (dishonest i),Purpose (purposeNA),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))));
fp_18: State (rA,[Agent (honest a),Step 2,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),(SID sid)]);
fp_19: secret(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a));
fp_20: witness(Agent (honest a),Agent (honest a),Purpose (purposeNA),Nonce (na(pair(Agent (honest a),Agent (honest a)))));
fp_21: State (rA,[Agent (honest a),Step 2,Agent (honest a),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (na(pair(Agent (honest a),Agent (honest a)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))),(SID sid)]);
fp_22: State (rs,[Agent (honest a),Step 2,inv(pk(Agent (honest a))),Agent (dishonest i),Agent (dishonest i),pair(Agent (dishonest i),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),pair(Agent (dishonest i),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),(SID sid)]);
fp_23: State (rs,[Agent (honest a),Step 2,inv(pk(Agent (honest a))),Agent (honest a),Agent (dishonest i),pair(Agent (dishonest i),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),pair(Agent (honest a),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),(SID sid)]);
fp_24: State (rs,[Agent (honest a),Step 2,inv(pk(Agent (honest a))),Agent (dishonest i),Agent (honest a),pair(Agent (honest a),Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),pair(Agent (dishonest i),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),(SID sid)]);
fp_25: State (rs,[Agent (honest a),Step 2,inv(pk(Agent (honest a))),Agent (honest a),Agent (honest a),pair(Agent (honest a),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),pair(Agent (honest a),Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),(SID sid)]);
fp_26: secret(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (dishonest i));
fp_27: witness(Agent (honest a),Agent (dishonest i),Purpose (purposeNB),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))));
fp_28: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (ni),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_29: secret(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a));
fp_30: witness(Agent (honest a),Agent (honest a),Purpose (purposeNB),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))));
fp_31: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (ni),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_32: iknows(crypt(pk(Agent (honest a)),pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))));
fp_33: iknows(crypt(pk(Agent (dishonest i)),pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))));
fp_34: iknows(crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))));
fp_35: iknows(crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))));
fp_36: iknows(pair(Agent (honest a),Agent (honest a)));
fp_37: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_38: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_39: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_40: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a)));
fp_41: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)));
fp_42: iknows(pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_43: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (na(pair(Agent (honest a),Agent (honest a)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),(SID sid)]);
fp_44: iknows(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))));
fp_45: iknows(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))));
fp_46: iknows(pair(Agent (honest a),Agent (honest a)));
fp_47: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_48: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_49: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_50: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a)));
fp_51: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)));
fp_52: iknows(pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_53: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),(SID sid)]);
fp_54: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),(SID sid)]);
fp_55: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),(SID sid)]);
fp_56: State (rB,[Agent (honest a),Step 1,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),(SID sid)]);
fp_57: secret(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),Agent (honest a));
fp_58: witness(Agent (honest a),Agent (honest a),Purpose (purposeNB),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))));
fp_59: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (na(pair(Agent (honest a),Agent (honest a)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),Agent (honest a)))),(SID sid)]);
fp_60: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNB),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),(SID sid));
fp_61: State (rA,[Agent (honest a),Step 3,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),Nonce (na(pair(Agent (honest a),Agent (dishonest i))))),(SID sid)]);
fp_62: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNB),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),(SID sid));
fp_63: State (rA,[Agent (honest a),Step 3,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0))))),(SID sid)]);
fp_64: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNB),Nonce (ni),(SID sid));
fp_65: State (rA,[Agent (honest a),Step 3,Agent (dishonest i),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (ni),Agent (dishonest i)))),crypt(pk(Agent (dishonest i)),Nonce (ni)),(SID sid)]);
fp_66: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNA),Nonce (ni),(SID sid));
fp_67: State (rB,[Agent (honest a),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (ni),crypt(pk(Agent (honest a)),pair(Nonce (ni),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0))))),(SID sid)]);
fp_68: iknows(crypt(pk(Agent (dishonest i)),Nonce (ni)));
fp_69: iknows(crypt(pk(Agent (dishonest i)),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0))))));
fp_70: iknows(crypt(pk(Agent (dishonest i)),Nonce (na(pair(Agent (honest a),Agent (dishonest i))))));
fp_71: iknows(crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),Agent (honest a)))));
fp_72: iknows(pair(Agent (honest a),Agent (honest a)));
fp_73: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_74: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_75: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_76: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a)));
fp_77: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)));
fp_78: iknows(pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_79: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_80: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_81: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_82: State (rB,[Agent (honest a),Step 2,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))),(SID sid)]);
fp_83: request(Agent (honest a),Agent (honest a),Purpose (purposeNB),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),(SID sid));
fp_84: State (rA,[Agent (honest a),Step 3,Agent (honest a),pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (na(pair(Agent (honest a),Agent (honest a)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),Agent (honest a)))),crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1))))),(SID sid)]);
fp_85: iknows(crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1))))));
fp_86: iknows(crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))));
fp_87: iknows(crypt(pk(Agent (dishonest i)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))));
fp_88: iknows(crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 0)))),Agent (honest a)))));
fp_89: iknows(crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))));
fp_90: iknows(pair(Agent (honest a),Agent (honest a)));
fp_91: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_92: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_93: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_94: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a)));
fp_95: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)));
fp_96: iknows(pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_97: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_98: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_99: request(Agent (honest a),Agent (honest a),Purpose (purposeNA),Nonce (na(pair(Agent (honest a),Agent (honest a)))),(SID sid));
fp_100: State (rB,[Agent (honest a),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (honest a),Nonce (na(pair(Agent (honest a),Agent (honest a)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),Agent (honest a))),pair(Agent (honest a),Agent (honest a)),pk(Agent (honest a)),crypt(inv(pk(Agent (honest a))),pair(Agent (honest a),pk(Agent (honest a)))),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (honest a)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1)))),Agent (honest a)))),crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (honest a),Step 1))))),(SID sid)]);
fp_101: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNA),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),(SID sid));
fp_102: State (rB,[Agent (honest a),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),crypt(pk(Agent (honest a)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0))))),(SID sid)]);
fp_103: request(Agent (honest a),Agent (dishonest i),Purpose (purposeNA),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),(SID sid));
fp_104: State (rB,[Agent (honest a),Step 3,pk(Agent (honest a)),Agent (honest a),inv(pk(Agent (honest a))),pk(Agent (honest a)),Agent (dishonest i),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (honest a)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (dishonest i))),pair(Agent (honest a),Agent (dishonest i)),pk(Agent (dishonest i)),crypt(inv(pk(Agent (honest a))),pair(Agent (dishonest i),pk(Agent (dishonest i)))),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),crypt(pk(Agent (dishonest i)),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)))),crypt(pk(Agent (honest a)),Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0))))),(SID sid)]);
fp_105: iknows(pair(Agent (honest a),Agent (honest a)));
fp_106: iknows(pair(Agent (honest a),Agent (dishonest i)));
fp_107: iknows(pair(Agent (dishonest i),pk(Agent (dishonest i))));
fp_108: iknows(pair(Agent (honest a),pk(Agent (honest a))));
fp_109: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),Agent (honest a)));
fp_110: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a)));
fp_111: iknows(pair(Nonce (ni),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_112: iknows(pair(Nonce (na(pair(Agent (honest a),Agent (dishonest i)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));
fp_113: iknows(pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),pair(Nonce (nb(pair(Agent (honest a),pair(Agent (dishonest i),Step 0)))),Agent (honest a))));

section abstraction:
NA->Nonce (na(pair(A,B)));
NB->Nonce (nb(pair(B,pair(A,equals(pair(NA,Nonce (na(pair(A,B)))))))))

