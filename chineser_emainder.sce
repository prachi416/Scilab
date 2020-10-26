clc;
clear all;
disp("Prachi Patil D14A Roll No.41")
m1=input("Enter the value of m1  ")
m2=input("Enter the value of m2  ")
m3=input("Enter the value of m3  ")
m4=input("Enter the value of m4  ")

a1=input("Enter the value of a1  ")
a2=input("Enter the value of a2  ")
a3=input("Enter the value of a3  ")
a4=input("Enter the value of a4  ")

M=m1*m2*m3*m4
M1=M/m1;
M2=M/m2;
M3=M/m3;
M4=M/m4;

for i= 1:10
    p=modulo(((M1*i)-1),m1)
    if p==0 then
        M1in=i;
        break;
        end
end

for i= 1:10
    q=modulo(((M2*i)-1),m2)
    if q==0 then
        M2in=i;
        break;
        end
end

for i= 1:10
    r=modulo(((M3*i)-1),m3)
    if r==0 then
        M3in=i;
        break;
        end
end

for i= 1:10
    s=modulo(((M4*i)-1),m4)
    if s==0 then
        M4in=i;
        break;
        end
end

x=modulo(((a1*M1*M1in)+(a2*M2*M2in)+(a3*M3*M3in)+(a4*M4*M4in)),M)
disp("The solution is ",x)
