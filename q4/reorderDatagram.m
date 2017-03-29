function [ output ] = reorderDatagram(a, b, c, d, e)

files = [a; b; c; d; e];

l = 4; % overlapping time in seconds

for i = 1:5
    [y,fs] = audioread(files(i,:));
    y = y(:,1:1);
    g = gausswin(20);
    g = g/sum(g); 
    denoise = conv(y(:,1), g, 'same'); 
    result=sgolayfilt(denoise,1,17);
    audiowrite(strcat(num2str(i), '_denoise.wav'),result,fs);
end

minV = Inf(1);
start = -1;
for i = 1:5
    maxV = 0;
    [ap,Fs] = audioread(strcat(num2str(i), '_denoise.wav'));
    ap = ap(1:Fs*l,1);
    fp = abs(fft(ap));
    for j = 1:5
        [as,Fs] = audioread(strcat(num2str(j), '_denoise.wav'));
        as = as(end - Fs*l + 1:end,1);
        fs = abs(fft(as));
        val = corr2(fs,fp);
        if val > maxV
            maxV = val;
        end
    end
    if maxV < minV
        minV = maxV;
        start = i;
    end
end

check = zeros(1,5);
order = zeros(1,5);
order(1) = start;

for c = 1:5
    check(start) = 1;
    [as,Fs] = audioread(strcat(num2str(start), '_denoise.wav'));
    as = as(end - Fs*l + 1:end,1);
    fs = abs(fft(as));
    max = 0;
    for i = 1:5
        if check(i)~=1
            [ap,Fs] = audioread(strcat(num2str(i), '_denoise.wav'));
            ap = ap(1:Fs*l,1);
            fp = abs(fft(ap));
            val = corr2(fs,fp);
            if val > max
                max = val;
                next = i;
            end
        end
    end
    start = next;
    order(c+1) = start ;
end

order = order(1:5);
disp(order);
final = zeros(0,2);

for i = 1:4
    [a, Fs] = audioread(files(order(i), :));
    final = [final; a(1:end-Fs*l,:)];
end

[a, Fs] = audioread(files(order(5), :));
final = [final; a];
f1 = final(:,1);
f2 = final(:,2);
denoise = conv(f1, g, 'same'); 
result1 = sgolayfilt(denoise,1,17);

denoise = conv(f2, g, 'same'); 
result2 = sgolayfilt(denoise,1,17);

output = [result1 result2];

sound(output, Fs);

for i = 1:5
    delete(strcat(num2str(i), '_denoise.wav'));
end
    
end