function [f0,ft]=metastable(N,a,b,n)
P=transition_mtx(N,a,b)
raw=ones(41)
raw(1,1)=0
f0=raw(1,:)/40
ft=f0*P^n

end
