function ser = MonteCarlo8ASK(EbN0, numIter, N)
    ser = zeros(size(EbN0));
    for k=1:length(EbN0)
        erro = 0;
        erro_total = zeros(size(N));
        for i=1:numIter
            bits = randi([0 1],1,N*3);
            bits_reshape = reshape(bits,3,N)';
            symb = 2*bintodec(bits_reshape)-7;
            SNR = 10^(EbN0(k)/10);
            sigma_sq = 1/(3*SNR);
            n = sqrt(sigma_sq)*(randn(N,1)+1i*randn(N,1));
            r = symb + n;
            [~, idx] = min(abs(repmat(r,1,8)-repmat([-7:2:7],N,1)),[],2);
            bitsRx = reshape(dec2binarray(idx-1,3),[],1)';
            bitsRx_reshape = reshape(bitsRx',1,N*3);
            erro = sum(bits~=bitsRx_reshape)/N;
            erro_total(i) = erro;
        end
        ser(k) = mean(erro_total);
    end
end
