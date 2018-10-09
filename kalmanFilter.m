function [ Pk_merge,Qk,Rk,xk_prediction_history,xk_merge_history,xk_merge,zk_history ] = kalmanFilter(zk, Pk_merge,Qk,Rk,xk_prediction_history,xk_merge_history,xk_merge ,zk_history)
%Generalized kalmanFilter for 1 dimension data
%Xk contains [xk, dxk]
%Fk: state transition model
%Hk: observation model
%Bk: control-input model assume 0
%Pk: posteriori error covariance matrix

%Qk: Covariance of process noise, noise of (xk_merge-Fk*xk_merge_prev)
%Rk: Covariance of observation noise, noise of (zk-Hk*xk_prediction)

%zk: reading
%xk: value
%Kk: kalman gain

bufferSize = 5;

%initialization
Fk = [1 1
    0 1]; %x = x+v; v = v  update everyframe
Hk = [1 0];

Pk_merge = Pk_merge;
Qk = Qk;
Rk = Rk;
xk_prediction_history = xk_prediction_history;
xk_merge_history = xk_merge_history;
zk_history = zk_history;
xk_merge = xk_merge;


%get new reading
%zk = getReading();
zk = zk;
zk_history = [zk_history zk];

if size(zk_history,2)>bufferSize+1
    xk_merge_history_buffer = xk_merge_history(:,end-bufferSize+1:end);
    xk_merge_history_buffer_prev = xk_merge_history(:,end-bufferSize:end-1);
    %a: (xk_merge-Fk*xk_merge_prev)
    a = [xk_merge_history_buffer - Fk*xk_merge_history_buffer_prev];
    zk_history_buffer = zk_history(:,end-bufferSize+1:end);
    xk_prediction_history_buffer = xk_prediction_history(:,end-bufferSize+1:end);
    %b: (zk-Hk*zk_prev)
    b = [zk_history_buffer - Hk*xk_prediction_history_buffer];
    Qk = [cov(a(1,:)) 0
        0 cov(a(2,:))];
    Rk = cov(b);
end
%predict update
xk_prediction = Fk*xk_merge; %Fk*xkm1+Bk*uk+wk;
Pk_prediction = Fk*Pk_merge*Fk'+Qk;

%update
Hk = Hk;  %no update if physical model does not change over time
Fk = Fk;  %no update if physical model does not change over time
Kk = Pk_prediction*Hk'*(inv(Hk*Pk_prediction*Hk'+Rk));
xk_merge = xk_prediction+Kk*(zk-Hk*xk_prediction);
Pk_merge = Pk_prediction-Kk*Hk*Pk_prediction;
xk_merge_history = [xk_merge_history xk_merge];
xk_prediction_history = [xk_prediction_history xk_prediction];


end

