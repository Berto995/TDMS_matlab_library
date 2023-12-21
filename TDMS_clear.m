function [TDMS_cleaned] = TDMS_clear(TDMS_to_clean,Remove_zeros,Remove_NaN,Remove_empty,Remove_same)   

f = waitbar(0,'Cleaning you data');


if Remove_zeros==1 
    TDMS_to_clean = TDMS_del_zeros_ch(TDMS_to_clean);
    waitbar(0.25,f,'zeros removed');
end



if Remove_NaN==1
    TDMS_to_clean = TDMS_del_NaN_ch(TDMS_to_clean);
    waitbar(0.5,f,'NaN removed');
end



if Remove_empty==1
    TDMS_to_clean = TDMS_del_empty_ch(TDMS_to_clean);
    waitbar(0.75,f,'empty removed');
end



if Remove_same==1
    TDMS_to_clean = TDMS_del_same_ch(TDMS_to_clean);
    waitbar(0.99,f,'same removed');
end

close(f)

TDMS_cleaned = TDMS_del_group(TDMS_to_clean);


end

