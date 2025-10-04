# calculator.jac
def add(a: float, b: float) -> float {
    return a + b;
}

def subtract(a: float, b: float) -> float {
    return a - b;
}

def multiply(a: float, b: float) -> float {
    return a * b;
}

def divide(a: float, b: float) -> float {
    return a / b;
}

with entry {
    print("=== Simple Calculator ===");

    # Test calculations

    numOne: str = input("Enter first number: ");
    numTwo: str = input("Enter second number: ") ;

    num1: float = float(numOne);
    num2: float = float(numTwo);

    print(f"{num1} + {num2} = {add(num1, num2)}");
    print(f"{num1} - {num2} = {subtract(num1, num2)}");
    print(f"{num1} * {num2} = {multiply(num1, num2)}");
    print(f"{num1} / {num2} = {divide(num1, num2)}");
}