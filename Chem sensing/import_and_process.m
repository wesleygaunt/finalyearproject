function vmm = import_and_process(file)
data_raw = vmm_import(file);
data_points = size(data_raw,1);
data_raw(1:9:data_points)= [];
data_points = size(data_raw,1);

vmm = zeros(data_points/8,4);
vmm(:,1) = data_raw(1:8:data_points - 7) + data_raw(2:8:data_points - 6);
vmm(:,2) = data_raw(3:8:data_points - 5) + data_raw(4:8:data_points - 4 );
vmm(:,3) = data_raw(5:8:data_points - 3) + data_raw(6:8:data_points - 2);
vmm(:,4) = data_raw(7:8:data_points - 1) + data_raw(8:8:data_points);
vmm = vmm/(1e-6);

end
