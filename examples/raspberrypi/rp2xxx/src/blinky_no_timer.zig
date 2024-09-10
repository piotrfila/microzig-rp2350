const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;

const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO25 = .{
        .name = "led",
        .direction = .out,
    },
};

pub fn main() !void {
    const pins = pin_config.apply();

    while (true) {
        pins.led.toggle();
        for (0..500_000) |_| {
            asm volatile ("nop");
        }
    }
}
