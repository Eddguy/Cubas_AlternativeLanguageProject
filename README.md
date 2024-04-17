# Cubas_AlternativeLanguageProject

This project aims at learning a new programming language and shows proficiency by writing a program to data clean a .csv file.

## Which programming language and version did you pick?

I picked R v4.3.2.

## Why did you pick this programming language?

I chose R because I found a website that offered free courses teaching R and its application in data science.

## How your programming language chosen handles:

- **Object-oriented programming**: R handles OOP differently than other languages. For example, there is no inherent private members, but you can simulate private members using a period (`.`) in the variable name (e.g., `.privatemember`). As such, there is no need for getter or setter functions, and you can access members directly.
  
- **File ingestion**: R is fantastic for representing and manipulating data, so it handles file ingestion very easily.

- **Conditional statements**: R supports `if-else` and `switch` statements. `if-else` conditionals work like traditional statements in other languages, but `switch` statements do not require `break` statements, relying instead on commas to act as breaks.

- **Assignment statements**: R has two assignment statements: `<-` and `=`, with the former being the most common approach.

- **Loops**: R supports both `for` and `while` loops, as well as `repeat` loops. A repeat loop serves as an infinite loop until a `break` statement is made.

- **Subprograms (functions/methods)**: R supports functions and methods. R allows user-defined and anonymous functions, and has an extensive built-in library for functions. Methods are used to manipulate members of a class.

- **Unit testing**: R has many libraries that support unit testing, such as `RUtest` and `tinytest`.

- **Exception handling**: R supports exception handling through `try()`, `tryCatch()`, and `withCallingHandlers()`. `try()` allows for simple try-and-response methods, while `tryCatch()` offers more robust exception handling, allowing you to customize the function to your needs. `withCallingHandlers()` is similar to `tryCatch()` but allows specific condition handling, such as warnings.

## List out 3 libraries you used from your programming language (if applicable) and explain what they are, why you chose them, and what you used them for.

- **dplyr**: This package provides powerful data manipulation functions and is very popular in R. Specifically, this project uses the `mutate()` function from `dplyr` to convert data types.

## Answer the following questions (and provide a corresponding screen showing output answering them):

- **What company (oem) has the highest average weight of the phone body?**
![Question 1](https://github.com/Eddguy/Cubas_AlternativeLanguageProject/blob/main/images/Q1.png)
- **Was there any phones that were announced in one year and released in another? What are they? Give me the oem and models.**
![Question 2](https://github.com/Eddguy/Cubas_AlternativeLanguageProject/blob/main/images/Q2.png)
- **How many phones have only one feature sensor?**
![Question 3](https://github.com/Eddguy/Cubas_AlternativeLanguageProject/blob/main/images/Q3.png)
- **What year had the most phones launched in any year later than 1999?**
- ![Question 4](https://github.com/Eddguy/Cubas_AlternativeLanguageProject/blob/main/images/Q4.png)
