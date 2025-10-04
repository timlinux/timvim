{
  vim = {
    globals = {
      mapleader = " ";
    };
    options = {
      # Numbering
      number = true;
      relativenumber = true;

      # Tab Settings
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # Indentation
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # Fold Settings
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = false;

      shada = "!,'100,<50,s10,h";
      #shadafile = "NONE";

      # Autosave settings
      autowrite = true; # Auto-save when switching buffers
      autowriteall = true; # Auto-save on more events
      updatetime = 1000; # Write swap file after 1 second of inactivity

      wrap = false;
    };
  };
}
