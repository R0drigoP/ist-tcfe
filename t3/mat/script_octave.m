pkg load symbolic



function y = f (x)
  c=600.e-6;
  #c=400.e-6;
  n=10;
  A=230./n;
  w=50.0*2*pi;
  R1=10000.;
  #R2=219.834;
  R2=6046.6;
  Von=0.65;
  y = zeros (1, 1);
  y(1) = R2*((abs(A*sin(w*x))-2.*Von)/R1+A*w*abs(cos(w*x))*c)-A*abs(sin(w*x))+2.*Von+12.;
endfunction

[x, fval, info] = fsolve (@f, 1)


function t = h (x1)
  
  toff=0.0050;
   c=600.e-6;
  #c=400.e-6;
  w=50.0*2*pi;
  n=10;
  A=230.0/n;
  Von=0.65;
  A2=A*sin(w*toff)-2*Von;
  R1=10000.;
  #R2=219.834;
  R2=6046.6;
  Req=R1*R2/(R1+R2);
  
  t = zeros (1, 1);
  t(1) = A*abs(sin(w*x1))-2*Von-A2*exp(-(x1-toff)/(Req*c));
  
endfunction

[x1, fval, info] = fsolve (@h, 0.013)



t=0:0.0002:0.2;
t0=0:0.0001:0.004714;
t1=0.0050:0.0001:0.014714;
t2=0.0150:0.0001:0.024714;
t3=0.0250:0.0001:0.034714;
t4=0.0350:0.0001:0.044714;
t5=0.0450:0.0001:0.054714;
t6=0.0550:0.0001:0.064714;
t7=0.0650:0.0001:0.074714;
t8=0.0750:0.0001:0.084714;
t9=0.0850:0.0001:0.094714;
t10=0.0950:0.0001:0.104714;
t11=0.1050:0.0001:0.114714;
t12=0.1150:0.0001:0.124714;
t13=0.1250:0.0001:0.134714;
t14=0.1350:0.0001:0.144714;
t15=0.1450:0.0001:0.154714;
t16=0.1550:0.0001:0.164714;
t17=0.1650:0.0001:0.174714;
t18=0.1750:0.0001:0.184714;
t19=0.1850:0.0001:0.194714;
t20=0.1950:0.0001:0.2;

tt0=0.004714:0.0001:0.0050;
tt1=0.014714:0.0001:0.0150;
tt2=0.024714:0.0001:0.0250;
tt3=0.034714:0.0001:0.0350;
tt4=0.044714:0.0001:0.0450;
tt5=0.054714:0.0001:0.0550;
tt6=0.064714:0.0001:0.0650;
tt7=0.074714:0.0001:0.0750;
tt8=0.084714:0.0001:0.0850;
tt9=0.094714:0.0001:0.0950;
tt10=0.104714:0.0001:0.1050;
tt11=0.114714:0.0001:0.1150;
tt12=0.124714:0.0001:0.1250;
tt13=0.134714:0.0001:0.1350;
tt14=0.144714:0.0001:0.1450;
tt15=0.154714:0.0001:0.1550;
tt16=0.164714:0.0001:0.1650;
tt17=0.174714:0.0001:0.1750;
tt18=0.184714:0.0001:0.1850;
tt19=0.194714:0.0001:0.1950;

w=50.0*2*pi;
Von=0.65;
toff=0.0050;
A2=230/3*sin(w*toff)-2*Von;
R1=10000.;
R2=6046.6;
Req=R1*R2/(R1+R2);
c=600.e-6;

ampl=71.99;
rd=27.552;
#rd=12.7727;
k=18*rd/(18*rd+R2)

h4 = figure ();
#plot (t, abs(230/3*sin(w*t))-2*Von, "g0");
hold on;
plot (t0, A2*exp(-(t0+0.0049)/(Req*c)), "g1");
hold on;

plot (t0, k*(A2*exp(-(t0+0.0049)/(Req*c))-ampl)+11.7, "g5");
hold on;

