{ ... }:
{
  vim = {
    options = {
      sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos";
      # Also set viewoptions to ensure cursor position is saved in views
      viewoptions = "cursor,folds,options,curdir";
    };

    session.nvim-session-manager = {
      enable = true;
      usePicker = true;

      mappings = {
        deleteSession = "<leader>sd";
        loadLastSession = "<leader>sl";
        saveCurrentSession = "<leader>ss";
        loadSession = "<leader>so";
      };

      setupOpts = {
        autoload_mode = "CurrentDir";
        autosave_last_session = true;
        autosave_ignore_buftypes = [
          "terminal"
          "quickfix"
          "nofile"
          "help"
        ];
        autosave_ignore_dirs = [
          "~/"
          "~/Projects"
          "~/Downloads/"
          "~/temp"
          "/tmp"
        ];
      };
    };
  };
}
