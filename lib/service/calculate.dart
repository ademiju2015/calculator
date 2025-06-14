// A service class that provides basic calculator operations.
import 'dart:math';

class CalculatorService {
  // Adds two numbers and returns the result.
  static double add(double a, double b) {
    return a + b;
  }

  // Subtracts the second number from the first and returns the result.
  static double subtract(double a, double b) {
    return a - b;
  }

  // Multiplies two numbers and returns the result.
  static double multiply(double a, double b) {
    return a * b;
  }

  // Divides the first number by the second and returns the result.
  // Throws an exception if division by zero is attempted.
  static double divide(double a, double b) {
    if (b == 0) {
      throw Exception("Division by zero");
    }
    return a / b;
  }

  // Calculates the modulus of the first number by the second and returns the result.
  static double modulus(double a, double b) {
    if (b == 0) {
      throw Exception("Division by zero");
    }
    return a % b;
  }

  // Raises the first number to the power of the second and returns the result.
  static num power(double base, double exponent) {
    return pow(base, exponent);
  }
  
}