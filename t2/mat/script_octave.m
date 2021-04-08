pkg load symbolic

file = fopen('data.txt', 'r');
v = fscanf(file, '%f');
fclose(file)

R1 = v(1)*1000
R2 = v(2)*1000
R3 = v(3)*1000
R4 = v(4)*1000
R5 = v(5)*1000
R6 = v(6)*1000
R7 = v(7)*1000
Vs = v(8)
C = v(9)/1e6
Kb = v(10)/1000
Kd = v(11)*1000

#{
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
#}
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

I1=(X2(1)-X2(2))/R1;
I2=(X2(2)-X2(3))/R2;
I3=(X2(2)-X2(4))/R3;
I4=(-X2(4))/R4;
I5=(X2(4)-X2(5))/R5;
I6=(-X2(6))/R6;



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

B4=[1;Z;Z;Z;Z;Z;Z];

X4=A4\B4




%time axis: 0 to 20ms with 1us steps
t=0:1e-6:20e-3; %s

#Condição inicial com o ground em V4

v6=Vx*exp(-t/(Req*C));

hf = figure ();
plot (t, v6, "g");
hold on;
legend("V6n","location","northeastoutside");
xlabel ("t[s]");
ylabel ("v6(t) [V]");
hold off
print (hf, "natural.eps", "-depsc");



%time axis: -5 to 0ms with 1us steps
t2=-5e-3:1e-6:0;

vn=Vx*exp(-t/(Req*C));
vf=abs(X4(5))*sin(w*t+arg(X4(5)));
vt=vn+vf;
vi=Vx+0*t2;


vsp=cos(w*t-pi/2);
vsn=Vs+0*t2;

h2 = figure ();
plot (t, vt, "g3");
hold on;
plot (t2, vi, "g3");
#hold on;
plot (t, vsp, "g2");
#hold on;
plot (t2, vsn, "g2");

legend("V6","V6","Vs","Vs","location","northeastoutside");
xlabel ("t[s]");
ylabel ("v6(t), vs(t) [V],");
hold off
print (h2, "total.eps", "-depsc");


%time axis: -1 to 6 with 1us steps

t3=ones(71);

V6f = ones(71);
V6m = ones(71);

Vcf = ones(71);
Vcm = ones(71);


#f1=10.^(t3);

for i = 0:70

f = 10^(i*1e-1 - 1);

t3(i+1) = i*1e-1 - 1;

w1= f*2*pi;

Afreq=[
U, Z, Z, Z, Z, Z, Z;
1/R1, -(1/R1+1/R2+1/R3), 1/R2, 1/R3, Z, Z, Z; 
Z, 1/R2+Kb, -1/R2, -Kb, Z, Z, Z;
Z, Z, Z, U, Z, Kd/R6, -U;
Z, -Kb, Z, 1/R5+Kb, -1/R5-j*w1*C, Z, j*w1*C;
Z, Z, Z, Z, Z, -(1/R6+1/R7), 1/R7;
Z, 1/R3, Z, -(1/R4+1/R5+1/R3), 1/R5+j*w1*C, 1/R7, -1/R7-j*w1*C
];

Bfreq=[1;Z;Z;Z;Z;Z;Z];

Xfreq=Afreq\Bfreq;

V6f(i+1) = arg(Xfreq(5));
V6m(i+1) = abs(Xfreq(5));

Vcf(i+1) = arg(Xfreq(5) - Xfreq(7));
Vcm(i+1) = abs(Xfreq(5) - Xfreq(7));

endfor

faseVs=0*t3;



h3 = figure ();
plot (t3, V6f*180/pi, "g5");
hold on;
plot (t3, faseVs*180/pi, "g3");
#hold on;
plot (t3, Vcf*180/pi, "g4");

legend("V6","Vs(escuro)","VC(rosa)", "location","northeastoutside");

xlabel ("f[ln(Hz)]");
ylabel ("fase [degrees],");
hold off
print (h3, "phase.eps", "-depsc");


#TV6=20*log10(abs(-Kb*X4(2) + (1/R5+Kb)*X4(4) + i*2*pi*f*C*X4(7)))-20*log10(abs(1/R5+i*2*pi*f*C))

#TV8 = 20*log10(abs(X4(7)));

TVs=20*log10(1+0*t3);

#TVc=20*log10(abs(VV6-X4(7)))

h4 = figure ();
plot (t3, 20*log10(V6m), "g5");
hold on;
plot (t3, TVs, "g3");
#hold on;
plot (t3, 20*log10(Vcm), "g4");

#h={'V6','Vs','VC'}
legend("V6","Vs(escuro)","VC(rosa)", "location","northeastoutside");

xlabel ("f[ln(Hz)]");
ylabel ("Magnitude [dB],");
hold off
print (h4, "magnitude.eps", "-depsc");


printf("op2_TAB\n")
printf("$\\widetilde{V_1}$ = %.15e + i%.15e\n", real(X4(1)), imag(X4(1)))
printf("$\\widetilde{V_2}$ = %.15e + i%.15e\n", real(X4(2)), imag(X4(2)))
printf("$\\widetilde{V_3}$ = %.15e + i%.15e\n", real(X4(3)), imag(X4(3)))
printf("$\\widetilde{V_5}$ = %.15e + i%.15e\n", real(X4(4)), imag(X4(4)))
printf("$\\widetilde{V_6}$ = %.15e + i%.15e\n", real(X4(5)), imag(X4(5)))
printf("$\\widetilde{V_7}$ = %.15e + i%.15e\n", real(X4(6)), imag(X4(6)))
printf("$\\widetilde{V_8}$ = %.15e + i%.15e\n", real(X4(7)), imag(X4(7)))
printf("op2_END\n")

