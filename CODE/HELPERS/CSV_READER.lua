-- i might not finish this, but will make EVERYTHING much easier datawise
function readCSV(_path)
    local fileList = {}
    for line in io.lines(_path) do
        local len, quan = line:match("%s*(.-),%s*(.-)%s*$")
        print(len.."\n"..quan)
        fileList[#fileList+1] = { length = len, quantity = quan}
    end
end