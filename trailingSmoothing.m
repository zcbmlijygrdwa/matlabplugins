function data_proc = trailingSmoothing(data)
  data_proc = [];
  state = data(1);
  
  for i = 1:size(data,1)
    diff = data(i) - state;
    state = state + 0.01*diff;
    data_proc(i) = state;
  end
 
end 