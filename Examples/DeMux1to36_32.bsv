/* ==================================================
________  ___________   _____   ____ _______  ___
\______ \ \_   _____/  /     \ |    |   \   \/  /
 |    |  \ |    __)_  /  \ /  \|    |   /\     / 
 |    `   \|        \/    Y    \    |  / /     \ 
/_______  /_______  /\____|__  /______/ /___/\  \
        \/        \/         \/               \_/
================================================== */

// 1-to-36 32-Bit DeMux

interface DeMux1to36_32;
	method Action put (Bit#(32) in, Bit#(6) select);
        method Bit#(32) get00();
        method Bit#(32) get01();
        method Bit#(32) get02();
        method Bit#(32) get03();
        method Bit#(32) get04();
        method Bit#(32) get05();
        method Bit#(32) get06();
        method Bit#(32) get07();
        method Bit#(32) get08();
        method Bit#(32) get09();
        method Bit#(32) get10();
        method Bit#(32) get11();
        method Bit#(32) get12();
        method Bit#(32) get13();
        method Bit#(32) get14();
        method Bit#(32) get15();
        method Bit#(32) get16();
        method Bit#(32) get17();
        method Bit#(32) get18();
        method Bit#(32) get19();
        method Bit#(32) get20();
        method Bit#(32) get21();
        method Bit#(32) get22();
        method Bit#(32) get23();
        method Bit#(32) get24();
        method Bit#(32) get25();
        method Bit#(32) get26();
        method Bit#(32) get27();
        method Bit#(32) get28();
        method Bit#(32) get29();
        method Bit#(32) get30();
        method Bit#(32) get31();
        method Bit#(32) get32();
        method Bit#(32) get33();
        method Bit#(32) get34();
        method Bit#(32) get35();
endinterface

(* synthesize *)
module mkDeMux1to36_32 (DeMux1to36_32);
	Wire#(Bit#(32)) reg_in <- mkWire();
	Wire#(Bit#(06)) reg_s  <- mkWire();
	
	method Action put (Bit#(32) in, Bit#(6) select);
            reg_in <= in;
	    reg_s  <= select;
	endmethod
	
	method Bit#(32) get00(); 
	    if (reg_s == 0)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get01(); 
	    if (reg_s == 1)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get02(); 
	    if (reg_s == 2)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get03(); 
	    if (reg_s == 3)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get04(); 
	    if (reg_s == 4)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get05(); 
	    if (reg_s == 5)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get06(); 
	    if (reg_s == 6)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get07(); 
	    if (reg_s == 7)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get08(); 
	    if (reg_s == 8)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get09(); 
	    if (reg_s == 9)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get10(); 
	    if (reg_s == 10)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get11(); 
	    if (reg_s == 11)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get12(); 
	    if (reg_s == 12)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get13(); 
	    if (reg_s == 13)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get14(); 
	    if (reg_s == 14)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get15(); 
	    if (reg_s == 15)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get16(); 
	    if (reg_s == 16)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get17(); 
	    if (reg_s == 17)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get18(); 
	    if (reg_s == 18)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get19(); 
	    if (reg_s == 19)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get20(); 
	    if (reg_s == 20)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get21(); 
	    if (reg_s == 21)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get22(); 
	    if (reg_s == 22)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get23(); 
	    if (reg_s == 23)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get24(); 
	    if (reg_s == 24)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get25(); 
	    if (reg_s == 25)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get26(); 
	    if (reg_s == 26)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get27(); 
	    if (reg_s == 27)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get28(); 
	    if (reg_s == 28)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get29(); 
	    if (reg_s == 29)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get30(); 
	    if (reg_s == 30)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get31(); 
	    if (reg_s == 31)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get32(); 
	    if (reg_s == 32)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get33(); 
	    if (reg_s == 33)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get34(); 
	    if (reg_s == 34)
		return reg_in;
	    else
		return 0;
	endmethod

	method Bit#(32) get35(); 
	    if (reg_s == 35)
		return reg_in;
	    else
		return 0;
	endmethod
endmodule