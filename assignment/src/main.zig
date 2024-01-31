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

    const constant: i32 = 42;   // signed 32-bit constant
    var variable: u32 = 5000;   // unsigned 32-bit variable
    variable += 2;

    const inferred_constant = @as(i32, 42); // inferred type
    var inferred_variable = @as(u32, 5000); // inferred type
    inferred_variable += 2;

    const a: i32 = undefined; // undefined is a valid value for any type
    const b: u32 = undefined; // undefined is a valid value for any type

    try stdout.print("            signed 32-bit constant: {d}\n", .{constant});
    try stdout.print("          unsigned 32-bit variable: {d}\n", .{variable});
    try stdout.print("   inferred signed 32-bit constant: {d}\n", .{inferred_constant});
    try stdout.print(" inferred unsigned 32-bit variable: {d}\n", .{inferred_variable});
    try stdout.print("  undefined signed 32-bit constant: {d}\n", .{a});
    try stdout.print("undefined unsigned 32-bit variable: {d}\n", .{b});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
