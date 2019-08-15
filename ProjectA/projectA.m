%This is my soloution to project A prelims computaional mathematics course 2017
%%Exercise 3.1
clear all
syms x y
eq1=x.^4+y.^4==10% first equation
gr1=ezplot(eq1); hold on;
set(gr1,'color','r');
eq2=(x-2).^2+(y-1).^2==3% second equation
gr2=ezplot(eq2); hold off;
legend('equation1','equation2')
%%Exercise 3.3
co=[4;-2];%x,y
for n = 1:10 % iterates the approximation 10 times
    [J,F]=evaluate1(co(1,1),co(2,1));
    co=co-inv(J)*F;% finds the next approximation
end
answer_to_3_3=co
%%Exercise 3.4
co=[1;2];%x,y
for n = 1:10% iterates the approximation 10 times
    [J,F]=evaluate1(co(1,1),co(2,1));
    co=co-inv(J)*F;% finds the next approximation
end
answer_to_3_4=co
%%Exercise 3.6
co=[1;1;1];%x,y,z
for n = 1:50% iterates the approximation 50 times
    [J,F]=evaluate2(co(1,1),co(2,1),co(3,1));
    co=co-inv(J)*F;% finds the next approximation
end
answer_to_3_6=co
inaccuracies=[15*co(1,1)+co(2,1)^2-4*co(3,1)-13;co(2,1)^2+10*co(2,1)-exp(-co(3,1))-11;co(2,1)^3-25*co(3,1)+22]%inaccuracies for each equation
%%GPS system
S1=[1,2,0,40.31];%X,Y,Z,t
S2=[2,0,2,63.59];
S3=[1,1,1,30.92];
S4=[2,1,0,50.33];
sol=[0;0;0;0];%solution [x,y,z,e]
c2=2.214*(10^(-3));%c^2
for n = 1:100% iterates the approximation 100 times
    J=[2*(sol(1)-S1(1)),2*(sol(2)-S1(2)),2*(sol(3)-S1(3)),-2*c2*(sol(4)-S1(4));2*(sol(1)-S2(1)),2*(sol(2)-S2(2)),2*(sol(3)-S2(3)),-2*c2*(sol(4)-S2(4));2*(sol(1)-S3(1)),2*(sol(2)-S3(2)),2*(sol(3)-S3(3)),-2*c2*(sol(4)-S3(4));2*(sol(1)-S4(1)),2*(sol(2)-S4(2)),2*(sol(3)-S4(3)),2*c2*(sol(4)-S4(4))];
    F=[(sol(1)-S1(1))^2+(sol(2)-S1(2))^2+(sol(3)-S1(3))^2-c2*(S1(4)-sol(4))^2;(sol(1)-S2(1))^2+(sol(2)-S2(2))^2+(sol(3)-S2(3))^2-c2*(S2(4)-sol(4))^2;(sol(1)-S3(1))^2+(sol(2)-S3(2))^2+(sol(3)-S3(3))^2-c2*(S3(4)-sol(4))^2;(sol(1)-S4(1))^2+(sol(2)-S4(2))^2+(sol(3)-S4(3))^2-c2*(S4(4)-sol(4))^2];
    sol=sol-inv(J)*F;%finds the next approximation to the solution
end
x=sol(1)
y=sol(2)
z=sol(3)
%%exercise 3.8
AH=sol(1)^2+sol(2)^2+sol(3)^2; %Absolute Height, distance form (0,0,0) to reciever
altitude=(AH-1)*6371008% in meters
latitude=asin(sol(3)/AH)% in radians 
longitude=atan(sol(2)/sol(1))% in radians