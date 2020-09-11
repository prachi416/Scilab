//Huffman coding
//for standard method L1,N1,V1
//for minimum variance method L2,N2,V2 //L1&L2 length of codeword
//N1&N2 efficiency
//V1&V2 Redundancy
clc;
clear all;
for i = 1:5
p(i)= input('Enter Probability');
  
end
wfh = 0; for a = 1:5
wfh = wfh-p(a)*log2(p(a)) end
for b = 1:5
q(b) = input('Enter L1');
end
for c = 1:5
w(c) = input('Enter L2'); end
L1 = p(1)*q(1)+p(2)*q(2)+p(3)*q(3)+p(4)*q(4)+p(5)*q(5); L2 = p(1)*w(1)+p(2)*w(2)+p(3)*w(3)+p(4)*w(4)+p(5)*w(5); N1 = (wfh/L1)*100;
N2 = (wfh/L2)*100;
V1 = 1-(N1/100);
V2 = 1-(N2/100);
disp("H=",wfh);
disp("L1=",L1);
disp("L2=",L2);
disp("N1=",N1);
disp("N2=",N2);
disp("V1=",V1);
disp("V2=",V2);


