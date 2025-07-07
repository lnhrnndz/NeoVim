local autoclose_status_ok, autoclose = pcall(require, "autoclose")
if not autoclose_status_ok then
  return
end

autoclose.setup({
   keys = {
      ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
   },
})
