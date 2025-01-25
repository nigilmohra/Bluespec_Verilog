/* ====================================================================================
___________________     _____   
\______   \_   ___ \   /  _  \  
 |       _/    \  \/  /  /_\  \ 
 |    |   \     \____/    |    \
 |____|_  /\______  /\____|__  /
        \/        \/         \/ 
====================================================================================== */

// 1-Bit Adder

interface Adder;
    method Tuple2#(Bit#(1), Bit#(1)) do_add (Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
endinterface

function Bit#(2) add (Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
	let add_out = {1'b0, a} + {1'b0, b} + {1'b0, c_in};
	return add_out;
endfunction

module mkAdder (Adder);
    method Tuple2#(Bit#(1), Bit#(1)) do_add (Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
        Bit#(2) add_out = add(a, b, c_in);
        return tuple2(add_out[1], add_out[0]);
    endmethod
endmodule

// 4-Bit Ripple Carry Adder

interface RCAdder#(numeric type w);
    method Bit#(TAdd#(w,1)) do_rcadd (Bit#(w) a, Bit#(w) b, Bit#(1) c_in);
endinterface

module mkRCAdder (RCAdder#(w));
    method Bit#(TAdd#(w,1)) do_rcadd (Bit#(w) a, Bit#(w) b, Bit#(1) c_in);
        Bit#(w) s = 0;
        Bit#(TAdd#(w,1)) c = 0; 
        c[0] = c_in;
        for (Integer i = 0; i < valueOf(w); i = i + 1) begin
            let add_out = add(a[i], b[i], c[i]);
            s[i] = add_out[0];
            c[i + 1] = add_out[1];
        end
        return {c[valueOf(w)], s};
    endmethod
endmodule

/* --------------------------------------------------------------- Note
Error: "src/RCAdder.bsv", line 31, column 8: (T0043)
Cannot synthesize `mkRCAdder': Its interface is polymorphic.

BSV Parameterization and Inline Mechanism
- BSV parameterization mechanisms are more powerful than those of RTL; this is not even possible in RTL. 
- Instead of generating a separate Verilog module for `mkRCAdder.v`, remove the `(*synthesize*)` attribute from `mkRCAdder()` and let BSC inline it in the design that instantiates it.
*/
