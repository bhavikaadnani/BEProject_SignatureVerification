fid=fopen('data.txt');
tline = fgetl(fid);
while ischar(tline)
    disp(tline)
    s=strcat('Test/',tline);
    tline = fgetl(fid);
end
fclose(fid);

disp(s)