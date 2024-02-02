const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    // std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o'};
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd'};

    try stdout.print("a length: {}\n", .{a.len});
    try stdout.print("b length: {}\n", .{b.len});

    for (a) |d| {
        try stdout.print("{c}\n", .{d});
    }
    for (b) |e| {
        try stdout.print("{c}\n", .{e});
    }

    // try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
