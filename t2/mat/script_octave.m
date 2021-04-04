pkg load symbolic
R1=1.04005394176e3;
R2=2.07146823978e3;
R3=3.06015694112e3;
R4=4.13750728298e3;
R5=3.13205467735e3;
R6=2.01065636997e3;
R7=1.00318758033e3;
Vs=5.14514577871;
C=1.03830911265e-6;
Kb=7.04881622155e-3;
Kd=8.3495605781e3;
Ic=0.;


Z=0.0;
U=1.0;

A2=[
U, Z, Z, Z, Z, Z, Z;
1/R1, -(1/R1+1/R2+1/R3), 1/R2, 1/R3, Z, Z, Z; 
Z, 1/R2+Kb, -1/R2, -Kb, Z, Z, Z;
Z, Z, Z, U, Z, Kd/R6, -U;
Z, -Kb, Z, 1/R5+Kb, -1/R5, Z, Z;
Z, Z, Z, Z, Z, -(1/R6+1/R7), 1/R7;
Z, 1/R3, Z, -(1/R4+1/R5+1/R3), 1/R5, 1/R7, -1/R7
];

B2=[Vs; Z; Z; Z; Ic; Z; -Ic];

X2=A2\B2;



Vx=X2(5)-X2(7);

A=[
-(1/R1+1/R2+1/R3), 1/R2, 1/R3, Z, Z;
1/R2+Kb, -1/R2, -Kb, Z, Z; 
Z, Z, U, Z, -U+Kd/(R6+R7);
Z, Z, Z, U, -U;
1/R3-Kb, Z, -(1/R4+1/R3)+Kb, Z, 1/(R6+R7);
];

B=[Z; Z; Z; Vx; Z];

X=A\B

Ix=X(4)/R5;
Req=Vx/Ix;


w= 1.e3*2*pi

A4=[
U, Z, Z, Z, Z, Z, Z;
1/R1, -(1/R1+1/R2+1/R3), 1/R2, 1/R3, Z, Z, Z; 
Z, 1/R2+Kb, -1/R2, -Kb, Z, Z, Z;
Z, Z, Z, U, Z, Kd/R6, -U;
Z, -Kb, Z, 1/R5+Kb, -1/R5-i*w*C, Z, i*w*C;
Z, Z, Z, Z, Z, -(1/R6+1/R7), 1/R7;
Z, 1/R3, Z, -(1/R4+1/R5+1/R3), 1/R5+i*w*C, 1/R7, -1/R7-i*w*C
];

B4=[-i;Z;Z;Z;Z;Z;Z];

X4=A4\B4


printf("op1_TAB\n")
printf("$V_1$ = %.15e\n", X2(1))
printf("$V_2$ = %.15e\n", X2(2))
printf("$V_3$ = %.15e\n", X2(3))
printf("$V_5$ = %.15e\n", X2(4))
printf("$V_6$ = %.15e\n", X2(5))
printf("$V_7$ = %.15e\n", X2(6))
printf("$V_8$ = %.15e\n", X2(7))
printf("op1_END\n")

printf("op_TAB\n")
printf("$V_x$ = %.15e\n", Vx)
printf("$V_2$ = %.15e\n", X(1))
printf("$V_3$ = %.15e\n", X(2))
printf("$V_5$ = %.15e\n", X(3))
printf("$V_6$ = %.15e\n", X(4))
printf("$V_8$ = %.15e\n", X(5))
printf("$I_x$ = %.15e\n", Ix)
printf("$R_eq$ = %.15e\n", Req)
printf("op_END\n")


%time axis: 0 to 20ms with 1us steps
t=0:1e-6:20e-3; %s

#Condição inicial com o ground em V4

v6=Vx*exp(-t/(Req*C));

hf = figure ();
plot (t, v6, "g");
hold on;

xlabel ("t[ms]");
ylabel ("v6(t), vo(t) [V]");
print (hf, "forced.eps", "-depsc");



%time axis: -5 to 0ms with 1us steps
t2=-5e-3:1e-6:0;

vn=Vx*exp(-t/(Req*C));
vf=abs(X4(5))*cos(w*t+arg(X4(5)));
vt=vn+vf;
vi=Vx+0*t2;


vsp=cos(w*t-pi/2);
vsn=Vs+0*t2;

h2 = figure ();
plot (t, vt, "g3");
hold on;
plot (t2, vi, "g3");
hold on;
plot (t, vsp, "g2");
hold on;
plot (t2, vsn, "g2");

xlabel ("t[ms]");
ylabel ("v6(t), vo(t) [V],");
print (h2, "meh.eps", "-depsc");


%time axis: -1 to 6 with 1us steps
t3=-1:1e-1:6;

f=10.^(t3);
V6f=(-Kb*X4(2) + (1/R5+Kb)*X4(4) + i*2*pi*f*C*X4(7))/(1/R5+i*2*pi*f*C)

fase=arg(V6f);

h3 = figure ();
plot (t3, fase, "g5");


xlabel ("f[Db]");
ylabel ("fase [V],");
print (h3, "fase.eps", "-depsc");



