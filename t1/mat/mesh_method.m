pkg load symbolic

R1=double(1.04005394176e3);
R2=double(2.07146823978e3);
R3=double(3.06015694112e3);
R4=double(4.13750728298e3);
R5=double(3.13205467735e3);
R6=double(2.01065636997e3);
R7=double(1.00318758033e3);
Va=double(5.14514577871);
Id=double(1.03830911265e-3);
Kb=double(7.04881622155e-3);
Kc=double(8.3495605781e3);

Z=double(0.0);
U=double(1.0);


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
R1+R2+R4, R3, R4, Z;
Kb*R3, Kb*R3-U, Z, Z;
R4, Z, R4+R6+R7-Kc, Z;
Z, Z, Z, -U
];

B=[Va; Z; Z; Id];

X=A\B;
printf("op_TAB\n")
printf("$I'_A$ = %.15f\n", X(1))
printf("$I'_B$ = %.15f\n", X(2))
printf("$I'_C$ = %.15f\n", X(3))
printf("$I'_D$ = %.15f\n", X(4))
printf("op_END\n")

printf("op1_TAB\n")
printf("$V_1$ = %.15f\n", X2(1))
printf("$V_2$ = %.15f\n", X2(2))
printf("$V_3$ = %.15f\n", X2(3))
printf("$V_4$ = %.15f\n", X2(4))
printf("$V_5$ = %.15f\n", X2(5))
printf("$V_6$ = %.15f\n", X2(6))
printf("$V_7$ = %.15f\n", X2(7))
printf("op1_END\n")

printf("op2_TAB\n")
printf("$I_b$ = %.15f\n", X(2))
printf("$R_1[i]$ = %.15f\n", X(1))
printf("$R_2[i]$ = %.15f\n", X(2))
printf("$R_3[i]$ = %.15f\n", X(1)+X(2))
printf("$R_4[i]$ = %.15f\n", X(1)+X(3))
printf("$R_5[i]$ = %.15f\n", X(2)+X(4))
printf("$R_6[i]$ = %.15f\n", X(3))
printf("$R_7[i]$ = %.15f\n", X(3))
printf("$V_c[i]$ = %.15f\n", -X(3)-X(4))
printf("$V_a[i]$ = %.15f\n", -X(1))
printf("op2_END\n")
