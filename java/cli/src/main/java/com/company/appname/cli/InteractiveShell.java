package com.company.appname.cli;

import org.jline.reader.Completer;
import org.jline.reader.LineReader;
import org.jline.reader.LineReaderBuilder;
import org.jline.reader.ParsedLine;
import org.jline.reader.Parser;
import org.jline.terminal.Terminal;
import org.jline.terminal.TerminalBuilder;

import java.io.IOException;
import java.io.PrintWriter;


class InteractiveShell {

  private Terminal terminal;
  private LineReader reader;

  InteractiveShell(Completer completer) throws IOException {
    terminal = TerminalBuilder.terminal();
    reader = LineReaderBuilder.builder().appName("MyApp")
         .terminal(terminal).completer(completer).build();
  }

  void close() throws IOException {
    terminal.close();
  }

  PrintWriter getWriter() {
    return terminal.writer();
  }

  /** Read the expression entered by the user within the interactive shell
   *  and pass it to the parser.
   */
  ParsedLine read() {
    String line = reader.readLine("> ");
    if (line == null) {
      return null;
    }
    line = line.trim();
    if (line.length() == 0) {
      return null;
    }

    sLogger.i("read line = " + line);

    Parser parser = reader.getParser();
    return parser.parse(line, 0);
  }
}
