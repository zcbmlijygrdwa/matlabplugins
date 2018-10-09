function output = bi2r4(num)

if(mod(length(num),2)~=0)
   num = ['0' num]; 
end

output = [];

for i = length(num):-2:1
   temp = [num(i-1) num(i)];
   output = [num2str(fracbi2de(temp)) output];
end

end


