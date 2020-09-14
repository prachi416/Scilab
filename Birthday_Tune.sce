clc
clear all
freq=[262,262,294,262,349,330,262,262,294,262,392,349,262,262,523,440,349,330,294,466,466,440,349,392,349]
fs=1046
no=8
n=1:500
temp=[]
for i =1:no
    y=sin(2*%pi*(freq(i)/fs)*n)
    temp=[temp y]
end
sound(temp,fs)
