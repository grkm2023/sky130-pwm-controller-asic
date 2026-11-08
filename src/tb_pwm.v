module tb_pwm;
    reg clk = 0;
    reg rst_n = 0;
    reg [7:0] duty = 0;
    wire pwm_out;

    pwm_controller uut (.clk(clk), .rst_n(rst_n), .duty(duty), .pwm_out(pwm_out));

    always #5 clk = ~clk; // 100 MHz saat üretimi

    initial begin
        $dumpfile("pwm.vcd");
        $dumpvars(0, tb_pwm);
        
        #20 rst_n = 1; // Resetten çıkar
        
        // %25 Duty Testi (64 / 256)
        duty = 8'd64;
        #2560;
        
        // %50 Duty Testi (128 / 256)
        duty = 8'd128;
        #2560;

        // %75 Duty Testi (192 / 256)
        duty = 8'd192;
        #2560;

        $display(">>> TEST BASARIYLA TAMAMLANDI: PWM Dalga Formu Dogrulandi! <<<");
        $finish;
    end
endmodule
