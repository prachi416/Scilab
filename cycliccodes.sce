clc;
clear all;

disp('Please enter the value of n');
N=input('');
disp('Please enter the value of k');
K=input('');
//To ask user to enter the coefficients for generator polynomial
disp('Please enter the value for coefficients of generator polynomial')
for i=1:K
 g(i)=input('');
end
//To generate the generator polynomial
g1=poly(g,"x","coeff")
g2=pol2str(g1)
disp('The generator polynomial is');
disp('g(x)=')
disp(g2)
//To ask user to enter the coefficients for message polynomial
disp('Please enter the message vector')
for j=1:K
 m(j)=input('');
end
//To generate message polynomial
m1=poly(m,"x","coeff")
m2=pol2str(m1)
disp('The message polynomial is');
disp('m(x)=')
disp(m2)
//To generate non systematic codeword
u=m1*g1
r1=coeff(u)
u1=modulo(r1,2);
u2=poly(u1,"x","coeff")
u3=pol2str(u2)
disp('The non systematic codeword polynomial is')
disp('U(x)=')
disp(u3);
e1=length(u1)
if (e1 < N) then
 for f=(e1+1):N
 u1(f)=0
 end
end
disp('The coefficients of non systematic codeword polynomial is the required non systematic codeword ');
disp('Hence the non systematic codeword is')
disp('U(non systematic)=');
disp(u1)
//To generate Systematic Codeword
x=poly(0,"x")
y=(x^(N-K))*m1
[r,q]=pdiv(y,g1)
d1=coeff(abs(r));
d2=modulo(d1,2);
d3=poly(d2,"x","coeff");
z=y+d3
z1=pol2str(z);
disp('The systematic codeword polynomial is')
disp('U(x)=')
disp(z1)
d5=coeff(z);
e2=length(d5)
if (e2 < N) then
 for f=(e2+1):N
 d5(f)=0
 end
end
disp('The coefficients of systematic codeword polynomial is the required systematic codeword ');
disp('Hence the systematic codeword is')
disp('U(systematic)=');
disp(d5)
// To generate Systematic Generator matrix
for w=1:K
 z3=x^(N-w);
 [r1,q1]=pdiv(z3,g1)
 d6=coeff(abs(r1))
 d7=modulo(d6,2)
 d8=poly(d7,"x","coeff")
 d9=z3+d8
 d10=coeff(d9)
 e3=length(d10)
 if (e3 < N) then
 for f=(e3+1):N
 d10(f)=0
 end
end
G(w,:)=d10
end
for t1=1:K
 h=N
 for R=1:N
 G1(t1,R)=G(t1,h);
 h=h-1
 end
end
disp('The Systematic generator matrix is');
disp('G=')
disp(G1)
//To generate parity matrix from generator matrix
for i=1:K
 for j=1:(N-K)
 P(i,j)=G(i,j)
end
end
for t2=1:K
 h1=(N-K)
 for R1=1:(N-K)
 P1(t2,R1)=P(t2,h1);
 h1=h1-1
 end
end
//To generate parity check matrix
H=[P1',eye((N-K),(N-K))];
disp("The parity check matrix is");
disp('H=');
disp(H)
//to generate error pattern
e=eye(N,N);
disp('One bit error pattern is');
disp('e=');
disp(e);
//To generate syndrome
m1=e*H'
S=modulo(m1,2)
disp('The Syndrome are');
disp('S=');
disp(S);
//To take from the user received codeword
disp('Please enter received codeword for verificaton weather the received is same as transmitted');
 for t=1:N
 r11(t)=input('')
 end
disp('The received codeword is r1=')
 disp(r11')
disp('Please enter received codeword for verificaton weather the received is same as transmitted');
for t=1:N
 r12(t)=input('')
end
disp('The received codeword is r2=')
 disp(r12')
//To generate syndrome for received codeword
s1=r11'*H'
s2=r12'*H'
s3=modulo(s1,2)
s4=modulo(s2,2)
disp('The syndrome S1 for received codeword r1 i.e (r1*H`) is');
disp(s3);
F=H'
//To check whether received codeword and transmitted are same or not if not same then do the required corrections
for q=1:N
if (s3(1,:)==F(q,:)) then
 a1=q;
 d1=e(q,:);
 code=r11'+d1
 code1=modulo(code,2)
 mprintf('The Syndrome S1 matches with %i row of H`', a1);
 disp('Hence there is an error in received codeword r1');
 disp('The correct codeword that was transmitted');
 disp(code1)
 break;
end
end
if(q==N) then
disp("There is no error in received codeword r1 and it is same as transmitted i.e r1=")
 disp(r11')
end
disp('The syndrome S2 for received codeword r2 i.e (r2*H`) is');
disp(s4);
for w=1:N
if (s4(1,:)==F(w,:)) then
 a2=w;
 x1=e(w,:);
 code2=r12'+x1
 code3=modulo(code2,2)
 mprintf('The Syndrome S1 matches with %i row of H', a2);
 disp('Hence there is an error in received codeword r1');
 disp('The correct codeword that was transmitted');
 disp(code3)
 break;
end
end
if(w==N) then
disp("There is no error in received codeword r2 and it is same as transmitted i.e r2=")
 disp(r12')
end
