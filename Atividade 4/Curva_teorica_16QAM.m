function Curva_teorica_16QAM()
SNR_dB = -2:0.5:15;
SNR = 10.^(SNR_dB/10);
p = (1- 1/4)*erfc(sqrt(3/30*SNR));
Ps = 1 - (1 - p).^2;
semilogy(SNR_dB, Ps);
xlabel('Relação sinal-ruído (Eb/N0) em dB');
ylabel('Probabilidade de erro de símbolo (Pb)');
title('Curva teórica de desempenho da modulação 8ASK');
end
