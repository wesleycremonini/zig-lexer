const std = @import("std");

const lexer = @import("lexer.zig");

pub fn main() !void {
    // open stdin to get input
    var stdin = std.io.getStdIn().reader();

    // buffer to read into
    var buffer: [1024]u8 = undefined;

    // start reading lines from stdin into buffer
    while (try stdin.readUntilDelimiterOrEof(&buffer, '\n')) |line| {

        // create a lexer for each line
        var lex = lexer.Lexer.init(line);

        // start lexing the line
        while (lex.has_tokens()) {

            // read the next token
            const token = lex.next_token();

            // print the token
            std.debug.print("{}\n", .{token});
        }
    }
}