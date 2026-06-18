import 'dart:collection';

void main()
{
  Map<String, int> countryDialingCode = {         // Method 1: Using Literal
    "USA": 1,
    "INDIA": 91,
    "PAKISTAN": 92
  };

  Map<String, String> fruits = Map();             // Method 2: Using Constructor
  fruits["apple"] = "red";
  fruits["banana"] = "yellow";
  fruits["guava"]  = "green";

  print(fruits.containsKey("apple"));                        // returns true if the KEY is present in Map
  print(fruits.update("apple", (value) => "green"));         // Update the VALUE for the given KEY
  print(fruits.remove("apple"));                             // removes KEY and it's VALUE and returns the VALUE
  print(fruits.isEmpty);                                     // returns true if the Map is empty
  print(fruits.length);                                      // returns number of elements in Map
//	fruits.clear();                                     // Deletes all elements

  print(fruits["apple"]);

  for (String value in fruits.values) {           // Print all values
    print(value);
  }


}


