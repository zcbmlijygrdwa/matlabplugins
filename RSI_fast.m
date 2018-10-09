%RSI

%state(1) = 0; %state.initialized = false;
%state(2) = ??? %state.period = ???;

%https://en.wikipedia.org/wiki/Relative_strength_index

function state = RSI_fast(state,newData)

%initialization check
if(state(1)~=1) %if(~state.initialized)
    state(1) = 1; %state.initialized = true;
    state(3) = newData; %state.data_pre = newData;
    
    state(4) = 0; %state.isFull = false;
    state(5) = 1; %state.counter = 1;
    
    state(6) = 0; %state.U = 0;
    state(7) = 0; %state.D = 0;
    
    state(8) = 0; %state.SMMA_state_U_initialized = false;
    state(9) = 0; %state.SMMA_state_D_initialized = false;
    
    state(10) = 0; %state.RS = 0;
    state(11) = 100-(100)/(1+1); %state.resultRaw = 100-(100)/(1+1);
    state(12) = (2*abs(state(11) -50))/100; %state.result =  (2*abs(state.resultRaw -50))/100; %convert to 0 - 1
    
    return;
end
priod = state(2);
if(newData - state(3)>0) %if(newData - state.data_pre>0)
    state(6) = newData - state(3); %state.U = newData - state.data_pre;
    state(7) = 0; %state.D = 0;
else
    state(6) = 0; %state.U = 0;
    state(7) = state(3) - newData; %state.D = state.data_pre - newData;
end

%initialization check
if(state(8)~=1) %if(~state.SMMA_state_U_initialized)
    state(8) = 1; %state.SMMA_state_U_initialized = true;
    state(13) = state(6); %state.SMMA_state_U_result = state.U;
else
    state(13) = ( (priod-1)*state(13) + state(6)  )/(priod); %state.SMMA_state_U_result = ( (priod-1)*state.SMMA_state_U_result + state.U  )/(priod);

end



%initialization check
if(state(9)~=1) %if(~state.SMMA_state_D_initialized)
    state(9) = 1; %state.SMMA_state_D_initialized = true;
    state(14) = state(7); %state.SMMA_state_D_result = state.D;

else
    state(14) = ( (priod-1)*state(14) + state(7)  )/(priod); %state.SMMA_state_D_result = ( (priod-1)*state.SMMA_state_D_result + state.D  )/(priod);

end





state(10) = state(13)/state(14); %state.RS = state.SMMA_state_U_result/state.SMMA_state_D_result;


state(3) = newData; %state.data_pre = newData;

if(state(4)~=1) %if(~state.isFull)
    if(state(5)<=priod*2) %if(state.counter<=priod*2)
        state(5) = state(5)+1; %state.counter = state.counter + 1;
    else
        state(4) = 1; %state.isFull = true;
    end
    state(11) = 100-(100)/(1+1); %state.resultRaw = 100-(100)/(1+1);
else
    
    state(11) =100-(100)/(1+state(10)); %state.resultRaw = 100-(100)/(1+state.RS);
end

state(12) =(2*abs(state(11) -50))/100; %state.result =  (2*abs(state.resultRaw -50))/100; %convert to 0 - 1
end
