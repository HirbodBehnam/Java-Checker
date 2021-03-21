# Java Checker
A small script to check a java program against some test cases

## How to use
**Note:** If you get `execution of scripts is disabled on this system` in powershell, try [this](https://stackoverflow.com/a/4038991/4213397) solution.
### Testing
1. Place all of your source files in `src` folder. Please note that your code must note that your code must have a `Main.java` file which is not in a package.
2. Run checker.sh or checker.ps1 according to your operating system.
3. The script will check your source code against the available test cases. If anything is different, it will print save the output in `out-diff` folder.
### Generating tests
1. Place all of your source files in `src` folder. Please note that your code must note that your code must have a `Main.java` file which is not in a package.
2. Create files with order like `in1.txt`, `in2.txt` ... `in10.txt`, ... in the folder `in`.
3. Run generator.sh or generator.ps1 according to your operating system.
4. Output of your program will be saved in `out` folder.
5. Share the `in` and `out` folder and these scripts with anyone you like.
