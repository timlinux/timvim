{
  vim.utility.motion = {

    precognition = {
      enable = true;

      setupOpts = {
        # Optional: disable in certain filetypes
        disabled_fts = [ "startify" ];

        # Optional: customize how hints look
        highlightColor = {
          link = "Comment";
        };

        # Optional: whether hints show immediately
        startVisible = false; # Start toggled off by default

        # Optional: hide empty lines if no hint
        showBlankVirtLine = true;

        # Optional: custom hints or priorities
        hints = {
          f = {
            prio = 10;
            text = "f";
          };
          F = {
            prio = 10;
            text = "F";
          };
          t = {
            prio = 10;
            text = "t";
          };
          T = {
            prio = 10;
            text = "T";
          };
        };

        # Optional: gutter hints (rarely needed)
        gutterHints = { };
      };
    };
  };
}
