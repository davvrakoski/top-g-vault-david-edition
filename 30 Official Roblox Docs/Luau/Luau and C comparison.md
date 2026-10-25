---
title: "Luau and C# comparison"
description: "Explains the similarities and differences between the C# and Luau programming languages."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau/luau-csharp-comparison"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the similarities and differences between the C# and Luau programming languages.*

Roblox uses the Luau programming language. The following code samples and tables indicate some of the differences between syntaxes for C# and Luau.

## Line endings

You don't need semicolons in Luau, but they don't break the syntax.

## Reserved keywords

The following table has Luau's reserved keywords mapped to their C# equivalent. Note it doesn't show all C# keywords.

| Luau | C# |
| --- | --- |
| `and` |  |
| `break` | `break` |
| `do` | `do` |
| `if` | `if` |
| `else` | `else` |
| `elseif` | `else if` |
| `then` |  |
| `end` |  |
| `true` | `true` |
| `false` | `false` |
| `for` | `for` or `foreach` |
| `function` |  |
| `in` | `in` |
| `local` |  |
| `nil` | `null` |
| `not` |  |
| `or` |  |
| `repeat` |  |
| `return` | `return` |
| `until` |  |
| `while` | `while` |

## Comments

```lua title="Comments in Luau"
-- Single line comment

--[[ Resulting output:
	Block comment
--]]
```

```cs title="Comments in C#"
// Single line comment

/*
	Block comment
*/
```

## Strings

```lua title="Strings in Luau"
-- Multi-line string
local multiLineString = [[This is a string that,
when printed, appears
on multiple lines]]

-- Concatenation
local s1 = "This is a string "
local s2 = "made with two parts."
local endString = s1 .. s2
```

```cs title="Strings in C#"
// Multi-line string
string multiLineString1 = "This is a string that,\nwhen printed, appears\n on multiple lines.";

string multiLineString2 = @"This is a string that,
when printed, appears
on multiple lines";

// Concatenation
string s1 = "This is a string ";
string s2 = "made with two parts.";
string endString = s1 + s2;
```

## Tables

To learn more about tables in Luau, see [[30 Official Roblox Docs/Luau/Tables|Tables]].

### Dictionary tables

You can use tables in Luau as dictionaries just like in C#.

```lua title="Dictionary Tables in Luau"
local dictionary = {
	val1 = "this",
	val2 = "is"
}

print(dictionary.val1)  -- Outputs 'this'
print(dictionary["val1"])  -- Outputs 'this'

dictionary.val1 = nil  -- Removes 'val1' from table
dictionary["val3"] = "a dictionary"  -- Overwrites 'val3' or sets new key-value pair
```

```cs title="Dictionary Tables in C#"
Dictionary dictionary = new Dictionary()
{
	{ "val1", "this" },
	{ "val2", "is" }
};

Console.WriteLine(dictionary["val1"]);  // Outputs 'this'
dictionary.Remove("val1");  // Removes 'val1' from dictionary

dictionary["val3"] = "a dictionary";  // Overwrites 'val3' or sets new key-value pair
dictionary.Add("val3", "a dictionary");  // Creates a new key-value pair
```

### Numerically-indexed tables

You can use tables in Luau as arrays just like in C#. Indices start at `1` in Luau and `0` in C#.

```lua title="Numerically-Indexed Tables in Luau"
local npcAttributes = {"strong", "intelligent"}

print(npcAttributes[1])  -- Outputs 'strong'
print(#npcAttributes)  -- Outputs the size of the list

-- Append to the list
table.insert(npcAttributes, "humble")
-- Another way...
npcAttributes[#npcAttributes+1] = "humble"

-- Insert at the beginning of the list
table.insert(npcAttributes, 1, "brave")

-- Remove item at a given index
table.remove(npcAttributes, 3)
```

```cs title="Numerically-Indexed Tables in C#"
List npcAttributes = new List{"strong", "intelligent"};

Console.WriteLine(npcAttributes[0]);  // Outputs 'strong'
Console.WriteLine(npcAttributes.Count);  // Outputs the size of the list

// Append to the list
npcAttributes.Add("humble");
// Another way...
npcAttributes.Insert(npcAttributes.Count, "humble");

// Insert at the beginning of the list
npcAttributes.Insert(0, "brave");

// Remove item at a given index
npcAttributes.Remove(2);
```

## Operators

### Conditional operators

| Operator | Luau | C# |
| --- | --- | --- |
| Equal To | `==` | `==` |
| Greater Than | `>` | `>` |
| Less Than | `<` | `<` |
| Greater Than or Equal To | `>=` | `>=` |
| Less Than or Equal To | `<=` | `<=` |
| Not Equal To | `~=` | `!=` |
| And | `and` | `&&` |
| Or | `or` | `\|\|` |

### Arithmetic operators

|  | Luau | C# |
| --- | --- | --- |
| Addition | `+` | `+` |
| Subtraction | `-` | `-` |
| Multiplication | `*` | `*` |
| Division | `/` | `/` |
| Modulus | `%` | `%` |
| Exponentiation | `^` | `**` |

## Variables

In Luau, variables don't specify their type when you declare them. Luau variables don't have access modifiers, although you may prefix "private" variables with an underscore for readability.

```lua title="Variables in Luau"
local stringVariable = "value"

-- "Public" declaration
local variableName

-- "Private" declaration - parsed the same way
local _variableName
```

```cs title="Variables in C#"
string stringVariable = "value";

// Public declaration
public string variableName

// Private declaration
string variableName;
```

## Scope

