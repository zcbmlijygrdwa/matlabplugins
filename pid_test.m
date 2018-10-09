clear all;
close all;

target = 10;

PID_out = [];

state.p = 0.01;
state.i = 0.001;
state.d = 0;
state.target = 10;
state.initialized = false;

newData = 0;
for i =1:1000
    
    if(i==564)
       state.target = 17.65; 
    end
    
state = pidController(state,newData);

%plant
x = state.result;
y = x^3+0.76*x-9.45;

newData = y;
PID_out = [PID_out;y];
    
end


plot(PID_out,'k');
hold on;
plot(ones(length(PID_out),1)*state.target,'b')