printf("op1_TAB\n")
printf("$V_1$ = %.15e\n", X2(1))
printf("$V_2$ = %.15e\n", X2(2))
printf("$V_3$ = %.15e\n", X2(3))
printf("$V_5$ = %.15e\n", X2(4))
printf("$V_6$ = %.15e\n", X2(5))
printf("$V_7$ = %.15e\n", X2(6))
printf("$V_8$ = %.15e\n", X2(7))
printf("$R1[i]$ = %.15e\n", I1)
printf("$R2[i]$ = %.15e\n", I2)
printf("$R3[i]$ = %.15e\n", I3)
printf("$R4[i]$ = %.15e\n", I4)
printf("$R5[i]$ = %.15e\n", I5)
printf("$Id$ = %.15e\n", I6)
printf("op1_END\n")

printf("op_TAB\n")
printf("$V_x$ = %.15e V\n", Vx)
printf("$V_6$ = %.15e V\n", X(4))
printf("$V_8$ = %.15e V\n", X(5))
printf("$I_x$ = %.15e A\n", Ix)
printf("$R_eq$ = %.15e $\\Omega$\n", Req)
printf("op_END\n")


spice1 = fopen("spice1.cir", "w");

#fprintf(spice1, ".OP\n");
fprintf(spice1, "R1 1 2 %f\n", R1);
fprintf(spice1, "R2 2 3 %f\n", R2);
fprintf(spice1, "R3 2 5 %f\n", R3);
fprintf(spice1, "R4 0 5 %f\n", R4);
fprintf(spice1, "R5 5 6 %f\n", R5);
fprintf(spice1, "R6 9 7 %f\n", R6);
fprintf(spice1, "R7 7 8 %f\n", R7);

fprintf(spice1, "Vs 1 0 %f\n", Vs);

fprintf(spice1, "V0 0 9 0V\n");
fprintf(spice1, "Hd 5 8 V0 %f\n", Kd);

fprintf(spice1, "Gb 6 3 (2,5) %f\n", Kb);

fclose(spice1);


spice2 = fopen("spice2.cir", "w");

fprintf(spice2, "R1 1 2 %f\n", R1);
fprintf(spice2, "R2 2 3 %f\n", R2);
fprintf(spice2, "R3 2 5 %f\n", R3);
fprintf(spice2, "R4 0 5 %f\n", R4);
fprintf(spice2, "R5 5 6 %f\n", R5);
fprintf(spice2, "R6 9 7 %f\n", R6);
fprintf(spice2, "R7 7 8 %f\n", R7);

fprintf(spice2, "Vs 1 0 0V\n");
fprintf(spice2, "V0 0 9 0V\n");
fprintf(spice2, "Vx 6 8 %f\n", Vx);

fprintf(spice2, "Hd 5 8 V0 %f\n", Kd);
fprintf(spice2, "Gb 6 3 (2,5) %f\n", Kb);

fclose(spice2);



spice3 = fopen("spice3.cir", "w");

fprintf(spice3, "R1 1 2 %f\n", R1);
fprintf(spice3, "R2 2 3 %f\n", R2);
fprintf(spice3, "R3 2 5 %f\n", R3);
fprintf(spice3, "R4 0 5 %f\n", R4);
fprintf(spice3, "R5 5 6 %f\n", R5);
fprintf(spice3, "R6 9 7 %f\n", R6);
fprintf(spice3, "R7 7 8 %f\n", R7);

fprintf(spice3, "Vs 1 0 0V\n");
fprintf(spice3, "V0 0 9 0V\n");

fprintf(spice3, "Hd 5 8 V0 %f\n", Kd);
fprintf(spice3, "Gb 6 3 (2,5) %f\n", Kb);

fprintf(spice3, "C1 6 8 %f\n", C);

#X(5) msm??
fprintf(spice3, ".ic V(6)=%f V(8)=%f\n", X(4), X(5)); 

fclose(spice3);

spice45 = fopen("spice45.cir", "w");

fprintf(spice45, "R1 1 2 %f\n", R1);
fprintf(spice45, "R2 2 3 %f\n", R2);
fprintf(spice45, "R3 2 5 %f\n", R3);
fprintf(spice45, "R4 0 5 %f\n", R4);
fprintf(spice45, "R5 5 6 %f\n", R5);
fprintf(spice45, "R6 9 7 %f\n", R6);
fprintf(spice45, "R7 7 8 %f\n", R7);

fprintf(spice45, "Vs 1 0 0.0 ac 1.0 sin(0 1 1k)\n");
%fprintf(spice45, "Vs 1 0 0.0 ac 1.0 sin(0 1.0 1.0)\n");
fprintf(spice45, "V0 0 9 0V\n");

fprintf(spice45, "Hd 5 8 V0 %f\n", Kd);
fprintf(spice45, "Gb 6 3 (2,5) %f\n", Kb);

fprintf(spice45, "C1 6 8 %f\n", C);

#X(5) msm??
fprintf(spice45, ".ic V(6)=%f V(8)=%f\n", X(4), X(5)); 

fclose(spice45);



