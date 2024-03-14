const std = @import("std");

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(0);
    try std.testing.expect(@TypeOf(y) == u32);
    try std.testing.expect(y == 5);
}

fn fibonacchi(n: u32) u32 {
    if (n == 0 or n == 1) return n;
    return fibonacchi(n - 1) + fibonacchi(n - 2);
}

test "function recursion" {
    const x = fibonacchi(10);
    try std.testing.expect(@TypeOf(x) == u32);
    try std.testing.expect(x == 55);
}
