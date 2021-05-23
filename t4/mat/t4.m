%gain stage

VT=25e-3
BFN=178.7
VAFN=69.7
RE1=250
RC1=400
RB1=70000
RB2=10000
VBEON=0.7
VCC=12
RS=100

RB=1/(1/RB1+1/RB2)
VEQ=RB2/(RB1+RB2)*VCC
IB1=(VEQ-VBEON)/(RB+(1+BFN)*RE1)
IC1=BFN*IB1
IE1=(1+BFN)*IB1
VE1=RE1*IE1
VO1=VCC-RC1*IC1
VCE=VO1-VE1


gm1=IC1/VT
rpi1=BFN/gm1
ro1=VAFN/IC1

RSB=RB*RS/(RB+RS)

AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
AVI_DB = 20*log10(abs(AV1))
AV1simple = - RB/(RB+RS) * gm1*RC1/(1+gm1*RE1)
AVIsimple_DB = 20*log10(abs(AV1simple))

RE1=0
AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
AVI_DB = 20*log10(abs(AV1))
AV1simple =  - RSB/RS * gm1*RC1/(1+gm1*RE1)
AVIsimple_DB = 20*log10(abs(AV1simple))

RE1=250
ZI1 = 1/(1/RB+1/(((ro1+RC1+RE1)*(rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)))
ZX = ro1*((RSB+rpi1)*RE1/(RSB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RSB)+1/RE1+gm1*rpi1/(rpi1+RSB)))
ZX = ro1*(   1/RE1+1/(rpi1+RSB)+1/ro1+gm1*rpi1/(rpi1+RSB)  )/(   1/RE1+1/(rpi1+RSB) ) 
ZO1 = 1/(1/ZX+1/RC1)

RE1=0
ZI1 = 1/(1/RB+1/(((ro1+RC1+RE1)*(rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)))
ZO1 = 1/(1/ro1+1/RC1)

%ouput stage
BFP = 227.3
VAFP = 37.2
RE2 = 10
VEBON = 0.7
Rl=8
VI2 = VO1
IE2 = (VCC-VEBON-VI2)/RE2
IC2 = BFP/(BFP+1)*IE2
VO2 = VCC - RE2*IE2

gm2 = IC2/VT
go2 = IC2/VAFP
gpi2 = gm2/BFP
ge2 = 1/RE2

AV2 = gm2/(gm2+gpi2+go2+ge2)
ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(gpi2+go2+ge2)
ZO2 = 1/(gm2+gpi2+go2+ge2)


%total
gB = 1/(1/gpi2+ZO1)
AV = (gB+gm2/gpi2*gB)/(gB+ge2+go2+gm2/gpi2*gB)*AV1
AV_DB = 20*log10(abs(AV))
ZI=ZI1
ZO=1/(go2+gm2/gpi2*gB+ge2+gB)


%frequency response

ro2=1/go2;
rpi2=1/gpi2;
ci=1e-3;
ce=2e-3;
co=3e-3;
RE1=250;
i=1;
vin=1

for t1=0:0.1:8;


w=2*pi*power(10,t1);
ww(i)=t1;
Zci=1./(j*w*ci);
Zce=1./(j*w*ce);
Zco=1./(j*w*co);

Zeq1=1/(1/RE1+1/Zce);
Zeq2=1/(1/RE2+1/(Rl+Zco));

A=[RS+Zci+RB, -RB, 0,0,0,0,0;
-RB, RB+rpi1+Zeq1, -Zeq1, 0,0,0,0;
0, -Zeq1, Zeq1+ro1+RC1, -ro1, -RC1,0,0;
0, rpi1*gm1, 0, 1, 0,0,0;
0,0, -RC1, 0, rpi2+RC1+Zeq2, -Zeq2,0;
0,0,0,0 -Zeq2, Zeq2+ro2, -ro2;
0,0,0,0, rpi2*gm2, 0, 1;
];

B=[vin;0;0;0;0;0;0];

X=A\B;

gain(i)=(X(6)-X(5))*Zeq2/vin;
gain_DB(i)=20*log10(abs(gain(i)));

i=i+1;

endfor

h4 = figure ();
plot (ww, gain_DB, "g1");
legend("Vo/Vi", "location","northeastoutside");

xlabel ("log(f) [Hz]");
ylabel ("Voltage [dB],");

hold off

print (h4, "tensao.eps", "-depsc");

printf("op1_TAB\n")
printf("$Vo_1$ = %.15e\n", VO1)
printf("$AV_1$ = %.15e\n", AV1)
printf("$Zo_1$ = %.15e\n", ZO1)
printf("$ZI_1$ = %.15e\n", ZI1)
printf("op1_END\n")

printf("op2_TAB\n")
printf("$VO_2$ = %.15e\n", VO2)
printf("$AV_2$ = %.15e\n", AV2)
printf("$ZO_2$ = %.15e\n", ZO2)
printf("$ZI_2$ = %.15e\n", ZI2)
printf("op2_END\n")

printf("op3_TAB\n")
printf("$Vo$ = %.15e\n", VO2)
printf("$AV$ = %.15e\n", AV)
printf("$Zo$ = %.15e\n", ZO)
printf("$ZI$ = %.15e\n", ZI)
printf("op3_END\n")