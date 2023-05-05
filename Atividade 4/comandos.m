figure
EbN0 = [2 5 8 10];
numIter = 100;
N = 10^5;
ber = MonteCarlo2ASK(EbN0, numIter, N);

Curva_teorica_BPSK
hold on
plot(EbN0,ber)

figure
Curva_teorica_8ASK;
EbN0 = [0 5 10 15];
numIter = 10^4;
N = 10^5;
ser8 = MonteCarlo8ASK(EbN0, numIter, N);
ber8 = ser8/log2(8);
ber_bpsk = ser8*log2(8)/log2(2);
hold on
plot(EbN0,ser8);

figure
MonteCarlo16QAM
