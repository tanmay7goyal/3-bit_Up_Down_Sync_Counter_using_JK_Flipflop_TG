module sync_jk_3bit (clk,rst,j2,k2,j1,k1,j0,k0,q2,q1,q0,ud);
output j2,k2,j1,k1,j0,k0;
input clk,rst,ud;
output reg q2=0;
output reg q1=0;
output reg q0 =0;

assign j2 = ud? (q1 && q0) : ((!q1) && (!q0));
assign k2 = ud ? (q1 && q0) : ((!q1) && (!q0));
assign j1 = ud ? q0 : (!q0);
assign k1 = ud ? q0 : (!q0);
assign j0 = 1'b1;
assign k0 = 1'b1;
always @(posedge clk)
    begin
       if(rst)
          begin q2<= 1'b0; q1<= 1'b0; q0<= 1'b0; end
       else if(ud)
          begin
                q2 <= (j2 && (!q2)) || ( (!k2) && q2);
                q1 <= (j1 && (!q1)) || ( (!k1) && q1);
                q0 <= (j0 && (!q0)) || ( (!k0) && q0);
          end
        else 
          begin
                q2 <= (j2 && (!q2)) || ( (!k2) && q2);
                q1 <= (j1 && (!q1)) || ( (!k1) && q1);
                q0 <= (j0 && (!q0)) || ( (!k0) && q0);
          end
    end
endmodule
