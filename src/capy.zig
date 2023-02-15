const std = @import("std");
const capy = @import("capy");
pub usingnamespace capy.cross_platform;

const ListModel = struct {
    size: capy.DataWrapper(usize) = capy.DataWrapper(usize).of(10),
    arena: std.heap.ArenaAllocator = std.heap.ArenaAllocator.init(capy.internal.lasting_allocator),

    pub fn getComponent(self: *ListModel, index: usize) capy.Button_Impl {
        //return capy.Label(.{
        //    .alignment = .Left,
        //    .text = std.fmt.allocPrintZ(self.arena.allocator(), "File #{d}", .{index + 1}) catch unreachable,
        //});
        return capy.Button(.{ .label = std.fmt.allocPrintZ(self.arena.allocator(), "File #{d}", .{index + 1}) catch unreachable });
    }
};

pub fn main() !void {
    try capy.backend.init();

    var list_model = ListModel{};

    var window = try capy.Window.init();
    try window.set(
        capy.Stack(
            .{
                capy.Rect(.{ .color = capy.Color.comptimeFromString("#000000") }),
                capy.Column(.{}, .{
                    capy.Stack(.{
                        capy.Rect(.{ .color = capy.Color.comptimeFromString("#000000") }),
                        capy.Label(.{ .text = "Files Opened", .alignment = .Left }),
                    }),
                }),
                capy.Tabs(
                    .{ capy.Tab(.{ .label = "Files" }, Tab()), capy.Tab(.{ .label = "Edit" }, Tab()), capy.Tab(.{ .label = "View" }, Tab()), capy.Tab(.{ .label = "Run" }, Tab()), capy.Tab(.{ .label = "Help" }, Tab()) },
                ),
            },
        ),
    );
    window.setTitle("Notes");
    window.show();
    var last_add = std.time.milliTimestamp();
    while (capy.stepEventLoop(.Blocking)) {
        while (std.time.milliTimestamp() >= last_add + 1000) : (last_add += 1000) {
            list_model.size.set(list_model.size.get() + 1);
            std.log.info("There are now {} items.", .{list_model.size.get()});
        }
        break;
    }

    capy.runEventLoop();
}

fn Tab() anyerror!capy.Container_Impl {
    //return capy.Column(.{ .expand = .Fill, .spacing = 10 }, .{
    //    capy.Label(
    //        .{ .text = "", .alignment = .Left },
    //    ),
    //capy.Expanded(capy.Column(.{ .expand = .Fill, .spacing = 10 }, .{
    //    capy.Button(.{ .label = "shikhar.cpp" }),
    //})),
    //});
    var list_model = ListModel{};
    return capy.Stack(
        .{
            capy.ColumnList(.{}, &list_model),
        },
    );
}
