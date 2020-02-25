FileName='Audio1.wav';

[x Fs]=Audio_Read(FileName);

for Nb=1:16
    [xq(:,Nb) SNR(Nb) Err(:,Nb)]=Audio_UniformQ(x,Nb,Fs);
    [xq(:,Nb) SNR_Mu(Nb) Err(:,Nb)]=Audio_MuLawQ(x,Nb,Fs);
    
end

figure
plot([1:16],6*[1:16]+4.77-20*log10(1/std2(x)),'m');
hold on
plot([1:16],SNR,'r')
plot([1:16],SNR_Mu,'b')
grid
axis([1 16 -10 90])
title(FileName)
legend('Theory','Uniform Experimental','Mu-Law Experimental','Location','northwest')