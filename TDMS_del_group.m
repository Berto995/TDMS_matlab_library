function TDMS_ok = TDMS_del_group(TDMS_tc)

TDMS_ok = TDMS_tc;



    for i = 1 : length(fieldnames(TDMS_tc))
        group_name = fieldnames(TDMS_tc);
        g_name = group_name{i};
        group_path  = ['TDMS_tc.', g_name];
        group = eval(group_path);
    
        if numel(fieldnames(group)) < 3
            disp([g_name]);
            TDMS_ok = rmfield(TDMS_ok,g_name);
        end

    end


TDMS_ok = TDMS_ok; 


end



