module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign outv[0]=vec[0];
    assign outv[1]=vec[1];
    assign outv[2]=vec[2];
    assign o2=vec[2];
    assign o1=vec[1];
    assign o0=vec[0];
endmodule
