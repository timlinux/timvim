{ pkgs, ... }:
{
  vim.options = {
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

    wrap = false;
  };
}
