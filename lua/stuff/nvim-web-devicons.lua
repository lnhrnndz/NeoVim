local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.setup({
  override = {
    tex = {
      icon = "",
      color = "#98971A",
      name = "Latex"
    }
  }
})
