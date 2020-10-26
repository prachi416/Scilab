clc;
clear all;
disp("Prachi Patil D14A Roll No.41")
p=input("Enter first prime number  ");
q=input("Enter second prime number  ");
n=p*q
phi=(p-1)*(q-1)
e=input("Enter the value of e  ")
for i= 1:n
    t=modulo((i*e),phi);
    if t==1 then
        break;
    end
end
disp("The public key is");
printf("(%d",e)
printf(",%d)",n)
disp("The private key is")
printf("(%d",i)
printf(",%d)",n)
M=input("Enter the number to be encrypted  ")
a=M^e
b=modulo(a,n);
disp("The encrypted message is ",b);
c=b^i;
r=modulo(c,n);
disp("The decyrpted message is ",r);
