`timescale 1ns / 1ns
module Traffic_Light_Controller(


    input clk,rst,
    output reg [2:0]light_M1,
    output reg [2:0]light_S,
    output reg [2:0]light_MT,
    output reg [2:0]light_M2
    );
    
    parameter  S1=3'b000, S2=3'b001, S3 =3'b010, S4=3'b011, S5=3'b100,S6=3'b101;
    integer count;
    reg[2:0] ps;
    parameter  sec7=6,sec5=4,sec2=1,sec3=2;

   
    
    always@(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
        else
        begin
      
       
            
            case(ps)
                S1: if(count<sec7)
                        begin
                        ps<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S2;
                        count<=0;
                        end
                S2: if(count<sec2)
                        begin
                        ps<=S2;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S3;
                        count<=0;
                        end
                S3: if(count<sec5)
                        begin
                        ps<=S3;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S4;
                        count<=0;
                        end
                S4:if(count<sec2)
                        begin
                        ps<=S4;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S5;
                        count<=0;
                        end
                S5:if(count<sec3)
                        begin
                        ps<=S5;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S6;
                        count<=0;
                        end

                S6:if(count<sec2)
                        begin
                        ps<=S6;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S1;
                        count<=0;
                        end
                default: ps<=S1;
                endcase
end
            end   

            always@(ps)    
            begin
                
                case(ps)
                     
                    S1:
                    begin
                       light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                    end
                    S2:
                    begin 
                       light_M1<=3'b001;
                       light_M2<=3'b010;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                    end
                    S3:
                    begin
                       light_M1<=3'b001;
                       light_M2<=3'b100;
                       light_MT<=3'b001;
                       light_S<=3'b100;
                    end
                    S4:
                    begin
                       light_M1<=3'b010;
                       light_M2<=3'b100;
                       light_MT<=3'b010;
                       light_S<=3'b100;
                    end
                    S5:
                    begin
                       light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_MT<=3'b100;
                       light_S<=3'b001;
                    end
                    S6:
                    begin 
                       light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_MT<=3'b100;
                       light_S<=3'b010;
                    end
                    default:
                    begin 
                       light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                    end
                    endcase
            end                
              

endmodule


module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_MT;
wire [2:0]light_M2;
wire [2:0]light_S;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_MT(light_MT),.light_M2(light_M2),.light_S(light_S)  );
initial
begin
    clk=1'b0;
   // forever #(1000000000/2) clk=~clk;
end
always
	#5 clk=~clk;
initial
begin
    rst=1;
    #20;
    rst=0;
   
    #1000;
    $stop;
    end




endmodule
