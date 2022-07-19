`timescale 1ns / 1ps
////////////////////////////////////////////////////
//Designed By Deniz Güzel 
//For Question denzz.guzel@gmail.com
/////////////////////////////////////////////////////
module TB_TopModule;
	reg clk;

TopModule uut (
   .clk(clk) 
   );
  initial begin

     clk = 0;
	  
     #40$finish;
        
   end
	
 always #1 clk = !clk;   
 
endmodule

