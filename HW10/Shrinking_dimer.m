function xc=Shrinking_dimer()
[energy,trajectory]=String()
x1=trajectory(26,:)
x2=trajectory(27,:)
tor=0.01
steps=10000
h=0.0005
mu1=1
mu2=1
mu3=1


l=norm(x2-x1)
xc=0.5*(x1+x2)
v=(x2-x1)/l


counter=1
while norm(LJgrad(xc))>tor
    
    F1=-LJgrad(xc-l*v/2)
    F2=-LJgrad(xc+l*v/2)
    F=0.5*(F1+F2)
    delta_F=F2-F1
    F=transpose(F)
    delta_F=transpose(delta_F)
    
    xc_=transpose(xc)+h/mu1*(1-2*transpose(v)*v)*F
    w=transpose(v)+h/(mu2*l)*(1-transpose(v)*v)*delta_F
    
    v=transpose(w)/norm(w)
    l=l/(1+h/mu3)
    
    xc=transpose(xc_)
    counter=counter+1
    
    if counter>steps
        break
    end
end
Nor=norm(LJgrad(xc))
showpath(xc,1)

end