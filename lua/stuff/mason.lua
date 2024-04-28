local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
})
