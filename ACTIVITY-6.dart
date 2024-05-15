// Stack Class Definition
class Stack<T> {
  List<T> _stack = [];

// Push Method
  void push(T element) {
    _stack.add(element);
  }

// Pop Method
  T pop() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    return _stack.removeLast();
  }

// isEmpty Method
  bool isEmpty() {
    return _stack.isEmpty;
  }
}

// Main Function
void main() {
  var stack = Stack<int>();

  stack.push(1);
  stack.push(2);
  stack.push(3);

  print('Is stack empty? ${stack.isEmpty()}');

  var poppedElement = stack.pop();
  print('Popped element: $poppedElement');

  print('Is stack empty? ${stack.isEmpty()}');
}
