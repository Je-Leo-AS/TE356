Curva_teorica_BPSK

EbN0 = [2 5 8 10];
numIter = 100;
N = 10^5;
ber = MonteCarlo2ASK(EbN0, numIter, N);
hold on
plot(EbN0,ber)
EbN0 = [0 5 10 15];
ber1 = MonteCarlo8ASK(EbN0, numIter, N);
plot(EbN0,ber1)
