import 'dart:isolate';

Future<void> longRunningOperation(String message) async {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print("$message: $i");
  }
}

void main(List<String> arguments) async {
  print('Start of long running operation');
  Isolate.spawn(longRunningOperation, "Long running operation 1");
  Isolate.spawn(longRunningOperation, "Long running operation 2");
  print('Continuing main body');
  for (int i = 0; i < 15; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('Index from main: $i');
  }
  print('End of main');
}
