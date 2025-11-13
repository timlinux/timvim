{

  vim.binds.whichKey = {
    enable = true;

    register = {
      # AI Assistant Menu (Claude Code)
      "<leader>a" = "󰆔 Assistant";
      "<leader>ac" = " Claude Code Toggle";
      "<leader>af" = "󰁨 Claude Code Focus";
      "<leader>as" = "󰤌 Select Claude Model";
      "<leader>am" = "󰤌 Send Selection to Claude";

      # Session Menu
      "<leader>s" = "󰆔 Session";
      "<leader>sm" = "󰆔 Open Session Manager";
      "<leader>ss" = "󰆓 Save Current Session";
      "<leader>sl" = "󰆒 Load Last Session";
      "<leader>so" = "󰆑 Load Session";
      "<leader>sd" = "󰅙 Delete Session";

      # Buffer Menu
      "<leader>b" = "󰓩 Buffers";
      "<leader>bb" = "󰸞 Find Buffers";
      "<leader>bl" = "󰒭 Next Buffer";
      "<leader>bh" = "󰒮 Previous Buffer";
      "<leader>bx" = "󰅖 Close Buffer";
      "<leader>bp" = "󰸞 Pick Buffer";
      "<leader>bj" = "󰈔 Swap Buffer Down";
      "<leader>bk" = "󰈕 Swap Buffer Up";
      "<leader>bs" = "󰈖 Swap Buffer Left";
      "<leader>bd" = "󰈗 Swap Buffer Right";

      # Code Menu
      "<leader>c" = "󰅩 Code";
      "<leader>cp" = "󰏘 Colour Picker";
      "<leader>cr" = "󰑕 Rename Symbol";
      "<leader>cf" = "󰉼 Format Buffer";
      "<leader>cc" = "󰥔 Check Available Formatters";
      "<leader>cs" = "󰆘 Show Minimap";
      "<leader>ch" = "󰆘 Hide Minimap";
      "<leader>cm" = "󰆘 Toggle Minimap";
      "<leader>ci" = "󰆘 Focus Minimap";
      "<leader>co" = "󰒺 Toggle Code Outline";
      "<leader>cd" = "󰊄 Go to Definition";
      "<leader>cD" = "󰊄 Go to Declaration";
      "<leader>cI" = "󰡱 Find Implementations";
      "<leader>ct" = "󰊕 Find Type Definitions";
      "<leader>cR" = "󰈇 Find References";
      "<leader>cn" = "󰎔 Next Diagnostic";
      "<leader>cP" = "󰎖 Previous Diagnostic";

      # Debug Menu
      "<leader>d" = "󰃤 Debug";
      "<leader>da" = "󰃤 Attach to Remote Python (Port 9000)";
      "<leader>dl" = "󰐊 Start/Continue Local Debugging";
      "<leader>ds" = "󰙵 Show Debug Status";
      "<leader>di" = "󰏖 Check Debugpy Installation";
      "<leader>dc" = "󰐊 Continue";
      "<leader>db" = "󰏃 Toggle Breakpoint";
      "<leader>du" = "󰕮 Toggle DAP UI";
      "<leader>dr" = "󰞷 Toggle REPL";
      "<leader>dh" = "󰋖 Hover";
      "<leader>dq" = "󰓛 Terminate";
      "<leader>dR" = "󰜉 Restart";
      "<leader>d." = "󰑮 Run Last";
      "<leader>dn" = "󰆹 Step Into";
      "<leader>dv" = "󰆸 Step Over";
      "<leader>dt" = "󰆷 Run to Cursor";
      "<leader>dj" = "󰬍 Go Down Stack";
      "<leader>dk" = "󰬆 Go Up Stack";

      # Files Menu (Telescope & File Browser)
      "<leader>f" = "󰈞 Files";
      "<leader>ff" = "󰈞 Find Files with Names";
      "<leader>fg" = "󰊄 Find Files with Contents (Fixed String)";
      "<leader>fG" = "󰊄 Find Files with Contents (Regex)";

      "<leader>fm" = "󰸶 Find Media Files";
      "<leader>fp" = "󰌠 Find Python Files";
      "<leader>fn" = "󱄅 Find Nix Files";
      "<leader>fs" = "󰒕 Find Symbols in Current File";
      "<leader>fo" = "󰏇 Open Oil File Manager";
      "<leader>fO" = "󰏇 Open Oil File Manager (Floating)";

      # Git Menu
      "<leader>g" = "󰊢 Git";
      "<leader>gg" = "󰊢 LazyGit";
      "<leader>gb" = "󰊢 Git Blame Line";
      "<leader>gx" = "󰊢 Toggle Git Blame";
      "<leader>gl" = "󰊢 Git Log";
      "<leader>go" = "󰊢 Toggle Git Outline";
      "<leader>gs" = "󰊢 Stage Hunk";
      "<leader>gr" = "󰊢 Reset Hunk";
      "<leader>gS" = "󰊢 Stage Buffer";
      "<leader>gR" = "󰊢 Reset Buffer";
      "<leader>gu" = "󰊢 Undo Stage Hunk";
      "<leader>gp" = "󰊢 Preview Hunk";
      "<leader>gd" = "󰊢 Diff This";
      "<leader>gD" = "󰊢 Diff Project";
      "<leader>gn" = "󰊢 Git Choose None";
      "<leader>gt" = "󰊢 Git Choose Theirs";
      "<leader>gc" = "󰊢 Git Choose Ours";
      "<leader>ga" = "󰊢 Git Choose Both";

      # Toggles Menu
      "<leader>t" = "󰔡 Toggles";
      "<leader>tt" = "󰔡 Toggle Floaterm";
      "<leader>tn" = "󰔡 Toggle Neotree Filesystem";
      "<leader>tf" = "󰔡 Toggle Oil File Manager";
      "<leader>th" = "󰔡 Toggle HardTime";
      "<leader>tc" = "󰔡 Toggle Treesitter Context";
      "<leader>ti" = "󰔡 Toggle Indent Guides";
      "<leader>to" = "󰔡 Toggle Code Outline Panel";
      "<leader>tw" = "󰔡 Toggle CursorHold Error Tooltips";
      "<leader>tv" = "󰔡 Toggle Virtual Text Diagnostics";
      "<leader>tp" = "󰔡 Toggle Precognition";
      "<leader>tm" = "󰔡 Toggle Markdown Preview";
      "<leader>ty" = "󰔡 Typing Tutor";

      # Preview Menu
      "<leader>p" = "󰸶 Preview";
      "<leader>pm" = "󰷈 Preview Markdown";
      "<leader>pi" = "󰸶 Preview Image";

      # Spell Checking Menu
      "<leader>z" = "󰓆 Spell Check";
      "<leader>zs" = "󰓆 Toggle Spell Check";
      "<leader>z=" = "󰋖 Show Spell Suggestions";
      "<leader>za" = "󰐕 Add Word to Dictionary";
      "<leader>zb" = "󰅙 Mark Word as Bad";
      "<leader>zr" = "󰅖 Remove Word from Dictionary";
      "<leader>zf" = "󰚀 Quick Fix with First Suggestion";
      "<leader>zt" = "󰓆 Toggle Syntax-based Spell Check";
      "]s" = "󰒭 Next Misspelled Word";
      "[s" = "󰒮 Previous Misspelled Word";
      # Surround
      "gz" = "󰔡 Surround";
    };

    setupOpts = {
      preset = "modern";
      notify = true;
      win = {
        border = "rounded";
      };
    };
  };

  vim.ui.borders.plugins.which-key = {
    enable = true;
    style = "rounded";
  };
}
