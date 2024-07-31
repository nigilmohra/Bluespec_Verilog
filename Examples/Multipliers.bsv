// -------------------------------------------------------
// BSV | SEQUENTIAL CIRCUITS | SIMPLE MULTIPLIER
// -------------------------------------------------------

module mkMultiplier (Empty);

    Reg#(Bit#(4)) a <- mkReg(4'b1001); 
    Reg#(Bit#(4)) b <- mkReg(4'b1010); 
    Reg#(Bit#(8)) p <- mkReg(0);
    Reg#(Bit#(3)) i <- mkReg(0); 
    
    rule mulStep(i != 4); 
        p  <=  (p << 1) + extend((a[i] == 0) ? 0 : b); 
        i  <=  i + 1;
    endrule

    rule reset (i == 4); 
        i <= 0;  
        $display("Product = %0d", p);  
        p <= 0;
        $finish;
    endrule

endmodule

// -------------------------------------------------------
//                      2024 NIGIL
// -------------------------------------------------------
