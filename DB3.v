// Verilog Code for Divide-by-3 Finite State Machine

module DB3(clk, rst, in, out, state);
    input clk, rst, in;     // input controlling the operation
    output reg out;         // output of FSM
    output reg [1:0] state;        // state variable

    parameter A=2'b00,      //defining state parameters
              B=2'b01,
              C=2'b10,
              D=2'b11;

    always @ (posedge clk or negedge rst)       // condition for operation
            case(state)                         // switch case operation
                A: begin
                    out <= in ? 0 : 0;
                    state <= in ? B : A;
                   end

                B: begin
                    out <= in ? 0 : 0;
                    state <= in ? C : B;
                   end

                C: begin
                    out <= in ? 1 : 0;
                    state <= in ? D : C;
                   end

                D: begin
                    out <= in ? 0 : 0;
                    state <= in ? B : A;
                   end
                
                default: state = A;
            
            endcase
        
endmodule