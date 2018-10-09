%smooth moving average - fast

%state(1) = 0;   %state.initialized = false;
%state(2) = ???; %state.period = ???;

function state = SMMA_fast(state,newData)

%initialization check
if(state(1)==0)%if(~state.initialized)
    state(1) = 1;%state.initialized = true;
    state(3) = newData; %state.result = newData;
    return;
end

state(3) = ((state(2)-1)*state(3) + newData  )/(state(2)); %state.result = ( (state.period-1)*state.result + newData  )/(state.period);
end