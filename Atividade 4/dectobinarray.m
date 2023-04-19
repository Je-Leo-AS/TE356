function bits = dec2binarray(dec, numBits)
    bits = zeros(1,numBits);
    for i = numBits:-1:1
        bits(numBits-i+1) = mod(dec, 2);
        dec = floor(dec/2);
    end
end
