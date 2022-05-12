module encoder(
    input [9:0] keypad,
    input clk, enablen,

    output wire [3:0] D,
    output wire pgt_1hz, loadn
);
    assign enablen = ~enablen;

    wire valid, div_clk, pgt;

    priority_encoder p_encoder (.keypad(keypad), .enablen(enablen), .D(D), .valid(valid));

    freq_div div (.clock(clk), .div_clk(div_clk));

    counter_mod7 counter (.clk(clk), .clear(valid), .pgt(pgt));

    mux mux1 (.sel(enablen), .pgt(pgt), .clk(div_clk), .out(pgt_1hz));

    assign loadn = ~valid;

endmodule