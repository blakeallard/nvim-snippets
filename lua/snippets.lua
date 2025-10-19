-- Block default snippets
local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load = function() end

-- Initialize LuaSnip essentials
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- ===========================
--     CS1D C++ SNIPPETS
-- ===========================
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
  }),

  -- If Else
  s("ifelse", fmt([[
if ({})
{{
    {}
}}
else if ({})
{{
    {}
}}
else
{{
    {}
}}
]], { i(1, "condition"), i(2), i(3, "otherCondition"), i(4), i(5) })),

  -- Switch
  s("switchh", fmt([[
switch ({})
{{
    case 1:
    {{
        break;
    }}
    case 2:
    {{
        break;
    }}
    default:
    {{
        break;
    }}
}
]], { i(1, "choice") })),

  -- Function
  s("func", fmt([[
int {}(int {})
{{
    {}
    return 0;
}}
]], { i(1, "ExampleFunction"), i(2, "value"), i(0) })),

  -- Validation
  s("validate", fmt([[
int {} = 0;
bool {} = false;

do
{{
    cout << "Enter a value: ";
    if (!(cin >> {}))
    {{
        cout << "ERROR: Invalid input type." << endl;
        cin.clear();
        cin.ignore(10000, '\\n');
    }}
    else if (false)
    {{
        cout << "ERROR: Input did not meet validation criteria." << endl;
    }}
    else
    {{
        {} = true;
    }}
}}
while (!{});
]], { i(1, "value"), i(2, "isValid"), i(3, "value"), i(4, "isValid"), i(5, "isValid") })),

  -- Try Catch
  s("trycatch", fmt([[
try
{{
    {}
}}
catch (...)
{{
    cout << "An error occurred." << endl;
}}
]], { i(0) })),

  -- File I/O
  s("fileio", fmt([[
#include <fstream>
#include <string>

std::ifstream inputFile("input.txt");
std::ofstream outputFile("output.txt");
std::string line;

while (getline(inputFile, line))
{{
    outputFile << line << std::endl;
}}

inputFile.close();
outputFile.close();
]], {})),

  -- Class Definition
  s("classdef", fmt([[
class {}
{{
private:
    int id;
    std::string name;

public:
    {}()
    {{
        id = 0;
        name = "Undefined";
    }}

    {}(int newId, const std::string &newName)
    {{
        id = newId;
        name = newName;
    }}

    void SetId(int newId)
    {{
        id = newId;
    }}

    void SetName(const std::string &newName)
    {{
        name = newName;
    }}

    int GetId() const
    {{
        return id;
    }}

    std::string GetName() const
    {{
        return name;
    }}

    void Display() const
    {{
        std::cout << "ID: " << id << ", Name: " << name << std::endl;
    }}
}};
]], { i(1, "Example"), i(2, "Example"), i(3, "Example") })),

  -- Template Function
  s("templatefunc", fmt([[
template <typename T>
T AddValues(T a, T b)
{{
    return a + b;
}}
]], {})),

  -- Struct
  s("structdef", fmt([[
struct {}
{{
    int id;
    std::string name;
    double value;
}};
]], { i(1, "Example") })),
})

-- ===========================
--     COMMENT BLOCK SNIPPETS
-- ===========================
ls.add_snippets("cpp", {
  s("headerblk", t({
    "/*******************************************************************************",
    " *  AUTHOR        :  Blake Allard",
    " *  CLASS         :  CS1D",
    " *  PROFESSOR     :  ",
    " *  ASSIGNMENT    :  ",
    " *******************************************************************************/",
  })),

  s("progdesc", t({
    "/*******************************************************************************",
    " *  PROGRAM DESCRIPTION",
    " *  ---------------------------------------------------------------------------",
    " *  Briefly describe the purpose of this program, what it accomplishes,",
    " *  and any relevant background information.",
    " *******************************************************************************/",
  })),

  s("constblk", t({
    "/***************************************************************************",
    " *  CONSTANTS",
    " *  -----------------------------------------------------------------------",
    " *  Declare all global or program-wide constant values.",
    " ***************************************************************************/",
  })),

  s("vardecblk", t({
    "/***************************************************************************",
    " *  VARIABLE DECLARATIONS",
    " *  -----------------------------------------------------------------------",
    " *  Declare and initialize all variables here.",
    " ***************************************************************************/",
  })),

  s("inputblk", t({
    "/***************************************************************************",
    " *  INPUT",
    " *  -----------------------------------------------------------------------",
    " *  Prompt the user for input and gather data.",
    " ***************************************************************************/",
  })),

  s("processblk", t({
    "/***************************************************************************",
    " *  PROCESSING",
    " *  -----------------------------------------------------------------------",
    " *  Perform calculations, checks, or core program logic.",
    " ***************************************************************************/",
  })),

  s("outputblk", t({
    "/***************************************************************************",
    " *  OUTPUT",
    " *  -----------------------------------------------------------------------",
    " *  Display results to the user.",
    " ***************************************************************************/",
  })),

  s("funproto", t({
    "/***************************************************************************",
    " *  FUNCTION PROTOTYPES",
    " *  -----------------------------------------------------------------------",
    " *  Declare all function prototypes above main().",
    " ***************************************************************************/",
  })),

  s("fundefblk", t({
    "/***************************************************************************",
    " *  FUNCTION DEFINITIONS",
    " *  -----------------------------------------------------------------------",
    " *  Define all functions below main().",
    " ***************************************************************************/",
  })),

  s("classblk", t({
    "/***************************************************************************",
    " *  CLASS DEFINITIONS",
    " *  -----------------------------------------------------------------------",
    " *  Define class declarations, constructors, and member functions.",
    " ***************************************************************************/",
  })),

  s("structblk", t({
    "/***************************************************************************",
    " *  STRUCT DEFINITIONS",
    " *  -----------------------------------------------------------------------",
    " *  Define all struct types used throughout the program.",
    " ***************************************************************************/",
  })),
})
