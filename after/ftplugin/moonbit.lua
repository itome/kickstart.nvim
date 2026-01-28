-- Enable C-style indentation for moonbit
vim.bo.cindent = true

-- Configure indent behavior:
-- (s  = indent by shiftwidth after ( (not align to column)
-- [s  = indent by shiftwidth after [ (not align to column)
-- {0  = opening { at column 0 doesn't affect indent
-- U1  = do not ignore nested brackets (but single shiftwidth)
-- w1  = unclosed ( at eol: indent one shiftwidth
-- m1  = align closing ) with first char of line with (
vim.bo.cinoptions = '(s,[s,{0,U1,w1,m1'
