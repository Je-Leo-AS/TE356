function ser = MonteCarlo8ASK(EbN0, numIter, N)
    ser = zeros(size(EbN0));
    const = [-7 -5 -3 -1 1 3 5 7];
    Es = mean(const.^2);
    symb = const/sqrt(Es);
    for k=1:length(EbN0)
        erro = 0;
        SNR = 10^(EbN0(k)/10);
        sigma_sq = 1/(2*SNR);
        sigma = sqrt(sigma_sq);
        for i=1:numIter
           ind = randi(8);
           simbolo_constelacao = symb(ind);
           noise = randn * sigma;
           simbolo_noise = simbolo_constelacao + noise;
           [v,simbolo_recebido] = min(abs(const - simbolo_noise));

           if (simbolo_recebido ~= simbolo_constelacao)
             erro = erro + 1;
           endif
        end
        ser(k) = erro/numIter;
    end
end

