// -------------------------------------------------------
// BSV | SEQUENTIAL CIRCUITS | SHIFT & ADD MULTIPLIER [1]
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
// BSV | SEQUENTIAL CIRCUITS | FOLDED MULTIPLIER [2]
// -------------------------------------------------------

module mkFoldedMultiplier (Empty);

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
// BSV | SEQUENTIAL CIRCUITS | SOS MULTIPLIER [3]
// -------------------------------------------------------

module mkSOSMultiplier (Empty);

    // OPERANDS
    Reg#(Bit#(4)) a <- mkReg(4'b1111); 
    Reg#(Bit#(4)) b <- mkReg(4'b1111);
 
    Reg#(Bit#(8)) t <- mkReg(0);        // PRODUCT
    Reg#(Bit#(1)) c <- mkReg(0);	// CARRY
    
    // LOOP VARIABLES
    Reg#(Bit#(3)) i <- mkReg(0);
    Reg#(Bit#(3)) j <- mkReg(0);
    
    // RULES SHOULD NOT CONFLICT
    rule mulStep (j != 4);
    	        Bit#(1) t1 = (a[j] * b[i]);
    	        Bit#(2) t2 = extend(t[i+j]) + extend(c);
    	        Bit#(2) t3 = zeroExtend(t1) + t2;
    	            t[i+j]<= t3[0];
    	                c <= t3[1];
    	                j <= j + 1;
    endrule
    	    
    // INCREMENT CONDITION FOR 'OPERAND A'
    rule inc_i (j == 4); 
    	    	j <= 0; 
    	    	i <= i + 1;
    	 t[i + 4] <= c;
    	        c <= 0;
   endrule
    
   // BREAK
   rule finish (i == 4);
        $display("Product = %0d", t);  
    	$finish;
   endrule
    
endmodule

// -------------------------------------------------------
//                      2024 NIGIL
// -------------------------------------------------------
