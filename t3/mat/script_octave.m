pkg load symbolic



function y = f (x)
  c=400.e-6;
  n=3;
  A=230./n;
  w=50.0*2*pi;
  R1=1000.;
  R2=219.834;
  Von=0.65;
  y = zeros (1, 1);
  y(1) = R2*((abs(A*sin(w*x))-2.*Von)/R1+A*w*abs(cos(w*x))*c)-A*abs(sin(w*x))+2.*Von+12.;
endfunction

[x, fval, info] = fsolve (@f, 1)


function t = h (x1)
  
  toff=0.0051;
  c=400.e-6;
  w=50.0*2*pi;
  n=3;
  A=230.0/n;
  Von=0.65;
  A2=A*sin(w*toff)-2*Von;
  R1=1000.;
  R2=219.834;
  Req=R1*R2/(R1+R2);
  
  t = zeros (1, 1);
  t(1) = A*abs(sin(w*x1))-2*Von-A2*exp(-(x1-toff)/(Req*c));
  
endfunction

[x1, fval, info] = fsolve (@h, 0.013)



t0=0:0.0002:0.2;
t1=0.0051:0.0001:0.013495;
t2=0.0151:0.0001:0.023495;
t3=0.0251:0.0001:0.033495;
t4=0.0351:0.0001:0.043495;
t5=0.0451:0.0001:0.053495;
t6=0.0551:0.0001:0.063495;
t7=0.0651:0.0001:0.073495;
t8=0.0751:0.0001:0.083495;
t9=0.0851:0.0001:0.093495;
t10=0.0951:0.0001:0.103495;
t11=0.1051:0.0001:0.113495;
t12=0.1151:0.0001:0.123495;
t13=0.1251:0.0001:0.133495;
t14=0.1351:0.0001:0.143495;
t15=0.1451:0.0001:0.153495;
t16=0.1551:0.0001:0.163495;
t17=0.1651:0.0001:0.173495;
t18=0.1751:0.0001:0.183495;
t19=0.1851:0.0001:0.193495;

w=50.0*2*pi;
Von=0.65;
toff=0.0051;
A2=230/3*sin(w*toff)-2*Von;
R1=1000.;
R2=219.834;
Req=R1*R2/(R1+R2);
c=400.e-6;

h4 = figure ();
plot (t0, abs(230/3*sin(w*t0))-2*Von, "g0");
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

legend("V6","Vs(dark)","VC(pink)", "location","northeastoutside");

xlabel ("f[ln(Hz)]");
ylabel ("Magnitude [dB],");

hold off

print (h4, "magnitude.eps", "-depsc");



h = figure ();

ampl=71.99;
rd=27.552;
k=18*rd/(18*rd+R2)

plot (t0, k*(abs(230/3*sin(w*t0))-2*Von-ampl)+11.7, "g0");
hold on;
plot (t1, k*(A2*exp(-(t1-t1(1))/(Req*c))-ampl)+11.7, "g1");
hold on;



print (h, "V2.eps", "-depsc");