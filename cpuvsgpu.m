function cpuvsgpu(iteration)
%This function test performance of CPU and GPU
number = 2000; 
%iteration = 4000;
tic;
A4 = rand(number,number);
for i = 1:iteration
B4 = fft(A4);
end
time1 = toc;

disp(['for time: ' num2str(time1)]);


tic;
A5 = gpuArray.rand(number,number);
for i = 1:iteration
B5 = fft(A5);
end
%B5 = gather(B5);
time2 = toc;
disp(['gpu time: ' num2str(time2)]);
speedUp = time1/time2;
disp(speedUp);

tic;
A5 = rand(number,number);
parfor i = 1:iteration
B6 = fft(A5);
end
%B6 = gather(B6);
time3 = toc;
disp(['parfor time: ' num2str(time3)]);

speedUp = time1/time3;
disp(speedUp);

tic;
A5 = gpuArray.rand(number,number);
parfor i = 1:iteration
B5 = fft(A5);
end
%B5 = gather(B5);
time4 = toc;
disp(['gpu parfor time: ' num2str(time4)]);

speedUp = time1/time4;
disp(speedUp);
end

