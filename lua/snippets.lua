-- Block default snippets
local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load = function() end

-- Add this to your Neovim config (usually ~/.config/nvim/lua/snippets.lua)
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  -- Preprocessor headers
  s("prep", {
    t("#include <iostream>"),
    t({"", "#include <string>"}),
    t({"", "#include <vector>"}),
    t({"", "using std::cout, std::cin, std::endl, std::getline, std::string, std::vector;"}),
    t({"", ""}),
    i(0)
  }),
  
  -- Main function
  s("mainn", {
    t("int main()"),
    t({"", "{"}),
    t({"", "\t"}), i(0),
    t({"", "\treturn 0;"}),
    t({"", "}"})
  }),
  
  -- For loop
  s("forr", {
    t("for (int i = 0; i < "), i(1), t("; i++)"),
    t({"", "{"}),
    t({"", "\t"}), i(0),
    t({"", "}"})
  }),
  
  -- While loop
  s("whilee", {
    t("while ("), i(1), t(")"),
    t({"", "{"}),
    t({"", "\t"}), i(0),
    t({"", "}"})
  })
})
