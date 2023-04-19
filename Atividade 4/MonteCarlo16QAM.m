function ser = MonteCarlo16QAM(EbN0, numIter, N)
    ser = zeros(size(EbN0));
    for k = 1:length(EbN0)
        erro = 0;
        erro_total = zeros(size(N));
        for i = 1:numIter
            bits = randi([0 1],1,4*N); % gerar 4 bits por símbolo (16-QAM)
            inphase = 2*bits(1:2:end)-1;
            quadrature = 2*bits(2:2:end)-1;
            symb = inphase+1i*quadrature;
            SNR = 10^(EbN0(k)/10);
            sigma_sq = 1/(2*SNR);
            n = sqrt(sigma_sq)*(randn(1,N)+1i*randn(1,N));
            r = symb + n;
            inphaseRx = real(r);
            quadratureRx = imag(r);
            bitsRx = zeros(1,4*N);
            bitsRx(1:2:end) = inphaseRx > 0;
            bitsRx(2:2:end) = quadratureRx > 0;
            erro = sum(bits~=bitsRx)/length(bits);
            erro_total(i) = erro;
        end
        ser(k) = mean(erro_total)/4; % dividir por 4 para obter SER
    end
end

