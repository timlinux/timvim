{
  vim.utility = {
    images = {
      image-nvim = {
        enable = true;
        setupOpts = {
          backend = "kitty";
          editorOnlyRenderWhenFocused = false;
          integrations = {
            markdown = {
              enable = true;
              clearInInsertMode = true;
              downloadRemoteImages = true;
            };
          };
        };
      };
      img-clip.enable = true;
    };
  };
}
