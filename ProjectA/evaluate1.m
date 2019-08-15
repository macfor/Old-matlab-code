%%Exercise 3.2
function [j,f]=evaluate1(x,y)
j=[4*x^3,4*y^3;2*(x-2),2*(y-1)];
f=[x^4+y^4-10;(x-2)^2+(y-1)^2-3];
end