function dec = bintodec(bits)
    dec = 0;
    for i = 1:length(bits)
        dec = dec + bits(i)*2^(length(bits)-i);
    end
end