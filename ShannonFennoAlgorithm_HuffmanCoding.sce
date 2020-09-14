clc;
clear all;

for i=1:5
p(i)=input("Enter Probabilities of message  ");
end
for i=1:5
a(i)=input("Enter the codeword lengths for Hauffman code  ");
end
for i=1:5
b(i)=input("Enter the codeword lengths for Shannon-Fano algorithm  ");
end
sum1=0
sum2=0
sum3=0
for(i=1:5)
    H=p(i)*log2(1/p(i));
    sum1=H+sum1;
end
for(i=1:5)
    l1=p(i)*a(i);
    sum2=l1+sum2;
end
for (i=1:5)
    l2=p(i)*b(i);
    sum3=l2+sum3;
end
efficiency1=(sum1*100)/sum2;
efficiency2=(sum1*100)/sum3;
redundancy1=1-(sum1/sum2);
redundancy2=1-(sum1/sum3);
disp("The entropy is",sum1);
disp("The average value of Hauffman code is",sum2);
disp("The percentage efficiency of Hauffman code is",efficiency1);
disp("The redundancy of hauffman code is",redundancy1);
disp("The average value of ShannanFano code is",sum3);
disp("The percentage  efficiency of ShannanFano code is",efficiency2);
disp("The redundancy of ShannanFano code is",redundancy2);
disp("Hauffman coding is more efficient than ShannaFano coding");
disp("Prachi Patil");
disp("D14A 41");

