
%========== Curva teórica ================

SNRdB = [0:0.1:15];
SNR = 10.^(SNRdB./10);

M = 16;
Prob = ((1-1/sqrt(M))*erfc(sqrt(3/(2*(M-1)).*SNR)));

Ps = 1.-(1.-Prob).^2;

function y=quantalph(x,alphabet)
% function  y=quantalph(x,alphabet)
% quantize the input signal x to the alphabet
% using nearest neighbor method
% input x - vector to be quantized
%       alphabet - vector of discrete values that y can take on
%                  sorted in ascending order
% output y - quantized vector
[r c] = size(alphabet); if c>r, alphabet=alphabet'; end
[r c] = size(x); if c>r, x=x'; end
alpha=alphabet(:,ones(size(x)))';
dist=(x(:,ones(size(alphabet)))-alpha).^2;
[v,i]=min(dist,[],2);
y=alphabet(i);
end

%========== Curva simulada ================

EB_N0_dB=[0 5 10 12];

Const_X = [-3 -1 1 3];
Const_Y = [-3 -1 1 3];

Es = mean(Const_X.^2 + Const_Y.^2);
Const_X_norm = Const_X./sqrt(Es);
Const_Y_norm = Const_Y./sqrt(Es);

Const_X_data = randi(4,100000,1);
Const_Y_data = randi(4,100000,1);

erro = 0;

for snr=1:1:4
  EB_N0(snr) = 10^(EB_N0_dB(snr)/10);
  desvioPad = 1/(2*EB_N0(snr));
  variancia = sqrt(desvioPad);

  for i=1:1:100000
    Const_X_qam(i) = Const_X_norm(Const_X_data(i));
    Const_Y_qam(i) = Const_Y_norm(Const_Y_data(i));
    Ruido_X(i) = randn*variancia;
    Ruido_Y(i) = randn*variancia;
    X_rx(i) = Const_X_qam(i)+Ruido_X(i);
    Y_rx(i) = Const_Y_qam(i)+Ruido_Y(i);
  endfor

  X_rx_quant = quantalph(X_rx, Const_X_norm);
  Y_rx_quant = quantalph(Y_rx, Const_Y_norm);

  for k=1:1:100000
    if(Const_X_qam(k) ~= X_rx_quant(k))||(Const_Y_qam(k) ~= Y_rx_quant(k))
      erro = erro+1;
    end
  endfor

  BER(snr) = erro/100000;
  erro = 0;
endfor

figure(1  );
semilogy(SNRdB,Ps);
hold on;
semilogy(EB_N0_dB, BER, 'r*');
title("Desempenho 16-QAM");
xlabel("SNR[dB]");
ylabel("BER");
legend("teórica","simulada");

figure;
scatter(X_rx(:,1:1:1000),Y_rx(1,1:1:1000),'.');
title("Constelação recebida");
