clc;
clear all;
close all;
%generating desired signal i.e D
[D,fs1]=audioread('DSP.m4a');
figure(1);
a=length(D);
plot(D);
title('Desired signal');
xlabel('time');
ylabel('amplitude');
%sound(D,fs1);
%noise signal i.e B
B1= 0.01*randn(a,1);
B2=0.5*randn(a,1);
B3=2*randn(a,1);
figure(2);
plot(B1,"green");
title('Noise');
xlabel('time');
ylabel('amplitude');
%generating signal corrupted with noise i.e A
A= D + B1;
figure(3);
plot(A);
title('Noise corrupted signal');
xlabel('time');
ylabel('amplitude');
%sound(A,fs1);
%initialization of variables
%LMS Filter
M=32; %no of delays =32
wn=zeros(1,M);
E=[];
mu=0.0001; %step size
for i=M:a
    E(i)=D(i)-wn*(A(i:-1:i-M+1));
    wn=wn+ mu*E(i)*A(i:-1:i-M+1)';
end
%final output
Est=zeros(a,1);
for i=M:a
    Est(i)=wn*A(i:-1:i-M+1);
end
%Error signal
Err=D-Est;
% Display of sign
% als
figure(4);
  subplot(2,1,1); 
  plot(D);
  title('Desired signal');
    
   subplot(2,1,2);
   plot(Est);
   title('Final estimated signal ');
  % sound(Est,fs1);
    
figure(5);
    plot(Err);
    title('error signal');


 snr_1=snr(D,D);
 disp(snr_1);



 snr_2=snr(D,A);
 disp(snr_2);

 
 snr_3=snr(D,Est);
 disp(snr_3);


figure(6);
 Sx1= pwelch(D,fs1);
 subplot(3,1,1);
 plot(Sx1);
 title('Desired signal');
 xlabel('frequency');
 ylabel('power');


 Sx2=pwelch(A,fs1);
 subplot(3,1,2);
 plot(Sx2);
 title('Noise corrupted signal');
 xlabel('frequency');
 ylabel('power');



 Sx3=pwelch(Est,fs1);
 subplot(3,1,3);
 plot(Sx3);
 title('Final Estimated signal ');
xlabel('frequency');
 ylabel('power');

