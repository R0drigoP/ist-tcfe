pkg load symbolic

R1=vpa(1.04005394176e3);
R2=vpa(2.07146823978e3);
R3=vpa(3.06015694112e3);
R4=vpa(4.13750728298e3);
R5=vpa(3.13205467735e3);
R6=vpa(2.01065636997e3);
R7=vpa(1.00318758033e3);
Va=vpa(5.14514577871);
Id=vpa(1.03830911265e-3);
Kb=vpa(7.04881622155e-3);
Kc=vpa(8.3495605781e3);

Z=vpa(0.0);
U=vpa(1.0);

A=[
R1+R2+R4, R3, R4, Z;
Kb*R3, Kb*R3-U, Z, Z;
R4, Z, R4+R6+R7-Kc, Z;
Z, Z, Z, -U
];

B=[Va; Z; Z; Id];

A\B
