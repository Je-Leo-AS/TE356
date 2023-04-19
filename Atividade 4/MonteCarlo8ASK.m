function ser = MonteCarlo8ASK(EbN0, numIter, N)
    ser = zeros(size(EbN0));
    symb = [1 1 1;            1 1 -1;            1 -1 1;            1 -1 -1;           -1 1 1;           -1 1 -1;           -1 -1 1;           -1 -1 -1];
    for k=1:length(EbN0)
        erro = 0;
        erro_total = zeros(size(N));
        for i=1:numIter
            bits = randi([0 1],1,3*N);
            bits_reshape = reshape(bits, 3, [])';
            deci = bi2de(bits_reshape);
            symb_tx = symb(deci+1,:);
            symb = symb./sqrt(3); % normalização para que os símbolos tenham energia 1
            SNR = 10^(EbN0(k)/10);
            sigma_sq = 1/(3*SNR);
            n = sqrt(sigma_sq)*(randn(N,3)+1i*randn(N,3));
            r = symb_tx + n;
            [~, deci_rx] = min(abs(r - repmat(symb_tx, 1, 1, N)), [], 2);
            bitsRx = de2bi(deci_rx-1);
            bitsRx_reshape = reshape(bitsRx', 1, [])';
            erro = sum(bits~=bitsRx_reshape)/(3*N);
            erro_total(i) = erro;
        end
        ser(k) = mean(erro_total);
    end
end

