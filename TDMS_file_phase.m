function [Valid_TDMS] = TDMS_file_phase(valid_data,delay)   


for i = 1 : length(fieldnames(valid_data))
    group_name = fieldnames(valid_data);
    group_path  = ['valid_data.', group_name{i}];
    group = eval(group_path);

    for k = 1 : length(fieldnames(group))
        ch_name = fieldnames(group);
        ch_path = [group_path,'.',ch_name{k}];
        channel = eval(ch_path);

        try
            channel.data;  %check if .data exist in the channel                                   
            
            % if statement added to avoid to rephase data that are all 0,
            % Nan or the same values.
            if ~all(channel.data == 0 | isnan(channel.data)) || any(diff(channel.data(:)))
                % shift of the values that satisfy the previous if
                dataToShift = eval([ch_path, '.data']);
                shiftedData = circshift(dataToShift, delay);
                eval([ch_path, '.data = shiftedData;']);
            end

        catch
            continue;
        end

    end


end
Valid_TDMS = valid_data;  
end

