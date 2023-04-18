require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--no-ignore-vcs",
      "--glob", "!**CMakeFiles**",
      "--glob", "!build/**",
      "--glob", "!__pycache__",
      "--glob", "!node_modules",
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      find_command = {
        "fd", "--type", "f", "--no-ignore",
        "--exclude", "*.o",
        "--exclude", "*.o.c",
        "--exclude", "*.a",
        "--exclude", "*.i",
        "--exclude", "*.cmake",
        "--exclude", "*.make",
        "--exclude", "**CMakeFiles**",
        "--exclude", "build/**",
        "--exclude", "compile_commands.json",
        "--exclude", "__pycache__",
        "--exclude", "node_modules",
      }
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

