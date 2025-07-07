local status_ok, origami = pcall(require, "origami")
if not status_ok then
  return
end

-- default settings
origami.setup {
	keepFoldsAcrossSessions = true,
	pauseFoldsOnSearch = true,
	setupFoldKeymaps = false,

	-- `h` key opens on first column, not at first non-blank character or before
	hOnlyOpensOnFirstColumn = false,
}
