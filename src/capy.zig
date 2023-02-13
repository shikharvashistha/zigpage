const std = @import("std");
const capy = @import("capy");

// This is required for your app to build to WebAssembly and other particular architectures
pub usingnamespace capy.cross_platform;

pub fn main() !void {
    try capy.backend.init();

    var window = try capy.Window.init();
    var button = try capy.Button.init();
    try window.set(capy.Label(.{ .text = "Hi, I'm Shikhar Vashistha", .alignment = .Center }));

    window.setTitle("Hello");
    window.resize(250, 100);
    window.show();
    try window.add(button);
    try button.set(capy.Label(.{ .text = "This is a button", .alignment = .Center }));
    button.resize(100, 50);
    button.move(75, 25);
    button.show();

    capy.runEventLoop();
}