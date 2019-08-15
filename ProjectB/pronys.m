function [a,theta]=pronys(f)
k=length(f)/2;
h=hankel(f(1:k),f(k:2*k-1));% gets the hankel matrix
g=transpose(f(k+1:2*k)); % finds g
l=h\g; %solves lambda
r=roots([-1 , fliplr(transpose(l))]);% finds the roots of -z^k+l(k)*z^(k-1)...+l(1)=0
theta=log(r)*(-1i); % finding theta in a strange way to include sigma for exercise 4.7
m=zeros(k);
for a = 1:k
    for b = 1:k
        m(a,b)=exp(1i*theta(a)*b); %calculates the matrix m
    end
end
a=f(1:k)*inv(m); %finds all values of a