package com.company.myapp.cli;

import com.company.myapp.Truc;

import org.jline.reader.Candidate;
import org.jline.reader.Completer;
import org.jline.reader.ParsedLine;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

class Interpreter {

  private PrintWriter writer;

  void setWriter(PrintWriter pw) {
    writer = pw;
  }

  /** The constructor creates a default PrintWriter. */
  Interpreter() {
    OutputStreamWriter out = getStandardOutputStream();
    final boolean autoFlush = true;
    setWriter(new PrintWriter(out, autoFlush));
  }

  private OutputStreamWriter getStandardOutputStream() {
    String osName = System.getProperty("os.name");
    if (osName.startsWith("Windows")) {
      try {
        return new OutputStreamWriter(System.out, "Cp850");
      } catch (UnsupportedEncodingException ex) {
        // performs the statement below (after the if-block)
      }
    }
    // FindBugs: Below line performs a byte to String (or String to byte) conversion
    //           and may cause the application behavior to vary between platforms.
    return new OutputStreamWriter(System.out);
  }

  static String getUsage() {
    return "Each expression is composed of a keyword and one or more arguments"
             + "\n" + "Available keywords are:"
             + "\n" + " - help"
             + "\n" + " - get FIELD"
             + "\n" + " - set FIELD VALUE"
             + "\n" + " - quit"
             + "\n" + "Enter in interactive shell to get more help";
  }

  /** Provide a Completer object (for JLine)
   *  describing all available commands in
   *  interactive shell. */
  Completer getCompleter() {
    return (reader, line, candidates) -> {
      if (line.wordIndex() == 0) {
        candidates.add(new Candidate("help"));
        candidates.add(new Candidate("get"));
        candidates.add(new Candidate("set"));
        candidates.add(new Candidate("quit"));
      } else if (line.words().get(0).equals("get")
              || line.words().get(0).equals("set")) {
        candidates.add(new Candidate("myField"));
      }
    };
  }

  static class Quit extends java.lang.Exception {
    private static final long serialVersionUID = 2081175619748334941L;
  }

  /** Interprets the expression line passed as argument.
   * @throw Quit on keyword "quit".
   */
  void interpret(ParsedLine pl) throws Quit {

    String keyword = pl.word();

    switch (keyword) {

      case "set":
        if (pl.words().size() >= 3) {
          String field = pl.words().get(1);
          String value = pl.words().get(2);
          if ("myField".equals(field)) {
            Truc.setMyField(value);
          } else {
            writer.println(
                "Command 'set' does not know field '" + field + "'");
          }
        } else {
          writer.println(
              "Command 'set' requires two arguments \n" +
              "example: 'set myField ValueForMyField'");
        }
        break;

      case "get":
        if (pl.words().size() >= 2) {
          String field = pl.words().get(1);
          if ("myField".equals(field)) {
            String value = Truc.getMyField();
            writer.println(" => '" + value + "'");
          } else {
            writer.println(
                "Command 'get' does not know field '" + field + "'");
          }
        } else {
          writer.println(
              "Command 'get' requires one argument \n" +
              "example: 'get myField'");
        }
        break;

      case "help":
        int numberOfWords = pl.words().size();
        if (numberOfWords <= 1) {
          writer.println("\n" + "Supported keywords are:"
                       + "\n" + "- help"
                       + "\n" + "- get"
                       + "\n" + "- set"
                       + "\n" + "- quit"
                       + "\n" + "Please use 'help <keyword>' for more details.");
          break;
        }
        switch (pl.words().get(1)) {
          case "help":
            writer.println(
                "Command 'help' displays some useless documentation");
            break;
          case "get":
            writer.println(
                "Command 'get FIELD' retrieves FIELD value from database");
            break;
          case "set":
            writer.println(
                "Command 'set FIELD VALUE' stores the VALUE in the database");
            break;
          case "quit":
            writer.println(
                "Command 'quit' exits the interactive shell");
            break;
          default:
            writer.println(
                "Unknown keyword '" + keyword + "'.\n" +
                "Please use 'help' to list the available keywords.");
            break;
        }
        break;

      case "quit":
        writer.println("Exiting...");
        throw new Quit(); // stop

      default:
        writer.println(
            "Unknown keyword '" + pl.word() + "'.\n" +
            "Please use 'help' to the list the available keywords.");
    }
  }
}
