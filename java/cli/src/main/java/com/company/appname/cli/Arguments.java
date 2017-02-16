package com.company.appname.cli;

import java.util.ArrayList;
import java.util.List;

class Arguments {

  boolean help = false;
  boolean interactive = false;
  List<String> expressions = new ArrayList<String>();

  /** @return a multi-line text describing the command line usage.
   */
  static String getUsage() {
    return "\n  -e"
         + "\n --expression 'keyword arg1 arg2 arg3...'"
         + "\n"
         + "\n  -i"
         + "\n --interactive     Enter in interactive shell"
         + "\n"
         + "\n  -h"
         + "\n --help            Provide this help text";
  }

  /** Process all command line arguments. */
  void parse(String[] args) {
    initializeInteractiveShellOption(args);
    boolean shouldBeAnExpression = false;
    for (String argument : args) {
      if (shouldBeAnExpression) {
        shouldBeAnExpression = false;
        if (doesItLookAsAnExpression(argument)) {
          expressions.add(argument);
          continue; // bypass the read of this argument
        }
      }
      shouldBeAnExpression = readArgument(argument);
    }
  }

  /**
   * No arguments => Always enable interactive shell.
   * Else         => Enable interactive shell only if argument "-i" is passed.
   */
  private void initializeInteractiveShellOption(String[] args) {
    // interactive = (args.length == 0);
    if (args.length == 0) {
      interactive = true;
    } else {
      interactive = false;
    }
  }

  /** Check one single argument from command line.
   *  @return true when the next argument should be an expression.
   */
  private boolean readArgument(String arg) {
    switch (arg) {
      case "-i":
      case "--interactive":
        interactive = true;
        return false;
      case "-e":
      case "--expression":
        return true; // true means use next argument as an expression
      case "-h":
      case "--help":
        help = true;
        return false;
      default:
        throw new IllegalArgumentException(
          "Argument '" + arg + "' is not a valid option.\n" +
          "Use instead one of:" + getUsage());
    }
  }

  /** Check if the provided string looks like an expression. */
  private boolean doesItLookAsAnExpression(String arg) {
    if (arg == null) {
      return false;
    }
    if (arg.length() == 0) {
      return false;
    }
    if (arg.charAt(0) == '-') {
      System.err.println(
          "Warning: Argument '" + arg + "' cannot be an expression\n" +
          "because the first character is '-'" + "\n" +
          "=> Continue command line processing" + "\n" +
          "=> Try instead to process this argument as an option...");
      return false;
    }
    return true;
  }
}
