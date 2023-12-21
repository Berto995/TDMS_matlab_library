function [TDMS_struct,filepath] = TDMS_import()

% la dummy figure g serve per non mandare out of focus la finestra quando
% si esegue la funzione sull'applicazione
g = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
[filename, path] = uigetfile('*.tdms;*.aad',"import file");

f = waitbar(0,'Loading your data');

waitbar(0.25,f,'Loading your data');


TDMS_struct = TDMS_getStruct([path filename]);


filepath = fullfile(path,filename);
waitbar(0.75,f,'Loading your data');
pause(0.5)
waitbar(1,f,'Finishing');

close(f)
delete(g);

end

