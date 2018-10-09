%PID controller

%state.p = ???;
%state.i = ???;
%state.d = ???;
%state.target = ???;
%state.initialized = false;

function state = pidController(state,newData)

%initialization check
if(~state.initialized)
    state.initialized = true;
    state.error = state.target-newData;
    state.ei = state.error;
    state.ed = 0;
    state.e_prev = state.error;
    
    state.result = state.error*state.p+state.ei*state.i+state.ed*state.d;
    return;
end
state.error = state.target-newData;
state.ei = state.ei+state.error;
state.ed = state.error-state.e_prev;
state.e_prev = state.error;
state.result = state.error*state.p+state.ei*state.i+state.ed*state.d;
end