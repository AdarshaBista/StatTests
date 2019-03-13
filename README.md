# Stat Tests

App to calculate statistical tests for testing random numbers. The following 5 tests are included:

- Chi Square Test
- Kolmogorov Smirnov Test
- Gap Test
- Auto Correlation Test
- Poker Test

## Getting Started

Please refer to the official documentation for getting started with flutter. You can find it [here](https://flutter.dev/docs/get-started/install).

## Built With

- [Flutter](https://flutter.dev)

## How to use the app

After installing the app, you will see a tabbed layout of the available tests. Choose a test and input the required fields. The input fields vary according to the tests but two common fields are:

- `Enter space separated Numbers` - Enter the random numbers to be tested in this field. Each number should be separated by a space.

- `Enter division factor` - The division factor divides each number from the above input field. Let us consider the numbers `0.12 0.45 0.34 0.9 0.77`. Instead of typing the numbers as is, we type `12 45 34 90 77` in the numbers input field. Then we give `100` as division factor. Each number is then divided by `100` which is the same as typing `0.12 0.45 0.34 0.9 0.77`. This saves a lot of time when there are many numbers to be tested. The division factor can be an integer or a float and either positive or negative but not zero.