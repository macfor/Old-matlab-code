%This is my soloution to project B prelims computaional mathematics course 2017
%% Exercise 4.1 to 4.5
clear all
syms t fun phi sol %defines functions that we will need
a=[3,4,5,6];
theta=[0.5,-1.5,2.3,0.8];
fun(t)=0;% function
for x = 1:4
    fun(t)=fun(t)+a(x)*exp(1i*theta(x)*t);%adds all for exponetals
end
ezplot(abs(fun),[0,12]); hold on; %plots absolute value of fun
ezplot(real(fun),[0,12]); %plots real value of fun
ezplot(imag(fun),[0,12]); hold off %plots imaginary value
legend('absolute','real','imaginary') % labels graph
f=zeros(1,8);
for x = 1:8
    f(x)=fun(x); %making a vector of values of fun on 1:8
end
f %answers exercise 4.3
[a,theta]=pronys(f);%solves a and theta
theta %answers exercise 4.4
a %answers exercise 4.5
%% exercise 4.6
f=[6.3185,-9.4712,-3.1924,-4.7683,4.7884,24.0638,8.4936,-13.0161,-4.6636,0.3716];% imput values of f
[a,theta]=pronys(f)%solves a and theta
fun(t)=0;
for c = 1:length(a)
    fun(t)=fun(t)+a(c)*exp(1i*theta(c)*t); %adds each of the function terms to the function to get a long equation
end
ezplot(fun(t),[-15,15]); hold on;
fun(t) = 3+8*cos(2.017*t)+14*cos(1.066*t)% this is the simplified equation done by hand
s=ezplot(fun(t),[-15,15]);%plots the function on [-15,15]
set(s,'linestyle','--')%sets the second equation to be a dashed line to see the first
scatter([1,2,3,4,5,6,7,8,9,10],f,'x'); hold off;%plots data points
legend('long equation','simplified','data points');
%% exercise 4.7
f=[0.7153,-0.3497,-0.3861,-0.0831];% imput f
[b,exponenti]=pronys(f);%exponenti is the exponent on e divided by i
theta=real(exponenti);%finds both thetas for the exponetal form
sigma=imag(exponenti);%finds both sigmas for the exponetal form
a=2*abs(b(1)) %finds and outputs a
sigma=-sigma(1) %finds and outputs the sigma for the question
theta=theta(1) % finds and outputs theta
sol(t,phi)=a*exp(sigma*t)*cos(theta*t+phi); %soloution
phi=double(solve(sol(1,phi)==f(1),phi)) %finds the values of phi that solve the first point 
phi=phi(1) %finds value of phi we want
ezplot(sol(t,phi),[0,8]);hold on; %plots solution
scatter([1,2,3,4],f,'x');hold off; %plots original points to show accuracate