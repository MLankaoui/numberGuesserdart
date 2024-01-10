import 'dart:io';
import 'dart:math';

String? userName;
String? userResponse;
int? userGuess;

void main() {
  stdout.write("Enter your username to continue : ");
  userName = stdin.readLineSync();

  while (userName == null || userName!.isEmpty) {
    stdout.write("Enter your username to continue : ");
    userName = stdin.readLineSync();
  }

  if (userName != null) {
    greeting(userName!);

    stdout.write("Do you want to start the game? (y/n): ");
    userResponse = stdin.readLineSync();

    while (userResponse == null ||
        userResponse!.isEmpty ||
        (userResponse != 'y' && userResponse != 'n')) {
      stdout.write("Do you want to start the game? (y/n): ");
      userResponse = stdin.readLineSync();
    }

    if (userResponse == 'y') {
      print("Now that you want to play, we are going to give you 5 attempts to guess the number between 0 and 10");

      Random rng = Random();
      int number = rng.nextInt(11);

      for (var i = 0; i < 5; i++) {
        stdout.write("Attempt number ${i + 1}: Enter your guess: ");
        userGuess = int.parse(stdin.readLineSync()!);

        if (userGuess == number) {
          print("Congratulations! You guessed the correct number.");
          break;
        } else {
          print("Try again.");
        }
        if (i == 4)
        {
          print("You lost!");
        }
      }
    } else {
      print("Exiting the program...");
      exit(98);
    }
  }
}

void greeting(String username) {
  print("Hello Mr $username");
  print("Welcome to the number guess game");
}
