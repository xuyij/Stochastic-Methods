function n=Calc_norm(diff_path)
N_path = 51
n=zeros(1,N_path)
for i=1:N_path
    n(i)=norm(diff_path(i))
end
end

