% the two input of the function must be 2 vector composed by numbers,
% normally that type of data are store in TDMS.group.channel.data
%
% sig_ip stay for "signal in phase", the referance we use to calculate the
% delay.
% 
% sig_tp stay for "signa to phase", one of the signal stored in the TDMS
% file which we want to phase.
%
% it's important to choose a channel data that can describe the signal
% effectively, like RPM, Torque or Ampere.

function [delay]= delay_calc(sig_tp,sig_ip)

figure("Name","Phasing State")
subplot(3,1,1)
scroll = plot(sig_ip,LineWidth=2);
hold on

for i = 1 : length(sig_tp)

    % calcoli
    sig_tp_shift = circshift(sig_tp,i);
    corr = xcorr(sig_ip,sig_tp_shift);
    max_corr(i) = max(corr);

    if mod(i,10) == 0
        subplot(3,1,1)
        scroll = plot(sig_tp_shift,LineStyle="--",LineWidth=1.5);
        drawnow;
        delete(scroll);
        
        subplot(3,1,2)
        cor = plot(corr);
        ylabel("Crosscorrelation")
    
        subplot(3,1,3)
        mc = plot(i,max_corr(i),'or');
        hold on 
        ylabel("Cross corr max value")
        end

end

[~, idx] = max(max_corr);

phased_sig = circshift(sig_tp,idx);
delay = idx;

close(gcf);

end

