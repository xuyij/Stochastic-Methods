function [energy,traj,n_max]=String()

global rstar N
rstar = 2^(1/6); % the minimizer of LJpair(r) = r^{-12} - r^{-6}
N = 6; % the number of atoms
h=0.001
N_path = 51
n=zeros(1,51)
tor=1e-6

[x0,x1,traj]=LJ6in2Dsetup()
dV=LJgrad(traj)
new_traj=traj-h*dV
new_traj=reparametrization(new_traj)
diff_vec=new_traj-traj
traj=new_traj
n=Calc_norm(diff_vec)
n_max=max(n)

counter=1
while n_max>tor
    dV=LJgrad(new_traj)
    new_traj=traj-h*dV
    new_traj=reparametrization(new_traj)
    diff_vec=new_traj-traj
    traj=new_traj
    n=Calc_norm(diff_vec)
    n_max=max(n)
    counter=counter+1
    if counter>5000
        break
    end
    
end
energy=LJ(traj)
disp(counter)
end






    
