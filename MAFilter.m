%moving average

%state.period = ???;
%state.initialized = false;
function state = MAFilter( state,newData )

%initialization check
if(~state.initialized)
    state.initialized = true;
    
    state.maBuffer = [];
    state.MASum = 0;
    state.MACounter = 1;
    state.maIsFull = false;
    state.result = 0;
end

if(state.MACounter<=state.period)
    if(state.maIsFull)
        state.MASum = state.MASum - state.maBuffer(state.MACounter);
    end
    
    state.maBuffer(state.MACounter) = newData;
    state.MACounter = state.MACounter + 1;
    state.MASum = state.MASum + newData;
else
    
    if(~state.maIsFull)
        state.maIsFull = true;
    end
    
    state.MACounter = 1;
    state.MASum = state.MASum - state.maBuffer(state.MACounter);
    state.maBuffer(state.MACounter) = newData;
    state.MACounter = state.MACounter + 1;
    state.MASum = state.MASum + newData;
end
if(~state.maIsFull)
    state.result = state.MASum/(state.MACounter-1);
else
    state.result = state.MASum/state.period;
end




end

