const std = @import("std");
const capy = @import("capy");
pub usingnamespace capy.cross_platform;

const Button = capy.Button;
const Column = capy.Column;

var computationLabel: capy.Label_Impl = undefined;


pub fn main() !void {
    try capy.backend.init();
    var window = try capy.Window.init();
    computationLabel = capy.Label(.{ .text = "", .alignment = .Left });
    try window.set(capy.Column(.{ .expand = .Fill, .spacing = 10 }, .{
        &computationLabel,
        capy.Expanded(Column(.{ .expand = .Fill, .spacing = 10 }, .{
            Button(.{ .label = "7" }),
        })),
    }));
    window.resize(400, 500);
    window.setTitle("Notes");
    window.show();
    capy.runEventLoop();
}