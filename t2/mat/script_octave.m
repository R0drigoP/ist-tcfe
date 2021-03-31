R1=1.04005394176e3;
R2=2.07146823978e3;
R3=3.06015694112e3;
R4=4.13750728298e3;
R5=3.13205467735e3;
R6=2.01065636997e3;
R7=1.00318758033e3;
Va=5.14514577871;
Id=1.03830911265e-3;
Kb=7.04881622155e-3;
Kc=8.3495605781e3;

Z=0.0;
U=1.0;

A2=[
1/R5, Z, Kb, Z, Z, -(1/R5+Kb), Z; 
Z, 1/R2, -(1/R2+Kb), Z, Z, Kb, Z;
Z, 1/R2, -(1/R1 + 1/R2 + 1/R6), 1/R1, Z, 1/R6, Z;
Z, Z, Z, U, -U, Z, Z;
Z, Z, 1/R1, -1/R1, -(1/R4+1/R6), 1/R4, 1/R6;
Z, Z, Z, Z, Kc, -R6, -Kc;
Z, Z, Z, Z, 1/R6, Z, -(1/R6+1/R7)
];

B2=[Id; Z; Z; Va; Z; Z; Z];

X2=A2\B2;

A=[
R1+R3+R4, R3, R4, Z;
Kb*R3, Kb*R3-U, Z, Z;
R4, Z, R4+R6+R7-Kc, Z
]
B=[Va; Z; Z]

X=A\B;
printf("op_TAB\n")
printf("$I'_A$ = %.15e\n", X(1))
printf("$I'_B$ = %.15e\n", X(2))
printf("$I'_C$ = %.15e\n", X(3))
printf("$I'_D$ = %.15e\n", -Id)
printf("op_END\n")

printf("op1_TAB\n")
printf("$V_1$ = %.15e\n", X2(1))
printf("$V_2$ = %.15e\n", X2(2))
printf("$V_3$ = %.15e\n", X2(3))
printf("$V_4$ = %.15e\n", X2(4))
printf("$V_5$ = %.15e\n", X2(5))
printf("$V_6$ = %.15e\n", X2(6))
printf("$V_7$ = %.15e\n", X2(7))
printf("op1_END\n")

printf("op2_TAB\n")
printf("$I_b$ = %.15e\n", X(2))
printf("$R_1[i]$ = %.15e\n", X(1))
printf("$R_2[i]$ = %.15e\n", X(2))
printf("$R_3[i]$ = %.15e\n", X(1)+X(2))
printf("$R_4[i]$ = %.15e\n", X(1)+X(3))
printf("$R_5[i]$ = %.15e\n", X(2)-Id)
printf("$R_6[i]$ = %.15e\n", X(3))
printf("$R_7[i]$ = %.15e\n", X(3))
printf("$V_c[i]$ = %.15e\n", -X(3)+Id)
printf("$V_a[i]$ = %.15e\n", -X(1))
printf("op2_END\n")
