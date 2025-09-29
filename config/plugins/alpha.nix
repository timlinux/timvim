{ pkgs, ... }:

{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.alpha-nvim
      pkgs.vimPlugins.plenary-nvim # required dependency
    ];

    pluginRC.alpha = ''
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

      vim.api.nvim_set_hl(0, "T2A7eb9d8", { bg="#7eb9d8" })
      vim.api.nvim_set_hl(0, "T2Aa1cce3", { bg="#a1cce3" })
      vim.api.nvim_set_hl(0, "T2Aa7cfe5", { bg="#a7cfe5" })
      vim.api.nvim_set_hl(0, "T2Ab2d5e8", { bg="#b2d5e8" })
      vim.api.nvim_set_hl(0, "T2Acde3f0", { bg="#cde3f0" })
      vim.api.nvim_set_hl(0, "T2Ad0d0d0", { bg="#d0d0d0" })
      vim.api.nvim_set_hl(0, "T2Adcdcdc", { bg="#dcdcdc" })
      vim.api.nvim_set_hl(0, "T2Af7dbab", { bg="#f7dbab" })
      vim.api.nvim_set_hl(0, "T2Afafcfd", { bg="#fafcfd" })
      vim.api.nvim_set_hl(0, "T2Afcf4e6", { bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Afcfdfe", { bg="#fcfdfe" })
      vim.api.nvim_set_hl(0, "T2A54a2cc54a2cc", { fg="#54a2cc", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A54a2cc58a4cd", { fg="#54a2cc", bg="#58a4cd" })
      vim.api.nvim_set_hl(0, "T2A54a2cc5ba6ce", { fg="#54a2cc", bg="#5ba6ce" })
      vim.api.nvim_set_hl(0, "T2A54a2cc5ca6ce", { fg="#54a2cc", bg="#5ca6ce" })
      vim.api.nvim_set_hl(0, "T2A54a2cc6baed2", { fg="#54a2cc", bg="#6baed2" })
      vim.api.nvim_set_hl(0, "T2A54a2cc7fb9d8", { fg="#54a2cc", bg="#7fb9d8" })
      vim.api.nvim_set_hl(0, "T2A54a2cc88bedb", { fg="#54a2cc", bg="#88bedb" })
      vim.api.nvim_set_hl(0, "T2A54a2cc8dc1dd", { fg="#54a2cc", bg="#8dc1dd" })
      vim.api.nvim_set_hl(0, "T2A54a2cc96c6df", { fg="#54a2cc", bg="#96c6df" })
      vim.api.nvim_set_hl(0, "T2A54a2cc9bc8e1", { fg="#54a2cc", bg="#9bc8e1" })
      vim.api.nvim_set_hl(0, "T2A54a2ccb2d5e8", { fg="#54a2cc", bg="#b2d5e8" })
      vim.api.nvim_set_hl(0, "T2A54a2ccb3d5e8", { fg="#54a2cc", bg="#b3d5e8" })
      vim.api.nvim_set_hl(0, "T2A54a2ccc8e1ee", { fg="#54a2cc", bg="#c8e1ee" })
      vim.api.nvim_set_hl(0, "T2A54a2ccc9e1ee", { fg="#54a2cc", bg="#c9e1ee" })
      vim.api.nvim_set_hl(0, "T2A54a2cccee4f0", { fg="#54a2cc", bg="#cee4f0" })
      vim.api.nvim_set_hl(0, "T2A54a2ccdfedf5", { fg="#54a2cc", bg="#dfedf5" })
      vim.api.nvim_set_hl(0, "T2A54a2ccf3f8fb", { fg="#54a2cc", bg="#f3f8fb" })
      vim.api.nvim_set_hl(0, "T2A54a2ccf8fbfc", { fg="#54a2cc", bg="#f8fbfc" })
      vim.api.nvim_set_hl(0, "T2A54a2ccfefefe", { fg="#54a2cc", bg="#fefefe" })
      vim.api.nvim_set_hl(0, "T2A55a2cc54a2cc", { fg="#55a2cc", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A59a4cd54a2cc", { fg="#59a4cd", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A59a4cd7fb9d9", { fg="#59a4cd", bg="#7fb9d9" })
      vim.api.nvim_set_hl(0, "T2A5ba5cec9e1ee", { fg="#5ba5ce", bg="#c9e1ee" })
      vim.api.nvim_set_hl(0, "T2A5ba5cef6fafc", { fg="#5ba5ce", bg="#f6fafc" })
      vim.api.nvim_set_hl(0, "T2A5da7ce54a2cc", { fg="#5da7ce", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A5da7ce78b5d6", { fg="#5da7ce", bg="#78b5d6" })
      vim.api.nvim_set_hl(0, "T2A5da7cef8fbfc", { fg="#5da7ce", bg="#f8fbfc" })
      vim.api.nvim_set_hl(0, "T2A68acd296c6df", { fg="#68acd2", bg="#96c6df" })
      vim.api.nvim_set_hl(0, "T2A6baed354a2cc", { fg="#6baed3", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A6eb0d354a2cc", { fg="#6eb0d3", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A74b3d56baed2", { fg="#74b3d5", bg="#6baed2" })
      vim.api.nvim_set_hl(0, "T2A74b3d5ffffff", { fg="#74b3d5", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2A75b4d68dc1dd", { fg="#75b4d6", bg="#8dc1dd" })
      vim.api.nvim_set_hl(0, "T2A83bbda54a2cc", { fg="#83bbda", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A83bbda7eb9d8", { fg="#83bbda", bg="#7eb9d8" })
      vim.api.nvim_set_hl(0, "T2A8a8b8b", { fg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A8a8b8b8a8b8b", { fg="#8a8b8b", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A8a8b8b8e8f8f", { fg="#8a8b8b", bg="#8e8f8f" })
      vim.api.nvim_set_hl(0, "T2A8a8b8b909191", { fg="#8a8b8b", bg="#909191" })
      vim.api.nvim_set_hl(0, "T2A8a8b8ba4a4a4", { fg="#8a8b8b", bg="#a4a4a4" })
      vim.api.nvim_set_hl(0, "T2A8a8b8ba9aaaa", { fg="#8a8b8b", bg="#a9aaaa" })
      vim.api.nvim_set_hl(0, "T2A8a8b8babacac", { fg="#8a8b8b", bg="#abacac" })
      vim.api.nvim_set_hl(0, "T2A8a8b8badaeae", { fg="#8a8b8b", bg="#adaeae" })
      vim.api.nvim_set_hl(0, "T2A8a8b8baeafaf", { fg="#8a8b8b", bg="#aeafaf" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bb4b5b5", { fg="#8a8b8b", bg="#b4b5b5" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bbdbebe", { fg="#8a8b8b", bg="#bdbebe" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bc1c2c2", { fg="#8a8b8b", bg="#c1c2c2" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bc2c3c3", { fg="#8a8b8b", bg="#c2c3c3" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bcacaca", { fg="#8a8b8b", bg="#cacaca" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bdbdbdb", { fg="#8a8b8b", bg="#dbdbdb" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bdedede", { fg="#8a8b8b", bg="#dedede" })
      vim.api.nvim_set_hl(0, "T2A8a8b8be9e9e9", { fg="#8a8b8b", bg="#e9e9e9" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bededed", { fg="#8a8b8b", bg="#ededed" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bf2f2f2", { fg="#8a8b8b", bg="#f2f2f2" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bf4f4f4", { fg="#8a8b8b", bg="#f4f4f4" })
      vim.api.nvim_set_hl(0, "T2A8a8b8bffffff", { fg="#8a8b8b", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2A8abfdc54a2cc", { fg="#8abfdc", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A8abfdca1cce3", { fg="#8abfdc", bg="#a1cce3" })
      vim.api.nvim_set_hl(0, "T2A8f90908a8b8b", { fg="#8f9090", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A9091918a8b8b", { fg="#909191", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A909191a5a6a6", { fg="#909191", bg="#a5a6a6" })
      vim.api.nvim_set_hl(0, "T2A919292f2f2f2", { fg="#919292", bg="#f2f2f2" })
      vim.api.nvim_set_hl(0, "T2A9596968a8b8b", { fg="#959696", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A9596968f9090", { fg="#959696", bg="#8f9090" })
      vim.api.nvim_set_hl(0, "T2A95c5dfdfedf5", { fg="#95c5df", bg="#dfedf5" })
      vim.api.nvim_set_hl(0, "T2A979898", { fg="#979898" })
      vim.api.nvim_set_hl(0, "T2A999a9a8a8b8b", { fg="#999a9a", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2A9a9b9b", { fg="#9a9b9b" })
      vim.api.nvim_set_hl(0, "T2A9b9c9cffffff", { fg="#9b9c9c", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2A9dcae254a2cc", { fg="#9dcae2", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2A9dcae257a3cc", { fg="#9dcae2", bg="#57a3cc" })
      vim.api.nvim_set_hl(0, "T2A9fcbe2f3f8fb", { fg="#9fcbe2", bg="#f3f8fb" })
      vim.api.nvim_set_hl(0, "T2Aa1a2a28a8b8b", { fg="#a1a2a2", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Aa4a5a58a8b8b", { fg="#a4a5a5", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Aa5a6a6ededed", { fg="#a5a6a6", bg="#ededed" })
      vim.api.nvim_set_hl(0, "T2Aa8cfe554a2cc", { fg="#a8cfe5", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Aa8cfe560a8cf", { fg="#a8cfe5", bg="#60a8cf" })
      vim.api.nvim_set_hl(0, "T2Aa8cfe57fb9d8", { fg="#a8cfe5", bg="#7fb9d8" })
      vim.api.nvim_set_hl(0, "T2Aa8cfe5fcfdfe", { fg="#a8cfe5", bg="#fcfdfe" })
      vim.api.nvim_set_hl(0, "T2Aabacac8a8b8b", { fg="#abacac", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Aabd1e6", { fg="#abd1e6" })
      vim.api.nvim_set_hl(0, "T2Aabd1e6f6fafc", { fg="#abd1e6", bg="#f6fafc" })
      vim.api.nvim_set_hl(0, "T2Aacd1e6fefefe", { fg="#acd1e6", bg="#fefefe" })
      vim.api.nvim_set_hl(0, "T2Ab0d4e7", { fg="#b0d4e7" })
      vim.api.nvim_set_hl(0, "T2Ab1b1b1", { fg="#b1b1b1" })
      vim.api.nvim_set_hl(0, "T2Ab3d5e854a2cc", { fg="#b3d5e8", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Ab3d5e860a8cf", { fg="#b3d5e8", bg="#60a8cf" })
      vim.api.nvim_set_hl(0, "T2Ab5b5b5", { fg="#b5b5b5" })
      vim.api.nvim_set_hl(0, "T2Ab8d8ea54a2cc", { fg="#b8d8ea", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Ab8d8eacde3f0", { fg="#b8d8ea", bg="#cde3f0" })
      vim.api.nvim_set_hl(0, "T2Ab8d8eaf3f8fb", { fg="#b8d8ea", bg="#f3f8fb" })
      vim.api.nvim_set_hl(0, "T2Ab9baba", { fg="#b9baba" })
      vim.api.nvim_set_hl(0, "T2Ab9babac2c3c3", { fg="#b9baba", bg="#c2c3c3" })
      vim.api.nvim_set_hl(0, "T2Ab9d8eac8e1ee", { fg="#b9d8ea", bg="#c8e1ee" })
      vim.api.nvim_set_hl(0, "T2Abebebe", { fg="#bebebe" })
      vim.api.nvim_set_hl(0, "T2Abebebe8c8d8d", { fg="#bebebe", bg="#8c8d8d" })
      vim.api.nvim_set_hl(0, "T2Abfdcec9bc8e1", { fg="#bfdcec", bg="#9bc8e1" })
      vim.api.nvim_set_hl(0, "T2Ac1c2c28a8b8b", { fg="#c1c2c2", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Ac4c4c4", { fg="#c4c4c4" })
      vim.api.nvim_set_hl(0, "T2Ac7c8c8adaeae", { fg="#c7c8c8", bg="#adaeae" })
      vim.api.nvim_set_hl(0, "T2Ac7c8c8fefefe", { fg="#c7c8c8", bg="#fefefe" })
      vim.api.nvim_set_hl(0, "T2Acacacae9e9e9", { fg="#cacaca", bg="#e9e9e9" })
      vim.api.nvim_set_hl(0, "T2Acae2ef5ca6ce", { fg="#cae2ef", bg="#5ca6ce" })
      vim.api.nvim_set_hl(0, "T2Acae2effafcfd", { fg="#cae2ef", bg="#fafcfd" })
      vim.api.nvim_set_hl(0, "T2Acdcdcd", { fg="#cdcdcd" })
      vim.api.nvim_set_hl(0, "T2Acde4f054a2cc", { fg="#cde4f0", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Acde4f0b2d5e8", { fg="#cde4f0", bg="#b2d5e8" })
      vim.api.nvim_set_hl(0, "T2Acececec1c2c2", { fg="#cecece", bg="#c1c2c2" })
      vim.api.nvim_set_hl(0, "T2Ad1e6f1", { fg="#d1e6f1" })
      vim.api.nvim_set_hl(0, "T2Ad1e6f154a2cc", { fg="#d1e6f1", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Ad1e6f1a1cce3", { fg="#d1e6f1", bg="#a1cce3" })
      vim.api.nvim_set_hl(0, "T2Ad2d3d3", { fg="#d2d3d3" })
      vim.api.nvim_set_hl(0, "T2Ad2d3d38c8d8d", { fg="#d2d3d3", bg="#8c8d8d" })
      vim.api.nvim_set_hl(0, "T2Ad9d9d98a8b8b", { fg="#d9d9d9", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Ae2e3e3", { fg="#e2e3e3" })
      vim.api.nvim_set_hl(0, "T2Ae4e4e4", { fg="#e4e4e4" })
      vim.api.nvim_set_hl(0, "T2Ae4e4e48a8b8b", { fg="#e4e4e4", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Ae4e4e48c8d8d", { fg="#e4e4e4", bg="#8c8d8d" })
      vim.api.nvim_set_hl(0, "T2Ae6e6e68f9090", { fg="#e6e6e6", bg="#8f9090" })
      vim.api.nvim_set_hl(0, "T2Ae6f1f77fb9d9", { fg="#e6f1f7", bg="#7fb9d9" })
      vim.api.nvim_set_hl(0, "T2Ae6f1f7ffffff", { fg="#e6f1f7", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Ae7f2f8", { fg="#e7f2f8" })
      vim.api.nvim_set_hl(0, "T2Ae7f2f881bad9", { fg="#e7f2f8", bg="#81bad9" })
      vim.api.nvim_set_hl(0, "T2Ae9e9e9a9aaaa", { fg="#e9e9e9", bg="#a9aaaa" })
      vim.api.nvim_set_hl(0, "T2Ae9e9e9d0d0d0", { fg="#e9e9e9", bg="#d0d0d0" })
      vim.api.nvim_set_hl(0, "T2Aeaeaea8a8b8b", { fg="#eaeaea", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Aeaeaea8c8d8d", { fg="#eaeaea", bg="#8c8d8d" })
      vim.api.nvim_set_hl(0, "T2Aeaf3f8", { fg="#eaf3f8" })
      vim.api.nvim_set_hl(0, "T2Aededed", { fg="#ededed" })
      vim.api.nvim_set_hl(0, "T2Aeeb248", { fg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb248eeb248", { fg="#eeb248", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb248eeb652", { fg="#eeb248", bg="#eeb652" })
      vim.api.nvim_set_hl(0, "T2Aeeb248efb756", { fg="#eeb248", bg="#efb756" })
      vim.api.nvim_set_hl(0, "T2Aeeb248f0bb5e", { fg="#eeb248", bg="#f0bb5e" })
      vim.api.nvim_set_hl(0, "T2Aeeb248f1c26f", { fg="#eeb248", bg="#f1c26f" })
      vim.api.nvim_set_hl(0, "T2Aeeb248f1c370", { fg="#eeb248", bg="#f1c370" })
      vim.api.nvim_set_hl(0, "T2Aeeb248f5d396", { fg="#eeb248", bg="#f5d396" })
      vim.api.nvim_set_hl(0, "T2Aeeb248fbeed8", { fg="#eeb248", bg="#fbeed8" })
      vim.api.nvim_set_hl(0, "T2Aeeb248fcf4e6", { fg="#eeb248", bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Aeeb248fdf6ea", { fg="#eeb248", bg="#fdf6ea" })
      vim.api.nvim_set_hl(0, "T2Aeeb248fefdfa", { fg="#eeb248", bg="#fefdfa" })
      vim.api.nvim_set_hl(0, "T2Aeeb249eeb248", { fg="#eeb249", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb249eeb34c", { fg="#eeb249", bg="#eeb34c" })
      vim.api.nvim_set_hl(0, "T2Aeeb24afefdfa", { fg="#eeb24a", bg="#fefdfa" })
      vim.api.nvim_set_hl(0, "T2Aeeb24affffff", { fg="#eeb24a", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Aeeb34aeeb248", { fg="#eeb34a", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb34af1c06b", { fg="#eeb34a", bg="#f1c06b" })
      vim.api.nvim_set_hl(0, "T2Aeeb34beeb248", { fg="#eeb34b", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb34bf7dcad", { fg="#eeb34b", bg="#f7dcad" })
      vim.api.nvim_set_hl(0, "T2Aeeb54ff1c26f", { fg="#eeb54f", bg="#f1c26f" })
      vim.api.nvim_set_hl(0, "T2Aeeb54fffffff", { fg="#eeb54f", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Aeeb550eeb248", { fg="#eeb550", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aeeb550eeb249", { fg="#eeb550", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Aeeb551f1c370", { fg="#eeb551", bg="#f1c370" })
      vim.api.nvim_set_hl(0, "T2Aeeb551fcf4e6", { fg="#eeb551", bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Aeeeeee", { fg="#eeeeee" })
      vim.api.nvim_set_hl(0, "T2Aefb653eeb248", { fg="#efb653", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Aefb95a", { fg="#efb95a" })
      vim.api.nvim_set_hl(0, "T2Aefefef", { fg="#efefef" })
      vim.api.nvim_set_hl(0, "T2Af0bb5d", { fg="#f0bb5d" })
      vim.api.nvim_set_hl(0, "T2Af0bc61eeb248", { fg="#f0bc61", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af0bc61fae8c9", { fg="#f0bc61", bg="#fae8c9" })
      vim.api.nvim_set_hl(0, "T2Af0bd62eeb248", { fg="#f0bd62", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af0bd62f6d8a3", { fg="#f0bd62", bg="#f6d8a3" })
      vim.api.nvim_set_hl(0, "T2Af0bd63fefdfb", { fg="#f0bd63", bg="#fefdfb" })
      vim.api.nvim_set_hl(0, "T2Af0bd63ffffff", { fg="#f0bd63", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Af0be66efb756", { fg="#f0be66", bg="#efb756" })
      vim.api.nvim_set_hl(0, "T2Af0be66fdf6eb", { fg="#f0be66", bg="#fdf6eb" })
      vim.api.nvim_set_hl(0, "T2Af1c06bfdf6ea", { fg="#f1c06b", bg="#fdf6ea" })
      vim.api.nvim_set_hl(0, "T2Af1c06bfdf9f3", { fg="#f1c06b", bg="#fdf9f3" })
      vim.api.nvim_set_hl(0, "T2Af1c26eeeb248", { fg="#f1c26e", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af1c26eeeb249", { fg="#f1c26e", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Af2c576fdfefe", { fg="#f2c576", bg="#fdfefe" })
      vim.api.nvim_set_hl(0, "T2Af2c576fefdfb", { fg="#f2c576", bg="#fefdfb" })
      vim.api.nvim_set_hl(0, "T2Af3cb84eeb652", { fg="#f3cb84", bg="#eeb652" })
      vim.api.nvim_set_hl(0, "T2Af3cb84fdf6eb", { fg="#f3cb84", bg="#fdf6eb" })
      vim.api.nvim_set_hl(0, "T2Af3cc87", { fg="#f3cc87" })
      vim.api.nvim_set_hl(0, "T2Af3cc87fbeed8", { fg="#f3cc87", bg="#fbeed8" })
      vim.api.nvim_set_hl(0, "T2Af3f8fb", { fg="#f3f8fb" })
      vim.api.nvim_set_hl(0, "T2Af3f8fb60a8cf", { fg="#f3f8fb", bg="#60a8cf" })
      vim.api.nvim_set_hl(0, "T2Af3f8fb93c4de", { fg="#f3f8fb", bg="#93c4de" })
      vim.api.nvim_set_hl(0, "T2Af4cd89eeb248", { fg="#f4cd89", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af4cd89eeb249", { fg="#f4cd89", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Af4cf8f", { fg="#f4cf8f" })
      vim.api.nvim_set_hl(0, "T2Af4d08f", { fg="#f4d08f" })
      vim.api.nvim_set_hl(0, "T2Af4d091", { fg="#f4d091" })
      vim.api.nvim_set_hl(0, "T2Af5d59b", { fg="#f5d59b" })
      vim.api.nvim_set_hl(0, "T2Af5d59bf0f7fa", { fg="#f5d59b", bg="#f0f7fa" })
      vim.api.nvim_set_hl(0, "T2Af5d59bfcf4e6", { fg="#f5d59b", bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Af5f5f5", { fg="#f5f5f5" })
      vim.api.nvim_set_hl(0, "T2Af5f5f58a8b8b", { fg="#f5f5f5", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Af5f9fc78b5d6", { fg="#f5f9fc", bg="#78b5d6" })
      vim.api.nvim_set_hl(0, "T2Af6f6f6", { fg="#f6f6f6" })
      vim.api.nvim_set_hl(0, "T2Af7dfb3", { fg="#f7dfb3" })
      vim.api.nvim_set_hl(0, "T2Af7dfb3ffffff", { fg="#f7dfb3", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Af8e1b8eeb248", { fg="#f8e1b8", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af8e1b8fcf4e6", { fg="#f8e1b8", bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Af8e2bb", { fg="#f8e2bb" })
      vim.api.nvim_set_hl(0, "T2Af8e2bceeb248", { fg="#f8e2bc", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Af8e2bcf7dbab", { fg="#f8e2bc", bg="#f7dbab" })
      vim.api.nvim_set_hl(0, "T2Af8fbfd54a2cc", { fg="#f8fbfd", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Af8fbfd93c4de", { fg="#f8fbfd", bg="#93c4de" })
      vim.api.nvim_set_hl(0, "T2Af9e5c2eeb34c", { fg="#f9e5c2", bg="#eeb34c" })
      vim.api.nvim_set_hl(0, "T2Af9e7c8ffffff", { fg="#f9e7c8", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Af9f9f9", { fg="#f9f9f9" })
      vim.api.nvim_set_hl(0, "T2Afaeacd", { fg="#faeacd" })
      vim.api.nvim_set_hl(0, "T2Afaebd1eeb249", { fg="#faebd1", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Afbedd5", { fg="#fbedd5" })
      vim.api.nvim_set_hl(0, "T2Afbedd5f7dcad", { fg="#fbedd5", bg="#f7dcad" })
      vim.api.nvim_set_hl(0, "T2Afbeed8", { fg="#fbeed8" })
      vim.api.nvim_set_hl(0, "T2Afbeed8eeb248", { fg="#fbeed8", bg="#eeb248" })
      vim.api.nvim_set_hl(0, "T2Afbeed8eeb652", { fg="#fbeed8", bg="#eeb652" })
      vim.api.nvim_set_hl(0, "T2Afbeed8fcf4e6", { fg="#fbeed8", bg="#fcf4e6" })
      vim.api.nvim_set_hl(0, "T2Afbefda", { fg="#fbefda" })
      vim.api.nvim_set_hl(0, "T2Afbefdbeeb249", { fg="#fbefdb", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Afbf0dcf1c06b", { fg="#fbf0dc", bg="#f1c06b" })
      vim.api.nvim_set_hl(0, "T2Afbfdfe54a2cc", { fg="#fbfdfe", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Afbfdfe81bad9", { fg="#fbfdfe", bg="#81bad9" })
      vim.api.nvim_set_hl(0, "T2Afcf1df", { fg="#fcf1df" })
      vim.api.nvim_set_hl(0, "T2Afcf2e0", { fg="#fcf2e0" })
      vim.api.nvim_set_hl(0, "T2Afcf2e0fefefe", { fg="#fcf2e0", bg="#fefefe" })
      vim.api.nvim_set_hl(0, "T2Afcfcfc", { fg="#fcfcfc" })
      vim.api.nvim_set_hl(0, "T2Afcfcfc8a8b8b", { fg="#fcfcfc", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Afcfcfca5a6a6", { fg="#fcfcfc", bg="#a5a6a6" })
      vim.api.nvim_set_hl(0, "T2Afcfdfe", { fg="#fcfdfe" })
      vim.api.nvim_set_hl(0, "T2Afdf6eb", { fg="#fdf6eb" })
      vim.api.nvim_set_hl(0, "T2Afdf6ebeeb249", { fg="#fdf6eb", bg="#eeb249" })
      vim.api.nvim_set_hl(0, "T2Afdf7ec", { fg="#fdf7ec" })
      vim.api.nvim_set_hl(0, "T2Afdf7eceeb652", { fg="#fdf7ec", bg="#eeb652" })
      vim.api.nvim_set_hl(0, "T2Afdf7ed", { fg="#fdf7ed" })
      vim.api.nvim_set_hl(0, "T2Afdf8f0", { fg="#fdf8f0" })
      vim.api.nvim_set_hl(0, "T2Afdf9f2", { fg="#fdf9f2" })
      vim.api.nvim_set_hl(0, "T2Afdf9f2fdf6eb", { fg="#fdf9f2", bg="#fdf6eb" })
      vim.api.nvim_set_hl(0, "T2Afdfdfd", { fg="#fdfdfd" })
      vim.api.nvim_set_hl(0, "T2Afefbf6ffffff", { fg="#fefbf6", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Afefdfbf6d8a3", { fg="#fefdfb", bg="#f6d8a3" })
      vim.api.nvim_set_hl(0, "T2Afefefd", { fg="#fefefd" })
      vim.api.nvim_set_hl(0, "T2Afefefe", { fg="#fefefe" })
      vim.api.nvim_set_hl(0, "T2Afefefe8a8b8b", { fg="#fefefe", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Afefefea5a5a5", { fg="#fefefe", bg="#a5a5a5" })
      vim.api.nvim_set_hl(0, "T2Afefefefdf9f3", { fg="#fefefe", bg="#fdf9f3" })
      vim.api.nvim_set_hl(0, "T2Afefefeffffff", { fg="#fefefe", bg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Affffff", { fg="#ffffff" })
      vim.api.nvim_set_hl(0, "T2Affffff54a2cc", { fg="#ffffff", bg="#54a2cc" })
      vim.api.nvim_set_hl(0, "T2Affffff57a3cc", { fg="#ffffff", bg="#57a3cc" })
      vim.api.nvim_set_hl(0, "T2Affffff60a8cf", { fg="#ffffff", bg="#60a8cf" })
      vim.api.nvim_set_hl(0, "T2Affffff8a8b8b", { fg="#ffffff", bg="#8a8b8b" })
      vim.api.nvim_set_hl(0, "T2Affffffa5a5a5", { fg="#ffffff", bg="#a5a5a5" })
      vim.api.nvim_set_hl(0, "T2Affffffa7cfe5", { fg="#ffffff", bg="#a7cfe5" })
      vim.api.nvim_set_hl(0, "T2Affffffdcdcdc", { fg="#ffffff", bg="#dcdcdc" })
      vim.api.nvim_set_hl(0, "T2Afffffff0f7fa", { fg="#ffffff", bg="#f0f7fa" })
      vim.api.nvim_set_hl(0, "T2Afffffffae8c9", { fg="#ffffff", bg="#fae8c9" })
      vim.api.nvim_set_hl(0, "T2Afffffffdf6eb", { fg="#ffffff", bg="#fdf6eb" })
      vim.api.nvim_set_hl(0, "T2Afffffffdfefe", { fg="#ffffff", bg="#fdfefe" })
      vim.api.nvim_set_hl(0, "T2Affffffffffff", { fg="#ffffff", bg="#ffffff" })



            dashboard.section.header.val = {
              [[          ▄▄▄▄▄▄▄▄▄▄          ]],
              [[         ▄▄▄▄▄▄▄▄▄▄▄▄         ]],
              [[        ▄▄▄▄▄▀▀▀▀▄▄▄▄▄        ]],
              [[        ▄▄▄▄      ▄▄▄▄▄       ]],
              [[        ▄▄▄▄      ▄▄▄▄▄       ]],
              [[        ▄▄▄▄▄     ▄▄▄▄        ]],
              [[    ▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄    ]],
              [[  ▄▄▄▄▄▄▄▄▄▄▄▄▀▄▄▄▄▄▄▄▄▄▄▄▄▄  ]],
              [[▄▄▄▄▄▄▀▀▀ ▀▄▄▄▄▄▄▄▄  ▀▀▀▄▄▄▄▄▄]],
              [[▄▄▄▄▄      ▀▀▄▄▄▄▄▀      ▄▄▄▄▄]],
              [[▄▄▄▄▄      ▄▄▄▄▄▄▄▄      ▄▄▄▄▄]],
              [[▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▄▄▄▄▄▄▄▄▄▄▄▄▄▀]],
              [[ ▀▄▄▄▄▄▄▄▄▄▄▄▀  ▀▄▄▄▄▄▄▄▄▄▄▄▀ ]],
              [[   ▀▀▀▀▀▀▀▀▀      ▀▀▀▀▀▀▀▀▀   ]],
            }

            dashboard.section.header.opts = {
              position = "center",
              hl = {
                { { "T2Afcfdfe", 10, 13 }, { "T2Aabd1e6", 13, 17 }, { "T2Aabd1e6f6fafc", 16, 18 }, { "T2A5ba5cef6fafc", 16, 20 }, { "T2A5ba5cec9e1ee", 19, 21 }, { "T2A54a2ccc9e1ee", 19, 23 }, { "T2A54a2ccb2d5e8", 22, 26 }, { "T2A54a2ccb3d5e8", 25, 29 }, { "T2A54a2cccee4f0", 28, 32 }, { "T2A54a2ccf8fbfc", 31, 33 }, { "T2A5da7cef8fbfc", 31, 34 }, { "T2Ab0d4e7", 34, 37 }, { "T2Afefefe", 37, 40 }},
                { { "T2Afcfdfe", 9, 11 }, { "T2Aa8cfe5fcfdfe", 9, 13 }, { "T2Aa8cfe57fb9d8", 12, 14 }, { "T2A54a2cc7fb9d8", 12, 16 }, { "T2A54a2cc54a2cc", 15, 23 }, { "T2A55a2cc54a2cc", 21, 26 }, { "T2A6eb0d354a2cc", 24, 32 }, { "T2A54a2cc54a2cc", 30, 40 }, { "T2A54a2cc88bedb", 39, 43 }, { "T2A54a2ccfefefe", 42, 44 }, { "T2Aacd1e6fefefe", 42, 45 }},
                { { "T2Afafcfd", 8, 10 }, { "T2Acae2effafcfd", 8, 12 }, { "T2Acae2ef5ca6ce", 11, 13 }, { "T2A54a2cc5ca6ce", 11, 15 }, { "T2A54a2cc54a2cc", 14, 19 }, { "T2A5da7ce54a2cc", 17, 21 }, { "T2A5da7ce78b5d6", 20, 22 }, { "T2Af5f9fc78b5d6", 20, 23 }, { "T2Aeaf3f8", 23, 26 }, { "T2Affffff", 26, 29 }, { "T2Affffff", 29, 32 }, { "T2Ae7f2f8", 32, 36 }, { "T2Ae7f2f881bad9", 35, 37 }, { "T2Afbfdfe81bad9", 35, 39 }, { "T2Afbfdfe54a2cc", 38, 40 }, { "T2A6baed354a2cc", 38, 43 }, { "T2A54a2cc54a2cc", 41, 45 }, { "T2A54a2cc5ba6ce", 44, 48 }, { "T2A54a2ccf3f8fb", 47, 49 }, { "T2Ab8d8eaf3f8fb", 47, 50 }},
                { { "T2Aa1cce3", 8, 10 }, { "T2A8abfdca1cce3", 8, 12 }, { "T2A8abfdc54a2cc", 11, 13 }, { "T2A54a2cc54a2cc", 11, 18 }, { "T2A54a2cc9bc8e1", 17, 19 }, { "T2Abfdcec9bc8e1", 17, 20 }, { "T2Ab2d5e8", 26, 28 }, { "T2Acde4f0b2d5e8", 26, 30 }, { "T2Acde4f054a2cc", 29, 31 }, { "T2A54a2cc54a2cc", 29, 36 }, { "T2A54a2cc8dc1dd", 35, 37 }, { "T2A75b4d68dc1dd", 35, 38 }, { "T2Affffff", 38, 41 }},
                { { "T2A7eb9d8", 8, 10 }, { "T2A83bbda7eb9d8", 8, 12 }, { "T2A83bbda54a2cc", 11, 13 }, { "T2A54a2cc54a2cc", 11, 18 }, { "T2A54a2ccc8e1ee", 17, 19 }, { "T2Ab9d8eac8e1ee", 17, 20 }, { "T2Acde3f0", 26, 28 }, { "T2Ab8d8eacde3f0", 26, 30 }, { "T2Ab8d8ea54a2cc", 29, 31 }, { "T2A54a2cc54a2cc", 29, 36 }, { "T2A54a2cc6baed2", 35, 37 }, { "T2A74b3d56baed2", 35, 39 }, { "T2A74b3d5ffffff", 38, 40 }, { "T2Affffffffffff", 38, 41 }},
                { { "T2Aa1cce3", 8, 10 }, { "T2Ad1e6f1a1cce3", 8, 12 }, { "T2Ad1e6f154a2cc", 11, 13 }, { "T2A54a2cc54a2cc", 11, 18 }, { "T2A54a2cc96c6df", 17, 19 }, { "T2A68acd296c6df", 17, 20 }, { "T2Affffff", 20, 23 }, { "T2Aa7cfe5", 28, 30 }, { "T2Affffffa7cfe5", 28, 32 }, { "T2Affffff60a8cf", 31, 35 }, { "T2Affffff54a2cc", 34, 36 }, { "T2Af8fbfd54a2cc", 34, 38 }, { "T2Af8fbfd93c4de", 37, 39 }, { "T2Af3f8fb93c4de", 37, 40 }},
                { { "T2Afefefd", 4, 7 }, { "T2Af7dfb3", 7, 11 }, { "T2Af7dfb3ffffff", 10, 12 }, { "T2Af0bd63ffffff", 10, 14 }, { "T2Af0bd63fefdfb", 13, 15 }, { "T2Af2c576fefdfb", 13, 17 }, { "T2Af2c576fdfefe", 16, 18 }, { "T2Afffffffdfefe", 16, 20 }, { "T2Affffff60a8cf", 19, 21 }, { "T2Aa8cfe560a8cf", 19, 23 }, { "T2Aa8cfe554a2cc", 22, 24 }, { "T2A54a2cc54a2cc", 22, 29 }, { "T2A54a2ccdfedf5", 28, 30 }, { "T2A95c5dfdfedf5", 28, 31 }, { "T2Ad0d0d0", 32, 34 }, { "T2Ae9e9e9d0d0d0", 32, 36 }, { "T2Ae9e9e9a9aaaa", 35, 37 }, { "T2A8a8b8ba9aaaa", 35, 39 }, { "T2A8a8b8babacac", 38, 42 }, { "T2A8a8b8baeafaf", 41, 45 }, { "T2A8a8b8bb4b5b5", 44, 48 }, { "T2A8a8b8bbdbebe", 47, 51 }, { "T2A8a8b8bcacaca", 50, 54 }, { "T2A8a8b8bdbdbdb", 53, 57 }, { "T2A8a8b8bf4f4f4", 56, 60 }, { "T2A8a8b8bffffff", 59, 61 }, { "T2A9b9c9cffffff", 59, 62 }, { "T2Acdcdcd", 62, 65 }, { "T2Afdfdfd", 65, 68 }},
                { { "T2Afbeed8", 2, 6 }, { "T2Afbeed8fcf4e6", 5, 7 }, { "T2Aeeb551fcf4e6", 5, 9 }, { "T2Aeeb551f1c370", 8, 10 }, { "T2Aeeb248f1c370", 8, 12 }, { "T2Aeeb248eeb248", 11, 21 }, { "T2Aeeb248fcf4e6", 20, 22 }, { "T2Af5d59bfcf4e6", 20, 24 }, { "T2Af5d59bf0f7fa", 23, 25 }, { "T2Afffffff0f7fa", 23, 27 }, { "T2Affffff57a3cc", 26, 28 }, { "T2A9dcae257a3cc", 26, 30 }, { "T2A9dcae254a2cc", 29, 31 }, { "T2A54a2cc54a2cc", 29, 33 }, { "T2A54a2cc58a4cd", 32, 36 }, { "T2A54a2ccf3f8fb", 35, 37 }, { "T2A9fcbe2f3f8fb", 35, 38 }, { "T2Affffff", 38, 42 }, { "T2Affffffa5a5a5", 41, 43 }, { "T2Afefefea5a5a5", 41, 45 }, { "T2Afefefe8a8b8b", 44, 46 }, { "T2Afcfcfc8a8b8b", 44, 49 }, { "T2Af5f5f58a8b8b", 47, 52 }, { "T2Aeaeaea8a8b8b", 50, 55 }, { "T2Ad9d9d98a8b8b", 53, 58 }, { "T2Ac1c2c28a8b8b", 56, 61 }, { "T2Aa4a5a58a8b8b", 59, 64 }, { "T2A8a8b8b8a8b8b", 62, 72 }, { "T2A8a8b8ba4a4a4", 71, 75 }, { "T2A8a8b8bf2f2f2", 74, 76 }, { "T2A919292f2f2f2", 74, 77 }, { "T2Ae4e4e4", 77, 80 }},
                { { "T2Affffff", 0, 4 }, { "T2Afffffffdf6eb", 3, 5 }, { "T2Af3cb84fdf6eb", 3, 7 }, { "T2Af3cb84eeb652", 6, 8 }, { "T2Aeeb248eeb652", 6, 10 }, { "T2Aeeb248eeb248", 9, 14 }, { "T2Aeeb550eeb248", 12, 16 }, { "T2Aeeb550eeb249", 15, 17 }, { "T2Afaebd1eeb249", 15, 18 }, { "T2Af4cf8f", 18, 21 }, { "T2Afcf1df", 21, 24 }, { "T2Affffff", 24, 27 }, { "T2Af3f8fb", 28, 32 }, { "T2Af3f8fb60a8cf", 31, 33 }, { "T2Ab3d5e860a8cf", 31, 35 }, { "T2Ab3d5e854a2cc", 34, 36 }, { "T2A59a4cd54a2cc", 34, 38 }, { "T2A59a4cd7fb9d9", 37, 39 }, { "T2Ae6f1f77fb9d9", 37, 41 }, { "T2Ae6f1f7ffffff", 40, 42 }, { "T2Afefefeffffff", 40, 44 }, { "T2Afefefefdf9f3", 43, 45 }, { "T2Af1c06bfdf9f3", 43, 47 }, { "T2Af1c06bfdf6ea", 46, 48 }, { "T2Aeeb248fdf6ea", 46, 50 }, { "T2Aeeb248fefdfa", 49, 51 }, { "T2Aeeb24afefdfa", 49, 53 }, { "T2Aeeb24affffff", 52, 54 }, { "T2Af9e7c8ffffff", 52, 55 }, { "T2Affffff", 57, 60 }, { "T2Af5f5f5", 60, 63 }, { "T2Abebebe", 63, 67 }, { "T2Abebebe8c8d8d", 66, 68 }, { "T2Ae4e4e48c8d8d", 66, 70 }, { "T2Ae4e4e48a8b8b", 69, 71 }, { "T2A8f90908a8b8b", 69, 74 }, { "T2A8a8b8b8a8b8b", 72, 76 }, { "T2A8a8b8b8e8f8f", 75, 79 }, { "T2A8a8b8bededed", 78, 80 }, { "T2Aa5a6a6ededed", 78, 81 }, { "T2Affffff", 81, 84 }},
                { { "T2Afcf4e6", 0, 2 }, { "T2Af8e1b8fcf4e6", 0, 4 }, { "T2Af8e1b8eeb248", 3, 5 }, { "T2Aeeb248eeb248", 3, 11 }, { "T2Af0bc61eeb248", 9, 13 }, { "T2Af0bc61fae8c9", 12, 14 }, { "T2Afffffffae8c9", 12, 15 }, { "T2Afcfdfe", 21, 24 }, { "T2Ad1e6f1", 24, 27 }, { "T2Afbedd5", 27, 31 }, { "T2Afbedd5f7dcad", 30, 32 }, { "T2Aeeb34bf7dcad", 30, 34 }, { "T2Aeeb34beeb248", 33, 35 }, { "T2Aeeb248eeb248", 33, 38 }, { "T2Aeeb34aeeb248", 36, 40 }, { "T2Aeeb34af1c06b", 39, 41 }, { "T2Afbf0dcf1c06b", 39, 42 }, { "T2Afefefe", 42, 45 }, { "T2Adcdcdc", 51, 53 }, { "T2Affffffdcdcdc", 51, 55 }, { "T2Affffff8a8b8b", 54, 56 }, { "T2A999a9a8a8b8b", 54, 59 }, { "T2A8a8b8b8a8b8b", 57, 64 }, { "T2A8a8b8be9e9e9", 63, 65 }, { "T2Acacacae9e9e9", 63, 66 }},
                { { "T2Af7dbab", 0, 2 }, { "T2Af8e2bcf7dbab", 0, 4 }, { "T2Af8e2bceeb248", 3, 5 }, { "T2Aeeb248eeb248", 3, 10 }, { "T2Aeeb248f1c26f", 9, 11 }, { "T2Aeeb54ff1c26f", 9, 13 }, { "T2Aeeb54fffffff", 12, 14 }, { "T2Afefbf6ffffff", 12, 15 }, { "T2Afdf9f2", 21, 25 }, { "T2Afdf9f2fdf6eb", 24, 26 }, { "T2Af0be66fdf6eb", 24, 28 }, { "T2Af0be66efb756", 27, 29 }, { "T2Aeeb248efb756", 27, 31 }, { "T2Aeeb248eeb248", 30, 35 }, { "T2Af0bd62eeb248", 33, 37 }, { "T2Af0bd62f6d8a3", 36, 38 }, { "T2Afefdfbf6d8a3", 36, 39 }, { "T2Af6f6f6", 39, 42 }, { "T2Aeeeeee", 42, 45 }, { "T2Afcfcfc", 51, 55 }, { "T2Afcfcfca5a6a6", 54, 56 }, { "T2A909191a5a6a6", 54, 58 }, { "T2A9091918a8b8b", 57, 59 }, { "T2A8a8b8b8a8b8b", 57, 64 }, { "T2A8a8b8bc1c2c2", 63, 65 }, { "T2Acececec1c2c2", 63, 66 }},
                { { "T2Afdf6eb", 0, 4 }, { "T2Afdf6ebeeb249", 3, 5 }, { "T2Af4cd89eeb249", 3, 7 }, { "T2Af4cd89eeb248", 6, 8 }, { "T2Aeeb248eeb248", 6, 13 }, { "T2Aeeb248f5d396", 12, 15 }, { "T2Af4d08f", 15, 18 }, { "T2Afcf1df", 18, 21 }, { "T2Afdf7ed", 21, 24 }, { "T2Afaeacd", 24, 27 }, { "T2Af3cc87", 27, 31 }, { "T2Af3cc87fbeed8", 30, 32 }, { "T2Aeeb248fbeed8", 30, 34 }, { "T2Aeeb248f0bb5e", 33, 37 }, { "T2Aeeb248eeb248", 36, 41 }, { "T2Aeeb249eeb248", 39, 43 }, { "T2Aeeb249eeb34c", 42, 44 }, { "T2Af9e5c2eeb34c", 42, 45 }, { "T2Afcf2e0", 45, 49 }, { "T2Afcf2e0fefefe", 48, 50 }, { "T2Ac7c8c8fefefe", 48, 52 }, { "T2Ac7c8c8adaeae", 51, 53 }, { "T2A8a8b8badaeae", 51, 55 }, { "T2A8a8b8b909191", 54, 58 }, { "T2A8a8b8bdedede", 57, 60 }, { "T2Ab1b1b1", 60, 63 }, { "T2Ae2e3e3", 63, 66 }, { "T2Af9f9f9", 66, 69 }, { "T2Aededed", 69, 72 }, { "T2Ab9baba", 72, 76 }, { "T2Ab9babac2c3c3", 75, 77 }, { "T2A8a8b8bc2c3c3", 75, 79 }, { "T2A8a8b8b8a8b8b", 78, 86 }, { "T2Aabacac8a8b8b", 84, 87 }, { "T2Aefefef", 87, 90 }},
                { { "T2Afdf7ec", 1, 5 }, { "T2Afdf7eceeb652", 4, 6 }, { "T2Afbeed8eeb652", 4, 8 }, { "T2Afbeed8eeb248", 7, 9 }, { "T2Aefb653eeb248", 7, 12 }, { "T2Aeeb248eeb248", 10, 33 }, { "T2Af1c26eeeb248", 31, 35 }, { "T2Af1c26eeeb249", 34, 36 }, { "T2Afbefdbeeb249", 34, 37 }, { "T2Af8e2bb", 37, 40 }, { "T2Ad2d3d3", 42, 46 }, { "T2Ad2d3d38c8d8d", 45, 47 }, { "T2Aeaeaea8c8d8d", 45, 49 }, { "T2Aeaeaea8a8b8b", 48, 50 }, { "T2Aa1a2a28a8b8b", 48, 53 }, { "T2A8a8b8b8a8b8b", 51, 74 }, { "T2A9596968a8b8b", 72, 76 }, { "T2A9596968f9090", 75, 77 }, { "T2Ae6e6e68f9090", 75, 78 }, { "T2Aefefef", 78, 81 }},
                { { "T2Afdf8f0", 3, 6 }, { "T2Af5d59b", 6, 9 }, { "T2Aefb95a", 9, 12 }, { "T2Aeeb248", 12, 15 }, { "T2Aeeb248", 15, 18 }, { "T2Af0bb5d", 18, 21 }, { "T2Af4d091", 21, 24 }, { "T2Afbefda", 24, 27 }, { "T2Affffff", 27, 30 }, { "T2Affffff", 36, 39 }, { "T2Ae2e3e3", 39, 42 }, { "T2Ab5b5b5", 42, 45 }, { "T2A979898", 45, 48 }, { "T2A8a8b8b", 48, 51 }, { "T2A8a8b8b", 51, 54 }, { "T2A9a9b9b", 54, 57 }, { "T2Ac4c4c4", 57, 60 }, { "T2Af9f9f9", 60, 63 }},
          
              }
            }

            dashboard.section.buttons.val = {
              dashboard.button("n", "  New file", ":ene | startinsert<CR>"),
              dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
              dashboard.button("g", "  Live grep", ":Telescope live_grep<CR>"),
              dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
              dashboard.button("m", "  Bookmarks", ":Telescope marks<CR>"),
              dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
              dashboard.button("q", "  Quit", ":qa<CR>")
            }

            dashboard.section.footer.val = {"Kartoza NeoVim."}

            dashboard.config.layout = {
              {type = "padding", val = 0},
              dashboard.section.header,
              {type = "padding", val = 0},
              {
                type = "group",
                val = dashboard.section.buttons.val,
                opts = {
                  position = "center",
                  spacing = 0
                }
              },
              { type = "padding", val = 0},
              dashboard.section.footer,
            }

            dashboard.opts.opts.noautocmd = true
            alpha.setup(dashboard.opts)
    '';
  };
}
