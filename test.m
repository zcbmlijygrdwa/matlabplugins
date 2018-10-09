clear all;
close all;


RSI0_out = [];
RSI1_out = [];
dataHis = [];
RSI0_state.period = 10;
RSI0_state.initialized = false;

RSI1_state(1) = 0; %RSI1_state.initialized = false;
RSI1_state(2) = 10; %RSI1_state.period = 200;

newData = 0;
for i =1:10000
    
    newData = rand();
    
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
    RSI1_state = RSI_matrix(RSI1_state,dataHis(i));
    RSI1_out = [RSI1_out;RSI1_state(11)];
end
toc


subplot(3,1,1)
plot(dataHis,'k');
subplot(3,1,2)
plot(RSI0_out);
plot(RSI1_out);

sum(abs(RSI0_out-RSI1_out))

