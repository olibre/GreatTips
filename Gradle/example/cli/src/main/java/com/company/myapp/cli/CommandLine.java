package com.company.myapp.cli;

import org.jline.reader.Completer;
import org.jline.reader.EndOfFileException;
import org.jline.reader.ParsedLine;
import org.jline.reader.Parser;
import org.jline.reader.UserInterruptException;
import org.jline.reader.impl.DefaultParser;

import java.io.IOException;
import java.io.PrintWriter;

class CommandLine {

  private static boolean nothingToInterpret(Arguments arguments) {
    if (arguments.interactive) {
      return false;
    } else {
      return arguments.expressions.isEmpty();
    }
  }

  /** Entry point of the application CLI (Command Line Interface). */
  public static void main(String[] args) throws IOException {

    Arguments arguments = new Arguments();
    arguments.parse(args);

    if (arguments.help) {
      String usage = "Usage: java " + InteractiveShell.class.getName()
                   + "\n" + Arguments.getUsage()
                   + "\n" + Interpreter.getUsage();
      System.out.println(usage);
      return;
    }

    if (nothingToInterpret(arguments)) {
      return;
    }

    Interpreter interpreter = new Interpreter();

    // Interpret expressions from command line arguments
    for (String e : arguments.expressions) {
      Parser parser = new DefaultParser();
      ParsedLine pl = parser.parse(e, 0);
      try {
        interpreter.interpret(pl);
      } catch (Interpreter.Quit ex) {
        System.err.println("Ignore expression 'quit' from command line arguments");
      }
    }

    // Enter in interactive shell
    if (arguments.interactive) {
      Completer completer = interpreter.getCompleter();
      InteractiveShell shell = new InteractiveShell(completer);
      PrintWriter writer = shell.getWriter();
      interpreter.setWriter(writer);

      try {
        interactiveShellLoop(interpreter, shell);
      } catch (UserInterruptException ex) {
        System.err.println("Detect UserInterruptException => exit");
      } catch (EndOfFileException ex) {
        System.err.println("Detect EndOfFileException => exit");
      } catch (Interpreter.Quit ex) {
        System.err.println("Detect user command 'quit' => exit");
      }

      shell.close();
    }
  }

  static void interactiveShellLoop(Interpreter interpreter, InteractiveShell shell)
      throws UserInterruptException, EndOfFileException, Interpreter.Quit {
    while (true) {
      ParsedLine pl;
      pl = shell.read();
      if (pl != null) {
        interpreter.interpret(pl);
      }
    }
  }
}
