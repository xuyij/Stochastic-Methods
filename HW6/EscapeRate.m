function k=EscapeRate()
q=zeros(1,4)
q(1)=1
L=MakeGenerator
[v e]=eig(L')
invariant=-v(:,1)
syms q_3 q_4
eqns=[L(3,3)*q_3+L(3,4)*q_4==-L(3,1), L(4,3)*q_3+L(4,4)*q_4==-L(4,1)]
S=solve(eqns,[q_3 q_4])
q(3)=vpa(S.q_3)
q(4)=vpa(S.q_4)
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