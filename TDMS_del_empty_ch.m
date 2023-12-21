function TDMS_ok = TDMS_del_empty_ch(TDMS_tc)

TDMS_ok = TDMS_tc;



    for i = 1 : length(fieldnames(TDMS_tc))
        group_name = fieldnames(TDMS_tc);
        g_name = group_name{i};
        group_path  = ['TDMS_tc.', g_name];
        group = eval(group_path);
    
        for k = 1 : length(fieldnames(group))
            ch_name_all = fieldnames(group);
            ch_name = ch_name_all{k};
            ch_path = [group_path,'.',ch_name];
            channel = eval(ch_path);
    
            if isfield(eval(ch_path), 'data') && all(isempty(eval([ch_path, '.data'])))
                TDMS_ok.(g_name) = rmfield(TDMS_ok.(g_name), ch_name);
            end
        end
    
    
    end


TDMS_ok = TDMS_ok; 
end