plot (t1, A2*exp(-(t1-t1(1))/(Req*c)), "g1");
hold on;
plot (t2, A2*exp(-(t2-t2(1))/(Req*c)), "g1");
hold on;
plot (t3, A2*exp(-(t3-t3(1))/(Req*c)), "g1");
hold on;
plot (t4, A2*exp(-(t4-t4(1))/(Req*c)), "g1");
hold on;
plot (t5, A2*exp(-(t5-t5(1))/(Req*c)), "g1");
hold on;
plot (t6, A2*exp(-(t6-t6(1))/(Req*c)), "g1");
hold on;
plot (t7, A2*exp(-(t7-t7(1))/(Req*c)), "g1");
hold on;
plot (t8, A2*exp(-(t8-t8(1))/(Req*c)), "g1");
hold on;
plot (t9, A2*exp(-(t9-t9(1))/(Req*c)), "g1");
hold on;
plot (t10, A2*exp(-(t10-t10(1))/(Req*c)), "g1");
hold on;
plot (t11, A2*exp(-(t11-t11(1))/(Req*c)), "g1");
hold on;
plot (t12, A2*exp(-(t12-t12(1))/(Req*c)), "g1");
hold on;
plot (t13, A2*exp(-(t13-t13(1))/(Req*c)), "g1");
hold on;
plot (t14, A2*exp(-(t14-t14(1))/(Req*c)), "g1");
hold on;
plot (t15, A2*exp(-(t15-t15(1))/(Req*c)), "g1");
hold on;
plot (t16, A2*exp(-(t16-t16(1))/(Req*c)), "g1");
hold on;
plot (t17, A2*exp(-(t17-t17(1))/(Req*c)), "g1");
hold on;
plot (t18, A2*exp(-(t18-t18(1))/(Req*c)), "g1");
hold on;
plot (t19, A2*exp(-(t19-t19(1))/(Req*c)), "g1");
hold on;
plot (t20, A2*exp(-(t20-t20(1))/(Req*c)), "g1");

plot (tt0, abs(230/3*sin(w*tt0))-2*Von, "g1");
hold on;
plot (tt1, abs(230/3*sin(w*tt1))-2*Von, "g1");
hold on;
plot (tt2, abs(230/3*sin(w*tt2))-2*Von, "g1");
hold on;
plot (tt3, abs(230/3*sin(w*tt3))-2*Von, "g1");
hold on;
plot (tt4, abs(230/3*sin(w*tt4))-2*Von, "g1");
hold on;
plot (tt5, abs(230/3*sin(w*tt5))-2*Von, "g1");
hold on;
plot (tt6, abs(230/3*sin(w*tt6))-2*Von, "g1");
hold on;
plot (tt7, abs(230/3*sin(w*tt7))-2*Von, "g1");
hold on;
plot (tt8, abs(230/3*sin(w*tt8))-2*Von, "g1");
hold on;
plot (tt9, abs(230/3*sin(w*tt9))-2*Von, "g1");
hold on;
plot (tt10, abs(230/3*sin(w*tt10))-2*Von, "g1");
hold on;
plot (tt11, abs(230/3*sin(w*tt11))-2*Von, "g1");
hold on;
plot (tt12, abs(230/3*sin(w*tt12))-2*Von, "g1");
hold on;
plot (tt13, abs(230/3*sin(w*tt13))-2*Von, "g1");
hold on;
plot (tt14, abs(230/3*sin(w*tt14))-2*Von, "g1");
hold on;
plot (tt15, abs(230/3*sin(w*tt15))-2*Von, "g1");
hold on;
plot (tt16, abs(230/3*sin(w*tt16))-2*Von, "g1");
hold on;
plot (tt17, abs(230/3*sin(w*tt17))-2*Von, "g1");
hold on;
plot (tt18, abs(230/3*sin(w*tt18))-2*Von, "g1");
hold on;
plot (tt19, abs(230/3*sin(w*tt19))-2*Von, "g1");
hold on;


#plot (t, k*(abs(230/3*sin(w*t))-2*Von-ampl)+11.7, "g0");~
#hold on;

