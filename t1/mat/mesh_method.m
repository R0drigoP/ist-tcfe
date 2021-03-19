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

A=[
R1+R2+R4, R3, R4, Z;
Kb*R3, Kb*R3-U, Z, Z;
R4, Z, R4+R6+R7-Kc, Z;
Z, Z, Z, -U
];

B=[Va; Z; Z; Id];

X=A\B;
printf("op_TAB\n")
printf("I'_A = %.15f\n", X(1))
printf("I'_B = %.15f\n", X(2))
printf("I'_C = %.15f\n", X(3))
printf("I'_D = %.15f\n", X(4))
printf("op_END\n")
