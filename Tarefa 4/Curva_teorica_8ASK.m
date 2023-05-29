function Curva_teorica_8ASK()
SNR_dB = -2:0.5:15;
SNR = 10.^(SNR_dB/10);
Pb = 7/8 * erfc(sqrt(3/(8^2-1)*SNR));
semilogy(SNR_dB, Pb);
xlabel('Relação sinal-ruído (Eb/N0) em dB');
ylabel('Probabilidade de erro de símbolo (Pb)');
title('Curva teórica de desempenho da modulação 8ASK');
end