In Luau, you can write variables and logic in a tighter scope than their function or class by nesting the logic within `do` and `end` keywords, similar to curly brackets `{}` in C#. For more details, see [[30 Official Roblox Docs/Luau/Scope|Scope]].

```lua title="Scoping in Luau"
local outerVar = 'Outer scope text'

do
    -- Modify 'outerVar'
    outerVar = 'Inner scope modified text'
    -- Introduce a local variable
    local innerVar = 'Inner scope text'
    print('1: ' .. outerVar)    -- prints "1: Inner scope modified text"
    print('2: ' .. innerVar)    -- prints "2: Inner scope text"
end

print('3: ' .. outerVar)        -- prints "3: "Inner scope modified text"
-- Attempting to print 'innerVar' here would fail
```

```cs title="Scoping in C#"
var outerVar = "Outer scope text";

{
	// Modify 'outerVar'
	outerVar = "Inner scope modified text";
	// Introduce a local variable
	var innerVar = "Inner scope text";
	Console.WriteLine("1: " + outerVar);    // prints "1: Inner scope modified text"
	Console.WriteLine("2: " + innerVar);    // prints "2: Inner scope text"
}

Console.WriteLine("3: " + outerVar);		// prints "3: "Inner scope modified text"
// Attempting to print 'innerVar' here would fail
```

## Conditional statements

```lua title="Conditional Statements in Luau"
-- One condition
if boolExpression then
	doSomething()
end

-- Multiple conditions
if not boolExpression then
	doSomething()
elseif otherBoolExpression then
	doSomething()
else
	doSomething()
end
```

```cs title="Conditional Statements in C#"
// One condition
if (boolExpression) {
	doSomething();
}


// Multiple conditions
if (!boolExpression) {
	doSomething();
}
else if (otherBoolExpression) {
	doSomething();
}
else {
	doSomething();
}
```

### Conditional operator

```lua title="Conditional Operator in Luau"
local max = if x > y then x else y
```

```cs title="Conditional Operator in C#"
int max = (x > y) ? x : y;
```

## Loops

To learn more about loops in Luau, see [[30 Official Roblox Docs/Luau/Control structures|Control Structures]].

### While and repeat loops

```lua title="While and Repeat Loops in Luau"
while boolExpression do
	doSomething()
end

repeat
	doSomething()
until not boolExpression
```

```cs title="While and Repeat Loops in C#"
while (boolExpression) {
	doSomething();
}

do {
	doSomething();
} while (boolExpression)
```

### For loops

```lua title="Generic For Loops in Luau"
-- Forward loop
for i = 1, 10 do
	doSomething()
end

-- Reverse loop
for i = 10, 1, -1 do
	doSomething()
end
```

```cs title="Generic For Loops in C#"
// Forward loop
for (int i = 1; i <= 10; i++) {
	doSomething();
}

// Reverse loop
for (int i = 10; i >= 1; i--) {
	doSomething();
}
```

```lua title="For Loops Over Tables in Luau"
local abcList = {"a", "b", "c"}

for i, v in ipairs(abcList) do
	print(v)
end

local abcDictionary = { a=1, b=2, c=3 }

for k, v in pairs(abcDictionary) do
	print(k, v)
end
```

```cs title="For Loops Over Lists in C#"
List<string> abcList = new List<string>{"a", "b", "c"};

foreach (string v in abcList) {
	Console.WriteLine(v);
}

Dictionary<string, int> abcDictionary = new Dictionary<string, int>
{ {"a", 1}, {"b", 2}, {"c", 3} };


foreach (KeyValuePair<string, int> entry in abcDictionary) {
	Console.WriteLine(entry.Key + " " + entry.Value);
}
```

Luau also supports [[30 Official Roblox Docs/Luau/Control structures#Generalized iteration|generalized iteration]], which further simplifies working with tables.

## Functions

To learn more about functions in Luau, see [[30 Official Roblox Docs/Luau/Functions|Functions]].

### Generic functions

```lua title="Generic Functions in Luau"
-- Generic function
local function increment(number)
	return number + 1
end
```

```cs title="Generic Functions in C#"
// Generic function
int increment(int number) {
	return number + 1;
}
```

### Variable argument number

```lua title="Variable Argument Number in Luau"
-- Variable argument number
local function variableArguments(...)
	print(...)
end
```

```cs title="Variable Argument Number in C#"
// Variable argument number
void variableArguments(params string[] inventoryItems) {
	for (item in inventoryItems) {
		Console.WriteLine(item);
	}
}
```

### Named arguments

```lua title="Named Arguments in Luau"
-- Named arguments
local function namedArguments(args)
	return args.name .. "'s birthday: " .. args.dob
end

namedArguments{name="Bob", dob="4/1/2000"}
```

```cs title="Named Arguments in C#"
// Named arguments
string namedArguments(string name, string dob) {
	return name + "'s birthday: " + dob;
}

namedArguments(name: "Bob", dob: "4/1/2000");
```

## Try-catch structures

```lua title="Try/Catch Structures in Luau"
local function fireWeapon()
	if not weaponEquipped then
		error("No weapon equipped!")
	end
	-- Proceed...
end

local success, errorMessage = pcall(fireWeapon)
if not success then
	print(errorMessage)
end
```

```cs title="Try/Catch Structures in C#"
void fireWeapon() {
	if (!weaponEquipped) {
		// Use a user-defined exception
		throw new InvalidWeaponException("No weapon equipped!");
	}
	// Proceed...
}

try {
	fireWeapon();
} catch (InvalidWeaponException ex) {
	// An error was raised
}
```

---
*Source: [Luau and C# comparison](https://create.roblox.com/docs/luau/luau-csharp-comparison) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
