function ser = MonteCarlo8ASK(EbN0, numIter, N)
    ser = zeros(size(EbN0));
    for k = 1:length(EbN0)
        erro = 0;
        erro_total = zeros(size(N));
        for i = 1:numIter
            bits = randi([0 7],1,N); % gerar 3 bits por símbolo (8-ASK)
            symb = 2*bits - 7; % mapear para símbolos polar 8-ASK
            SNR = 10^(EbN0(k)/10);
            sigma_sq = 1/(3*SNR); % 3 bits por símbolo (8-ASK)
            n = sqrt(sigma_sq)*(randn(1,N)+1i*randn(1,N));
            r = symb + n;
            bitsRx = floor((real(r)+4)/2); % demapear para bits 3 bits por símbolo (8-ASK)
            erro = sum(bits~=bitsRx)/N;
            erro_total(i) = erro;
        end
        ser(k) = mean(erro_total)/3; % dividir por 3 para obter SER
    end
end

