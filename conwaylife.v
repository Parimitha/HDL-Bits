module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    reg [3:0]s;
    always@(posedge clk)
        begin
            if(load)
                begin
                    q<=data;
                end
            else begin
                for(int i=0;i<256;i=i+1)
                    begin
                        if(i==0)
                            begin
                                s=q[1]+q[16]+q[17]+q[240]+q[241]+q[15]+q[31]+q[255];
                            end
                        else if(i==15)
                            begin
                                s=q[14]+q[16]+q[0]+q[240]+q[254]+q[30]+q[31]+q[255];
                            end
                        else if(i==240)
                            begin
                                s=q[0]+q[15]+q[239]+q[241]+q[1]+q[224]+q[225]+q[255];
                            end
                        else if(i==255)
                            begin
                                s=q[0]+q[15]+q[14]+q[224]+q[238]+q[240]+q[239]+q[254];
                            end
                        else if(i>0 && i<15)
                            begin
                                s=q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17]+q[i+239]+q[i+240]+q[i+241];
                            end
                        else if(i%16==0)
                            begin
                                s=q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17]+q[i-16]+q[i-15]+q[i+31];
                            end
                        else if(i%16==15)
                            begin
                                s=q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i-17]+q[i-16]+q[i-15]+q[i-31];
                            end
                        else if(i>240 && i<255)
                            begin
                                s=q[i-1]+q[i+1]+q[i-17]+q[i-16]+q[i-15]+q[i-239]+q[i-240]+q[i-241];
                            end
                        else
                            begin
                                s=q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17]+q[i-15]+q[i-16]+q[i-17];
                            end
                        if((s==0 || s==1)|| (s>=4))
                            begin
                                q[i]<=0;
                            end
                        else if (s==3)
                            begin
                                q[i]<=1;
                            end
                    end
            end
        end         
endmodule
