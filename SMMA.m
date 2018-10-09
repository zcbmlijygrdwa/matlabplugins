%smooth moving average

%state.period = ???;
%state.initialized = false;
function state = SMMA(state,newData)

%initialization check
if(~state.initialized)
    state.initialized = true;
    state.result = newData;
    return;
end

state.result = ( (state.period-1)*state.result + newData  )/(state.period);
end