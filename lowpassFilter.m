function filteredData = lowpassFilter(data,a)
offset = data(1);
data = data - offset;


% a = 0.1;

% syms s
% h=ilaplace(a/(s+a))


% H = tf([a],[1 a])
% bode(H)





lengthOfInverseLaplaceTransform = 200;
t=(1:lengthOfInverseLaplaceTransform);
timeDomainFilter = a*exp(-a*t);

filteredData  = conv(data,timeDomainFilter);
%    filteredData = filteredData/lengthOfInverseLaplaceTransform;
% filteredData = filteredData*5.7;
filteredData = filteredData(1:end-lengthOfInverseLaplaceTransform+1);
% figure,plot(data);hold on;plot(filteredData)

if(size(filteredData,2)>size(filteredData,1))
   filteredData = filteredData'; 
end

filteredData = filteredData + offset;

end