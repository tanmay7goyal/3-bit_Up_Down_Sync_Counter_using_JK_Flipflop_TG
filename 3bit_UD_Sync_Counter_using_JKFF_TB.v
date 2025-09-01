module sync_jk_3bit_tb;

    
    reg clk;
    reg rst;
    reg ud;
    wire j2, k2;
    wire j1, k1;
    wire j0, k0;

   
    wire q2, q1, q0;

    
    sync_jk_3bit uut (
        .clk(clk),
        .rst(rst),
        .j2(j2),
        .k2(k2),
        .j1(j1),
        .k1(k1),
        .j0(j0),
        .k0(k0),
        .q2(q2),
        .q1(q1),
        .q0(q0),
        .ud(ud)
    );

    // Clock generation
    initial begin
        clk = 0;
        ud = 1;
        forever #5 clk = ~clk; 
    end

   
    initial begin
        
        rst = 1;  
        

        // Apply reset
        #10 rst = 0; 
          
        #75 ud = 0;
       
      #150  $finish;
    end

    
    initial begin
        $monitor("At time %0t: rst = %b, q2=%b,q1=%b,q0=%b", 
                 $time, rst, q2,q1,q0);
    end

endmodule
