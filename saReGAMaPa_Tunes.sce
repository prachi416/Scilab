clc
clear all
freq=[240,254,302,320,358.5,380,451,470]
fs=8000
no=8
n=1:4000
temp=[]
for i =1:no
    y=sin(2*%pi*(freq(i)/fs)*n)
    temp=[temp y]
end
sound(temp,fs)