plot (t1, k*(A2*exp(-(t1-t1(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t2, k*(A2*exp(-(t2-t2(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t3, k*(A2*exp(-(t3-t3(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t4, k*(A2*exp(-(t4-t4(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t5, k*(A2*exp(-(t5-t5(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t6, k*(A2*exp(-(t6-t6(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t7, k*(A2*exp(-(t7-t7(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t8, k*(A2*exp(-(t8-t8(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t9, k*(A2*exp(-(t9-t9(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t10, k*(A2*exp(-(t10-t10(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t11, k*(A2*exp(-(t11-t11(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t12, k*(A2*exp(-(t12-t12(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t13, k*(A2*exp(-(t13-t13(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t14, k*(A2*exp(-(t14-t14(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t15, k*(A2*exp(-(t15-t15(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t16, k*(A2*exp(-(t16-t16(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t17, k*(A2*exp(-(t17-t17(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t18, k*(A2*exp(-(t18-t18(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t19, k*(A2*exp(-(t19-t19(1))/(Req*c))-ampl)+11.7, "g5");
hold on;
plot (t20, k*(A2*exp(-(t20-t20(1))/(Req*c))-ampl)+11.7, "g5");

plot (tt0, k*(abs(230/3*sin(w*tt0))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt1, k*(abs(230/3*sin(w*tt1))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt2, k*(abs(230/3*sin(w*tt2))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt3, k*(abs(230/3*sin(w*tt3))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt4, k*(abs(230/3*sin(w*tt4))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt5, k*(abs(230/3*sin(w*tt5))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt6, k*(abs(230/3*sin(w*tt6))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt7, k*(abs(230/3*sin(w*tt7))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt8, k*(abs(230/3*sin(w*tt8))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt9, k*(abs(230/3*sin(w*tt9))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt10, k*(abs(230/3*sin(w*tt10))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt11, k*(abs(230/3*sin(w*tt11))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt12, k*(abs(230/3*sin(w*tt12))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt13, k*(abs(230/3*sin(w*tt13))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt14, k*(abs(230/3*sin(w*tt14))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt15, k*(abs(230/3*sin(w*tt15))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt16, k*(abs(230/3*sin(w*tt16))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt17, k*(abs(230/3*sin(w*tt17))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt18, k*(abs(230/3*sin(w*tt18))-2*Von-ampl)+11.7, "g5");
hold on;
plot (tt19, k*(abs(230/3*sin(w*tt19))-2*Von-ampl)+11.7, "g5");
hold on;

legend("Envelope","Regulator", "location","northeastoutside");

xlabel ("t[s]");
ylabel ("Voltage [V],");

hold off

print (h4, "tensao.eps", "-depsc");







h = figure ();

plot (t0, k*(A2*exp(-(t0+0.0049)/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t1, k*(A2*exp(-(t1-t1(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t2, k*(A2*exp(-(t2-t2(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t3, k*(A2*exp(-(t3-t3(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t4, k*(A2*exp(-(t4-t4(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t5, k*(A2*exp(-(t5-t5(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t6, k*(A2*exp(-(t6-t6(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t7, k*(A2*exp(-(t7-t7(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t8, k*(A2*exp(-(t8-t8(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t9, k*(A2*exp(-(t9-t9(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t10, k*(A2*exp(-(t10-t10(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t11, k*(A2*exp(-(t11-t11(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t12, k*(A2*exp(-(t12-t12(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t13, k*(A2*exp(-(t13-t13(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t14, k*(A2*exp(-(t14-t14(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t15, k*(A2*exp(-(t15-t15(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t16, k*(A2*exp(-(t16-t16(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t17, k*(A2*exp(-(t17-t17(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t18, k*(A2*exp(-(t18-t18(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t19, k*(A2*exp(-(t19-t19(1))/(Req*c))-ampl)+11.7-12, "g5");
hold on;
plot (t20, k*(A2*exp(-(t20-t20(1))/(Req*c))-ampl)+11.7-12, "g5");

plot (tt0, k*(abs(230/3*sin(w*tt0))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt1, k*(abs(230/3*sin(w*tt1))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt2, k*(abs(230/3*sin(w*tt2))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt3, k*(abs(230/3*sin(w*tt3))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt4, k*(abs(230/3*sin(w*tt4))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt5, k*(abs(230/3*sin(w*tt5))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt6, k*(abs(230/3*sin(w*tt6))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt7, k*(abs(230/3*sin(w*tt7))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt8, k*(abs(230/3*sin(w*tt8))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt9, k*(abs(230/3*sin(w*tt9))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt10, k*(abs(230/3*sin(w*tt10))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt11, k*(abs(230/3*sin(w*tt11))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt12, k*(abs(230/3*sin(w*tt12))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt13, k*(abs(230/3*sin(w*tt13))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt14, k*(abs(230/3*sin(w*tt14))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt15, k*(abs(230/3*sin(w*tt15))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt16, k*(abs(230/3*sin(w*tt16))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt17, k*(abs(230/3*sin(w*tt17))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt18, k*(abs(230/3*sin(w*tt18))-2*Von-ampl)+11.7-12, "g5");
hold on;
plot (tt19, k*(abs(230/3*sin(w*tt19))-2*Von-ampl)+11.7-12, "g5");
hold on;


legend("Deviation", "location","northeastoutside");

xlabel ("t[s]");
ylabel ("Voltage [V]");

hold off

print (h, "oscilaçao.eps", "-depsc");