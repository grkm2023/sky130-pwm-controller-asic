module pwm_controller (
    input  wire       clk,       // 100 MHz Sistem Saati
    input  wire       rst_n,     // Aktif Düşük Reset
    input  wire [7:0] duty,      // 0-255 Arası Doluluk Oranı
    output reg        pwm_out    // Çıkış PWM Sinyali
);

    reg [7:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 8'd0;
            pwm_out <= 1'b0;
        end else begin
            counter <= counter + 1'b1;
            pwm_out <= (counter < duty) ? 1'b1 : 1'b0;
        end
    end

endmodule
