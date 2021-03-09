function [D]=transition_mtx(N,a,b)
P=zeros(N+1,N+1)
for i=0:N
    for I=0:N
      d=I-i
      for k=0:N-i
          for m=0:i
              if k-m==d 
                  P(i+1,I+1)=P(i+1,I+1)+nchoosek(N-i,k)*((a*i/N)^k)*((1-a*i/N)^(N-i-k))*...，
                  nchoosek(i,m)*(b^m)*((1-b)^(i-m))
              end
          end
      end
    end
end
D=P
end