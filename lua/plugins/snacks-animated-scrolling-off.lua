local java_build_dirs = { "target", "build", ".gradle", ".idea", "node_modules", "dist", "out", ".settings" }

return {
	"folke/snacks.nvim",
	opts = {
		scroll = {
			enabled = false,
		},
		picker = {
			matcher = {
				sort_empty = false,
			},
			sources = {
				files = {
					ignored = true, -- ignora .gitignore (fix para projetos com "com/" no gitignore)
					exclude = java_build_dirs,
				},
				grep = {
					ignored = true,
					exclude = java_build_dirs,
				},
			},
		},
	},
}
