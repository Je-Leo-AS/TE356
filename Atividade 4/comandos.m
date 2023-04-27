figure
Curva_teorica_BPSK
EbN0 = [2 5 8 10];
numIter = 100;
N = 10^5;
ber = MonteCarlo2ASK(EbN0, numIter, N);
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
Curva_teorica_16QAM;
EbN0 = [0 5 10 12];
ser16 = MonteCarlo16QAM(EbN0, numIter, N);
plot(EbN0,ser16);
