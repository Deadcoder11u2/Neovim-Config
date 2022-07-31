module(..., package.seeall)
function GetFileExtension(path)
    return path:match("^.+(%..+)$")
end

function GetBaseFileName(path)
    return path:match("[ \\w-]+?(?=\\.)")
end


function compileAndRun()
    local filename = vim.fn.expand('%')
    if (GetFileExtension(filename) == ".java") then
        local codeFilename = filename:match("[^/]*.java")
        local baseFilename = string.sub(codeFilename, 1, -6)
        vim.cmd('!javac ' .. codeFilename .. ' && java ' .. baseFilename .. ' < in.txt 1> out.txt 2> error.txt');
    elseif (GetFileExtension(filename) == '.cpp') then
        local codeFilename = filename:match("[^/]*.cpp")
        local baseFilename = string.sub(codeFilename, 1, -5)
        vim.cmd('!g++ ' .. codeFilename .. ' -o ' .. baseFilename .. ' && ' .. baseFilename .. ".exe < in.txt 1> out.txt 2> error.txt")
    elseif (GetFileExtension(filename) == ".py") then
        local codeFilename = filename:match("[^/]*.py")
        local baseFilename = string.sub(codeFilename, 1, -4)
        vim.cmd('!python ' .. codeFilename .. ' < in.txt 1> out.txt 2> error.txt')
    end
end

