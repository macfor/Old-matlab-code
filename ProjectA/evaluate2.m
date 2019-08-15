%%Exercise 3.5
function [j,f]=evaluate2(x,y,z)
j=[15,2*y,-4;0,2*y+10,exp(-z);0,0,3*z^2-25];
f=[15*x+y^2-4*z-13;y^2+10*y-exp(-z)-11;y^3-25*z+22];
end