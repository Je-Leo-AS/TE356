Curva_teorica_BPSK
EbN0 = [2 5 8 10];
numIter = 100;
N = 10^5;
ber = MonteCarlo2ASK(EbN0, numIter, N);
hold on
plot(EbN0,ber)

EbN0 = [2 5 8 15];
numIter = 100;
N = 10^5;

ser8 = MonteCarlo8ASK(EbN0, numIter, N);
ber1 = ser8/log2(8)
hold on
plot(EbN0,ber1)

EbN0 = [0 5 10 12];
ser16 = MonteCarlo16QAM(EbN0, numIter, N);
ber2 = ser16/log2(16);
plot(EbN0,ber2);
