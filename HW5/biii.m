function Fk=biii()
L=MakeGenerator
[V D W]=eig(-L)
invariant=W(:,1)

phi=zeros(4,3)
lambda=zeros(1,3)
Fk=zeros(4,3)
for i=2:4
    phi(:,i-1)=V(:,i)
    lambda(1,i-1)=D(i,i)
end
for i=1:4
    for k=1:3
        Fk(i,k)=invariant(i)*phi(i,k)
    end
end
end

