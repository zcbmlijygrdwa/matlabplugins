%RSI

%state.period = ???;
%state.initialized = false;
%https://en.wikipedia.org/wiki/Relative_strength_index

function state = RSI(state,newData)

%initialization check
if(~state.initialized)
    state.initialized = true;
    state.data_pre = newData;
    
    state.isFull = false;
    state.counter = 1;
    
    state.U = 0;
    state.D = 0;
    
    state.SMMA_state_U.period = state.period;
    state.SMMA_state_U.initialized = false;
    state.SMMA_state_D.period = state.period;
    state.SMMA_state_D.initialized = false;
    
    state.RS = 0;
    state.resultRaw = 100-(100)/(1+1);
    state.result =  (2*abs(state.resultRaw -50))/100; %convert to 0 - 1
    return;
end

if(newData - state.data_pre>0)
    state.U = newData - state.data_pre;
    state.D = 0;
else
    state.U = 0;
    state.D = state.data_pre - newData;
end

state.SMMA_state_U = SMMA(state.SMMA_state_U,state.U);
state.SMMA_state_D = SMMA(state.SMMA_state_D,state.D);
%SMMA(state.SMMA_state_D,state.D);

state.RS = state.SMMA_state_U.result/state.SMMA_state_D.result;


state.data_pre = newData;
if(~state.isFull)
    if(state.counter<=state.period*2)
        state.counter = state.counter + 1;
    else
        state.isFull = true;
    end
    state.resultRaw = 100-(100)/(1+1);
else
    
    state.resultRaw = 100-(100)/(1+state.RS);
end

state.result =  (2*abs(state.resultRaw -50))/100; %convert to 0 - 1
end