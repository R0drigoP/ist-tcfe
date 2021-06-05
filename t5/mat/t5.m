i=1;
for t1=1:0.1:8;
  

Vi=1;
s=j*2*pi*power(10,t1);
c1=220e-9;
c2=220e-9;
Z1=1/(s*c1);
Z2=1/(s*c2);
R1=1e3;
R2=(10e3)/3;
R3=300e3;
R4=0.5e3;

#v- v+ v0 vout
#A=[1,-1, 0,0;
#0, 1+R3/R2, -1, 0;
#0, 1/Z1+1/R1, 0, 0;
#0, 0, 1/R4, -1/R4-1/Z2;
#];

#B=[0;0;1/Z1*Vi;0];

#X=A\B;

#gain(i)=abs(X(4)/Vi);
#gain_DB(i)=20*log10(abs(gain(i)));

z=(1/Z1*(1+R3/R2)/(1/Z1+1/R1))/(1+R4*1/Z2);
arg_VoVi(i)=arg( z );
VoVi(i)=20*log10(abs( z ));

t(i)=t1;
t2(i)=t1;

i=i+1;


endfor

FL=1/(2*pi*R1*c1);
FH=1/(2*pi*R4*c2);
FC=sqrt(FL*FH);

s=j*2*pi*FC;
Z1=1/(s*c1);
Z2=1/(s*c2);
g_fc=abs( (1/Z1*(1+R3/R2)/(1/Z1-1/R1))/(1+R4*1/Z2) )
Zo=abs(1/(1/Z2+1/R4))
Zi=abs(Z1+R1)

h4 = figure ();
plot (t, arg_VoVi, "g2");
legend("arg(Vo/Vi)", "location","northeastoutside");

xlabel ("log(f) [Hz]");
ylabel ("Voltage [dB],");

h5 = figure ();
plot (t2, VoVi, "g1");
legend("|Vo/Vi|", "location","northeastoutside");

xlabel ("log(f) [Hz]");
ylabel ("Voltage [dB],");

print (h4, "phase.eps", "-depsc");
print (h5, "gain.eps", "-depsc");

printf("op1_TAB\n")
printf("$Lf$ = %.15e\n", FL)
printf("$Uf$ = %.15e\n", FH)
printf("$Cf$ = %.15e\n", FC)
printf("$Gain$ = %.15e\n", g_fc)
printf("$Z_{out}$ = %.15e\n", Zo)
printf("$Z_i$ = %.15e\n", Zi)
printf("op1_END\n")
