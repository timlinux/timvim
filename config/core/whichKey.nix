{

  vim.binds.whichKey = {
    enable = true;

    register = {
      # AI Assistant Menu
      "<leader>a" = " Assistant";
      "<leader>ac" = " Copilot Chat";
      "<leader>ap" = "󰌘 Copilot Panel";
      "<leader>as" = "󰋖 Copilot Status";
      "<leader>ae" = "󰐊 Enable Copilot";
      "<leader>ad" = "󰈅 Disable Copilot";
      "<leader>ai" = "󰋗 Ask Copilot to Explain";
      "<leader>ar" = "󰤌 Ask Copilot to Review";
      "<leader>af" = "󰁨 Ask Copilot to Fix";
      "<leader>ao" = "󰓕 Ask Copilot to Optimise";

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
      "<leader>fg" = "󰊄 Find Files with Contents (FZF)";

      "<leader>fm" = "󰸶 Find Media Files";
      "<leader>fp" = "󰌠 Find Python Files";
      "<leader>fn" = "󱄅 Find Nix Files";
      "<leader>fs" = "󰒕 Find Symbols in Current File";
      "<leader>fo" = "󰏇 Open Oil File Manager";
      "<leader>fO" = "󰏇 Open Oil File Manager (Floating)";

      # Git Menu
      "<leader>g" = "󰊢 Git";
      "<leader>gg" = "󰊢 Open Git Terminal";
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

      # Session Menu
      "<leader>s" = "󰆔 Session";
      "<leader>sm" = "󰆔 Open Session Manager";
      "<leader>ss" = "󰆓 Save Current Session";
      "<leader>sl" = "󰆒 Load Last Session";
      "<leader>so" = "󰆑 Load Session";
      "<leader>sd" = "󰅙 Delete Session";

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
      "<leader>tp" = "󰔡 Toggle Precognition";

      # Markdown Preview
      "<leader>pm" = "󰷈 Preview Markdown";

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
