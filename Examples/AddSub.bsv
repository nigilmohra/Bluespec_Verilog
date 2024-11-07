/* =================================================================
   _____  ________  ________    _____________ _____________ 
  /  _  \ \______ \ \______ \  /   _____/    |   \______   \
 /  /_\  \ |    |  \ |    |  \ \_____  \|    |   /|    |  _/
/    |    \|    `   \|    `   \/        \    |  / |    |   \
\____|__  /_______  /_______  /_______  /______/  |______  /
        \/        \/        \/        \/                 \/ 
================================================================= */

// 544-Bit Adder / Subtractor using 32-Bit Core Adder / Subtractor

// `define ADD32
// `define SUB32


// ================================================================
// INTERFACES
// ================================================================

interface ModAdd544;
    method Action put (Bit#(544) a, Bit#(544) b);
    method Bit#(545) get();
endinterface

// -----------------------------------------------------------------
// ADDSUB 544-Bit Add / Sub with 32-Bit Adder (s = 17) | Sub Module
// -----------------------------------------------------------------

// 17-to-1 32-Bit Mux

interface Mux17to1_32;
    method Bit#(32) select (Bit#(32) in00, Bit#(32) in01, Bit#(32) in02, Bit#(32) in03,
                            Bit#(32) in04, Bit#(32) in05, Bit#(32) in06, Bit#(32) in07,
                            Bit#(32) in08, Bit#(32) in09, Bit#(32) in10, Bit#(32) in11,
                            Bit#(32) in12, Bit#(32) in13, Bit#(32) in14, Bit#(32) in15,
                            Bit#(32) in16, UInt#(5) sel);
endinterface

(* synthesize *)
module mkMux17to1_32 (Mux17to1_32);
    method Bit#(32) select (Bit#(32) in00, Bit#(32) in01, Bit#(32) in02, Bit#(32) in03,
                            Bit#(32) in04, Bit#(32) in05, Bit#(32) in06, Bit#(32) in07,
                            Bit#(32) in08, Bit#(32) in09, Bit#(32) in10, Bit#(32) in11,
                            Bit#(32) in12, Bit#(32) in13, Bit#(32) in14, Bit#(32) in15,
                            Bit#(32) in16, UInt#(5) sel);
        case (sel)
            0   :   return in00;
            1   :   return in01;
            2   :   return in02;
            3   :   return in03;
            4   :   return in04;
            5   :   return in05;
            6   :   return in06;
            7   :   return in07;
            8   :   return in08;
            9   :   return in09;
            10  :   return in10;
            11  :   return in11;
            12  :   return in12;
            13  :   return in13;
            14  :   return in14;
            15  :   return in15;
            16  :   return in16;
        endcase
    endmethod
endmodule

// 32-Bit Adder

interface Add32;
    method Tuple2#(Bit#(1), Bit#(32)) do_add (Bit#(32) a, Bit#(32) b, Bit#(1) c);
endinterface

(* synthesize *)
module mkAdd32 (Add32);
     method Tuple2#(Bit#(1), Bit#(32)) do_add (Bit#(32) a, Bit#(32) b, Bit#(1) c);
        let a_in = {1'b0, a};
        let b_in = {1'b0, b};
	let c_in = {32'd0, c};
        let s_out = a_in + b_in + c_in;
        return tuple2(s_out[32], s_out[31:00]);
    endmethod
endmodule

// 32-Bit Subtractor

interface Sub32;
    method Tuple2#(Bit#(1), Bit#(32)) do_sub (Bit#(32) a, Bit#(32) b, Bit#(1) c);
endinterface

(* synthesize *)
module mkSub32 (Sub32);
     method Tuple2#(Bit#(1), Bit#(32)) do_sub (Bit#(32) a, Bit#(32) b, Bit#(1) c);
        let a_in = {1'b0, a};
        let b_in = {1'b0, ~b};
	let c_in = {32'd0, c};
        let d_out = a_in + b_in + c_in;
        return tuple2(d_out[32], d_out[31:00]);
    endmethod
endmodule


// =============================================================================
// TOP MODULES
// =============================================================================

// -----------------------------------------------------------------------------
// ADDSUB 544-Bit Addition / Subtraction with 32-Bit Adder (s = 17) | Top Module 
// -----------------------------------------------------------------------------

(* synthesize *)
module mkModAdd544 (ModAdd544);

    Reg#(Bit#(32)) reg_a_00 <- mkRegU;
    Reg#(Bit#(32)) reg_a_01 <- mkRegU;
    Reg#(Bit#(32)) reg_a_02 <- mkRegU;
    Reg#(Bit#(32)) reg_a_03 <- mkRegU;
    Reg#(Bit#(32)) reg_a_04 <- mkRegU;
    Reg#(Bit#(32)) reg_a_05 <- mkRegU;
    Reg#(Bit#(32)) reg_a_06 <- mkRegU;
    Reg#(Bit#(32)) reg_a_07 <- mkRegU;
    Reg#(Bit#(32)) reg_a_08 <- mkRegU;
    Reg#(Bit#(32)) reg_a_09 <- mkRegU;
    Reg#(Bit#(32)) reg_a_10 <- mkRegU;
    Reg#(Bit#(32)) reg_a_11 <- mkRegU;
    Reg#(Bit#(32)) reg_a_12 <- mkRegU;
    Reg#(Bit#(32)) reg_a_13 <- mkRegU;
    Reg#(Bit#(32)) reg_a_14 <- mkRegU;
    Reg#(Bit#(32)) reg_a_15 <- mkRegU;
    Reg#(Bit#(32)) reg_a_16 <- mkRegU;

    Reg#(Bit#(32)) reg_b_00 <- mkRegU;
    Reg#(Bit#(32)) reg_b_01 <- mkRegU;
    Reg#(Bit#(32)) reg_b_02 <- mkRegU;
    Reg#(Bit#(32)) reg_b_03 <- mkRegU;
    Reg#(Bit#(32)) reg_b_04 <- mkRegU;
    Reg#(Bit#(32)) reg_b_05 <- mkRegU;
    Reg#(Bit#(32)) reg_b_06 <- mkRegU;
    Reg#(Bit#(32)) reg_b_07 <- mkRegU;
    Reg#(Bit#(32)) reg_b_08 <- mkRegU;
    Reg#(Bit#(32)) reg_b_09 <- mkRegU;
    Reg#(Bit#(32)) reg_b_10 <- mkRegU;
    Reg#(Bit#(32)) reg_b_11 <- mkRegU;
    Reg#(Bit#(32)) reg_b_12 <- mkRegU;
    Reg#(Bit#(32)) reg_b_13 <- mkRegU;
    Reg#(Bit#(32)) reg_b_14 <- mkRegU;
    Reg#(Bit#(32)) reg_b_15 <- mkRegU;
    Reg#(Bit#(32)) reg_b_16 <- mkRegU;

    Reg#(Bit#(32)) reg_t_00 <- mkRegU;
    Reg#(Bit#(32)) reg_t_01 <- mkRegU;
    Reg#(Bit#(32)) reg_t_02 <- mkRegU;
    Reg#(Bit#(32)) reg_t_03 <- mkRegU;
    Reg#(Bit#(32)) reg_t_04 <- mkRegU;
    Reg#(Bit#(32)) reg_t_05 <- mkRegU;
    Reg#(Bit#(32)) reg_t_06 <- mkRegU;
    Reg#(Bit#(32)) reg_t_07 <- mkRegU;
    Reg#(Bit#(32)) reg_t_08 <- mkRegU;
    Reg#(Bit#(32)) reg_t_09 <- mkRegU;
    Reg#(Bit#(32)) reg_t_10 <- mkRegU;
    Reg#(Bit#(32)) reg_t_11 <- mkRegU;
    Reg#(Bit#(32)) reg_t_12 <- mkRegU;
    Reg#(Bit#(32)) reg_t_13 <- mkRegU;
    Reg#(Bit#(32)) reg_t_14 <- mkRegU;
    Reg#(Bit#(32)) reg_t_15 <- mkRegU;
    Reg#(Bit#(32)) reg_t_16 <- mkRegU;
    Reg#(Bit#(01)) reg_t_17 <- mkRegU;

    Reg#(Bit#(01)) carry <- mkRegU;

    Reg#(UInt#(4)) state   <- mkReg(0);
    Reg#(UInt#(5)) count_i <- mkRegU;

    Mux17to1_32 u_Mux_a <- mkMux17to1_32;
    Mux17to1_32 u_Mux_b <- mkMux17to1_32;

    Add32 u_Add <- mkAdd32;
    Sub32 u_Sub <- mkSub32;

    rule addsub (state == 1);
        let select_in_a = u_Mux_a.select(reg_a_00, reg_a_01, reg_a_02, reg_a_03,
                                         reg_a_04, reg_a_05, reg_a_06, reg_a_07,
                                         reg_a_08, reg_a_09, reg_a_10, reg_a_11,
                                         reg_a_12, reg_a_13, reg_a_14, reg_a_15,
                                         reg_a_16, count_i);
        let select_in_b = u_Mux_b.select(reg_b_00, reg_b_01, reg_b_02, reg_b_03,
                                         reg_b_04, reg_b_05, reg_b_06, reg_b_07,
                                         reg_b_08, reg_b_09, reg_b_10, reg_b_11,
                                         reg_b_12, reg_b_13, reg_b_14, reg_b_15,
                                         reg_b_16, count_i);
`ifdef ADD32
	let add_out = u_Add.do_add(select_in_a, select_in_b, carry);
	carry <= tpl_1(add_out);
        case (count_i)
            0   :   reg_t_00 <= tpl_2(add_out);
            1   :   reg_t_01 <= tpl_2(add_out);
            2   :   reg_t_02 <= tpl_2(add_out);
            3   :   reg_t_03 <= tpl_2(add_out);
            4   :   reg_t_04 <= tpl_2(add_out);
            5   :   reg_t_05 <= tpl_2(add_out);
            6   :   reg_t_06 <= tpl_2(add_out);
            7   :   reg_t_07 <= tpl_2(add_out);
            8   :   reg_t_08 <= tpl_2(add_out);
            9   :   reg_t_09 <= tpl_2(add_out); 
            10  :   reg_t_10 <= tpl_2(add_out);
            11  :   reg_t_11 <= tpl_2(add_out);
            12  :   reg_t_12 <= tpl_2(add_out);
            13  :   reg_t_13 <= tpl_2(add_out);
            14  :   reg_t_14 <= tpl_2(add_out);
            15  :   reg_t_15 <= tpl_2(add_out);
            16  :   reg_t_16 <= tpl_2(add_out);
        endcase
`endif

`ifdef SUB32
	let sub_out = u_Sub.do_sub(select_in_a, select_in_b, carry);
	carry <= tpl_1(sub_out);
        case (count_i)
            0   :   reg_t_00 <= tpl_2(sub_out) + 32'd1;
            1   :   reg_t_01 <= tpl_2(sub_out);
            2   :   reg_t_02 <= tpl_2(sub_out);
            3   :   reg_t_03 <= tpl_2(sub_out);
            4   :   reg_t_04 <= tpl_2(sub_out);
            5   :   reg_t_05 <= tpl_2(sub_out);
            6   :   reg_t_06 <= tpl_2(sub_out);
            7   :   reg_t_07 <= tpl_2(sub_out);
            8   :   reg_t_08 <= tpl_2(sub_out);
            9   :   reg_t_09 <= tpl_2(sub_out); 
            10  :   reg_t_10 <= tpl_2(sub_out);
            11  :   reg_t_11 <= tpl_2(sub_out);
            12  :   reg_t_12 <= tpl_2(sub_out);
            13  :   reg_t_13 <= tpl_2(sub_out);
            14  :   reg_t_14 <= tpl_2(sub_out);
            15  :   reg_t_15 <= tpl_2(sub_out);
            16  :   reg_t_16 <= tpl_2(sub_out);
        endcase
`endif
        count_i <= count_i + 1;
        if (count_i == 16) begin
`ifdef SUB32
            reg_t_17 <= (reg_a_16 < reg_b_16) ? 1'd1 : 1'd0;
`endif
`ifdef ADD32
	    reg_t_17 <= carry;
`endif
            state <= state - 1;
        end
    endrule
    

    		

   method Action put (Bit#(544) a, Bit#(544) b) if(state == 0);
	// Register Banks can be Reused
	reg_a_00 <= a[031:000];
        reg_a_01 <= a[063:032];
        reg_a_02 <= a[095:064];
        reg_a_03 <= a[127:096];
        reg_a_04 <= a[159:128];
        reg_a_05 <= a[191:160];
        reg_a_06 <= a[223:192];
        reg_a_07 <= a[255:224];
        reg_a_08 <= a[287:256];
        reg_a_09 <= a[319:288];
        reg_a_10 <= a[351:320];
        reg_a_11 <= a[383:352];
        reg_a_12 <= a[415:384];
        reg_a_13 <= a[447:416];
        reg_a_14 <= a[479:448];
        reg_a_15 <= a[511:480];
        reg_a_16 <= a[543:512];

        reg_b_00 <= b[031:000];
        reg_b_01 <= b[063:032];
        reg_b_02 <= b[095:064];
        reg_b_03 <= b[127:096];
        reg_b_04 <= b[159:128];
        reg_b_05 <= b[191:160];
        reg_b_06 <= b[223:192];
        reg_b_07 <= b[255:224];
        reg_b_08 <= b[287:256];
        reg_b_09 <= b[319:288];
        reg_b_10 <= b[351:320];
        reg_b_11 <= b[383:352];
        reg_b_12 <= b[415:384];
        reg_b_13 <= b[447:416];
        reg_b_14 <= b[479:448];
        reg_b_15 <= b[511:480];
        reg_b_16 <= b[543:512];
	
	reg_t_00 <= '0;
        reg_t_01 <= '0;
        reg_t_02 <= '0;
        reg_t_03 <= '0;
        reg_t_04 <= '0;
        reg_t_05 <= '0;
        reg_t_06 <= '0;
        reg_t_07 <= '0;
        reg_t_08 <= '0;
        reg_t_09 <= '0;
        reg_t_10 <= '0;
        reg_t_11 <= '0;
        reg_t_12 <= '0;
        reg_t_13 <= '0;
        reg_t_14 <= '0;
        reg_t_15 <= '0;
        reg_t_16 <= '0;
        reg_t_17 <= '0;

        carry   <= 0;
        count_i <= 0;
        state   <= 1;
    endmethod

    method Bit#(545) get if (state == 0);
        return {reg_t_17, reg_t_16, reg_t_15, reg_t_14, 
                reg_t_13, reg_t_12, reg_t_11, reg_t_10, 
                reg_t_09, reg_t_08, reg_t_07, reg_t_06, 
                reg_t_05, reg_t_04, reg_t_03, reg_t_02, 
                reg_t_01, reg_t_00};
    endmethod
endmodule
