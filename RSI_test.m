clear all;
close all;


RSI0_out = [];
RSI1_out = [];
RSI3_out = [];
dataHis = [];
RSI0_state.period = 10;
RSI0_state.initialized = false;

RSI1_state(1) = 0; %RSI1_state.initialized = false;
RSI1_state(2) = 10; %RSI1_state.period = 200;

dataHis = ones(5000,1)*286;

newData = 0;
for i =1:5000
    
    newData = 300;
    
    dataHis = [dataHis;newData];
end

tic
for i =1:10000
    RSI0_state = RSI(RSI0_state,dataHis(i));
    RSI0_out = [RSI0_out;RSI0_state.resultRaw];
    
    
    
end
toc

tic
for i =1:10000
    RSI1_state = RSI_fast(RSI1_state,dataHis(i));
    RSI1_out = [RSI1_out;RSI1_state(11)];
end
toc

tic
RSI3_out = calc_RSI(dataHis,RSI1_state(2));
RSI3_out = RSI3_out';
toc

subplot(4,1,1)
plot(dataHis,'k');
subplot(4,1,2)
plot(RSI0_out);
subplot(4,1,3)
plot(RSI1_out);
subplot(4,1,4)
plot(RSI3_out);

sum(abs(RSI0_out(11:end)-RSI3_out))

