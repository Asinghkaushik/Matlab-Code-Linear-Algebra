clear
clc
N = input("Enter order of Matrix - ")
A = input ("Enter the Matrix A - ")
tf = issymmetric( A )
if tf == 1;
Character_polynomial=charpoly(A);
Eigen_values = roots(Character_polynomial);
Diagonal_Matrix = diag(Eigen_values);
P = zeros(N,N);
for index = 1:N
    temp = Eigen_values(index);
    A_lamb = (A - temp*eye(N));
    A_lamb_reduced = rref(A_lamb);
    l = isequal(A_lamb_reduced, eye(size(A_lamb_reduced, 1)))
    if l==1;
        [P,Z]=eig(A);
        break
    end
    if l==0;
    Eigen_vec_index = [-A_lamb_reduced(1:(N-1),N);1];
    Eigen_vec_index_normed = Eigen_vec_index/norm(Eigen_vec_index);
    P(:,index)=Eigen_vec_index_normed;
   % R(:,index)=Eigen_vec_index;
    end
end
end
if tf==0;
disp ('Enter a Symmetric Matrix')
return
end 
disp('P Matrix is ')
P
disp('Z=P^t A P is ')
Z=transpose(P)*A*P
disp('We can see that Z is our diagonal matrix D=diag(e1,e2,e3....,en)')