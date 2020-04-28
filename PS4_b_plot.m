%aj623
%PS4
%PROBLEM 1b

%Define parameters 
I1low=linspace(0,10,11);
I2low=linspace(0,10,11);
I1high=linspace(10,50,41);
I2high=linspace(10,50,41);
I1=[I1low(1:(length(I1low)-1)) I1high];
I2=[I2low(1:(length(I2low)-1)) I2high];
A=zeros(length(I1),length(I2));

%Solve equations at every value of inhibitor
for i=1:length(I1)
    for j=1:length(I2)
fun=PS4_b(I1(i),I2(j));
X0=[0,0,0];
X=fsolve(fun,X0);
A(i,j)=X(1);
    end
end

%Plot
I1log=log10(I1);
I2log=log10(I2);
mesh(A);
colorbar
set(gca,'XScale','log')
set(gca,'YScale','log')
title('[A] w.r.t [I1] and [I2] for KS1 = KS2 = KS3 = KS4 = 5.0 units')
xlabel('[I1] in log10 scale')
ylabel('[I2] in log10 scale')
zlabel('[A]')
