# TDMS_matlab_library
functions to help to manipulate TDMS file on matlab

TDMS_clear use TDMS_del_Nan, TDMS_del_empty, TDMS_del_same, TDMS_del_zeros functions to iterate in all the channels of each group and delete a channel if is composet by only the selected value (nan, zeros,...). If all the channels in a group are deleted, also the group will be deleted.

TDMS_import use a simple GUI to import the structure and the path of a TDMS or aad file.

delay_calc take two inputs, one referance signal and one to phasa. The function calculate the delay and, with the TDSM_file_phase, is possible to rephase all the TDMS file.
