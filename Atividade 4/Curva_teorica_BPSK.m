function Curva_teorica_BPSK()
SNR_dB = -2:0.5:15;
SNR = 10.^(SNR_dB/10);
Pb = (1/2)*erfc(sqrt(SNR));

semilogy(SNR_dB, Pb);
xlabel('Relação sinal-ruído (SNR) em dB');
ylabel('Probabilidade de erro de símbolo (Pb)');
title('Curva teórica de desempenho da modulação BPSK');
