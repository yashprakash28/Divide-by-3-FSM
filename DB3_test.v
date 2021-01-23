// This is a TestBench File for Design Under Test

module DB3_test;
    reg clk, rst, in;
    wire out;
    wire [1:0] state;

    DB3 db3(clk, rst, in, out, state);             // module instantiated

    initial
        begin
            $dumpfile("DB3.vcd");           // output gets stored in this file
            $dumpvars(0, DB3_test);         // output parameters to be stored
            clk = 1'b0;                     // clock initialization
            rst = 1'b1; #4 rst = 1'b0;      // reset button initialization
        end

    always
        #5 clk = ~clk;                      // clock operation

    initial
        begin
            $display("Time\tState\tIn\tOut");
            $monitor("%g\t%b\t%b\t%b", $time, state, in, out);      // monitor output expression

            in = 1'b0;                                              // input starts here
            repeat(2)                                               // input variation loop
                begin
                    #20 in=1; #10 in=0; #10 in=1; #10 in=0;
                    #10 in=1; #10 in=0; #20 in=1; #20 in=0;
                    #10 in=1; #10 in=0; #10 in=1; #10 in=0;
                    #30 in=1; #10 in=0;
                end

            #10 $finish;                                            // end of test cases
        end

endmodule