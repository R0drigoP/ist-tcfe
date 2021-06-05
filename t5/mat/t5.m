i=1;
for t1=1:0.1:8;
  

Vi=1;
s=j*2*pi*power(10,t1);
c1=220e-9;
c2=220e-9;
Z1=s*c1;
Z2=s*c2;
R1=1e3;
R2=1e3;
R3=100e3;
R4=0.5e3;

#v- v+ v0 vout
A=[1,-1, 0,0;
0, 1+R3/R2, -1, 0;
0, Z1-1/R1, 0, 0;
0, 0, 1/R4, -1/R4-Z2;
];

B=[0;0;Z1*Vi;0];

X=A\B;

gain(i)=abs(X(4)/Vi);
gain_DB(i)=20*log10(abs(gain(i)));


VoVi(i)=abs( (1/(Z2*R4)+1)*(1+R3/R2)*(1+Z1*R1) );

t(i)=t1;
t2(i)=t1;

i=i+1;


endfor


h4 = figure ();
plot (t, gain_DB, "g1");
legend("Vo/Vi", "location","northeastoutside");

xlabel ("log(f) [Hz]");
ylabel ("Voltage [dB],");

h5 = figure ();
plot (t2, VoVi, "g2");
#legend("Vo/Vi", "location","northeastoutside");

#xlabel ("log(f) [Hz]");
#ylabel ("Voltage [dB],");