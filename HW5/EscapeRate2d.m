function k=EscapeRate2d()
q=zeros(1,4)
q(1)=1
L=MakeGenerator
[v e]=eig(L')
invariant=-v(:,1)
syms q2 q3
eqns=[L(2,1)+L(2,2)*q2+L(2,3)*q3==0,L(3,1)+L(3,2)*q2+L(3,3)*q3==0];
S=solve(eqns,[q2 q3])
q(2)=vpa(S.q2)
q(3)=vpa(S.q3)
rho=0
for i=1:4
    rho=rho+invariant(i)*(1-q(i))
end
nu=0
for i=1:4
    for j=1:4
        nu=nu+1/2*invariant(i)*L(i,j)*(q(j)-q(i))^2
    end
end
rho
k=sum(nu)/rho