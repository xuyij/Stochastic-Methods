function F=ReactiveCurrent()
q=zeros(1,4)
q(1)=1
F=zeros(4,4)
L=MakeGenerator
[v e]=eig(L')
invariant=-v(:,1)
syms q_3 q_4
eqns=[L(3,3)*q_3+L(3,4)*q_4==-L(3,1), L(4,3)*q_3+L(4,4)*q_4==-L(4,1)]
S=solve(eqns,[q_3 q_4])
q(3)=vpa(S.q_3)
q(4)=vpa(S.q_4)
q_=1-q
for i=1:4
    for j=1:4
        if i==j
            F(i,j)=0
        else
            F(i,j)=invariant(i)*L(i,j)*(q(j)-q(i))
        end
    end
end
end

