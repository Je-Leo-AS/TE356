function ber = MonteCarlo2ASK(EbN0, numIter, N)
    ber = zeros(size(EbN0));
    for k=1:length(EbN0)
        erro = 0;
        erro_total = zeros(size(N));
        for i=1:numIter
            bits = randi([0 1],1,N);
            symb = 2*bits-1;
            SNR = 10^(EbN0(k)/10);
            sigma_sq = 1/(2*SNR);
            n = sqrt(sigma_sq)*(randn(1,N)+1i*randn(1,N));
            r = symb + n;
            bitsRx = real(r)>0;
            erro = sum(bits~=bitsRx)/N;
            erro_total(i) = erro;
        end
        ber(k) = mean(erro_total);
    end
end
