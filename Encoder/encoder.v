module encoder(
    input [9:0] keypad,
    input clk, enablen,

    output wire [3:0] D,
    output wire pgt_1hz, loadn
);

    wire validn, div_clk, pgt;

    priority_encoder p_encoder (.keypad(keypad), .enablen(enablen), .digit(D), .validn(validn));

    freq_div div (.clock(clk), .div_clk(div_clk));

    counter_mod7 counter (.clk(clk), .clear(validn), .pgt(pgt));

    mux mux1 (.sel(enablen), .pgt(pgt), .clk(div_clk), .out(pgt_1hz));

    assign loadn = validn;

endmodule