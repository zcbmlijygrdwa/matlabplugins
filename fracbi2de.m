function sum = fracbi2de(num)


idx = length(num)+1;

for i = 1:length(num)
   if strcmp(num(i),'.')
       idx = i;
       break;
   end
end

sum = 0;
multi = 1;
for i = idx-1:-1:1
     sum = sum+multi*str2num(num(i));
     multi = multi*2;
end

multi = 0.5;
for i = idx+1:length(num)
     sum = sum+multi*str2num(num(i));
     multi = multi*0.5;
end


end



