// -------------------------------------------------------
// BSV | SEQUENTIAL CIRCUITS | SIMPLE MULTIPLIER I
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
// BSV | SEQUENTIAL CIRCUITS | SIMPLE FOLDED MULTIPLIER II 
// -------------------------------------------------------
module mkMultiplier (Empty);

    Reg#(Bit#(4)) a <- mkReg(4'b1100); 
    Reg#(Bit#(4)) b <- mkReg(4'b1100); 
    Reg#(Bit#(4)) t <- mkReg(0);
    Reg#(Bit#(4)) p <- mkReg(0);
    Reg#(Bit#(3)) i <- mkReg(0); 
    
    rule mulStep(i < 4); 
        Bit#(4) m  = (a[i] == 0) ? 0 : b; 
        Bit#(5) s  = extend(m) + extend(t);
             p[i] <= s[0];
                t <= s[4:1]; 
                i <= i + 1;
    endrule

    rule reset (i == 4); 
        i <= 0;  
        $display("Product = %0d", {t,p});  
        $finish;
    endrule

endmodule

// -------------------------------------------------------
//                      2024 NIGIL
// -------------------------------------------------------
