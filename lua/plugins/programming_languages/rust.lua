-- rust plugins
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
-- https://github.com/cordx56/rustowl/blob/main/docs/usage.md
-- https://github.com/Saecki/crates.nvim
-- https://medium.com/@shambhu_/mastering-rust-development-with-neovim-a-step-by-step-guide-for-the-modern-developer-c914d672ff41
-- https://github.com/dreamsofcode-io/neovim-rust/blob/main/plugins.lua
return {
  -- https://github.com/mrcjkb/rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
