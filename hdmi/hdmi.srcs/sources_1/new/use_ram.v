`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/09 19:36:03
// Design Name: 
// Module Name: use_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module use_ram();
    reg use_ram_clk;        //总的时钟
    reg use_ram_ena;        //ram中a口的使能信号
    reg use_ram_wea;        //ram中a口的写使能信号
    reg [17:0] use_ram_addra;     //ram中a口地址的信号
    reg [7:0] use_ram_dina;       //ram中a口的输入数据
    reg use_ram_enb;              //ram中b口的使能数据
    reg [17:0] use_ram_addrb;     //ram中b口的地址信号
    wire [7:0] use_ram_doutb;     //ram中b口的输出数据
    reg [23:0] rgb_data;        //rgb_2_dvi中的rgb数据，因为ram中是八位数据，因此要攒够三个周期送一次数据
    wire rgb2dvi_reset;         //与rgb2dvi的reset口相连
    reg rgb2dvi_PixelClk;       //与rgb2dvi的像素时钟口相连
    reg reg2dvi_pVSync;         //像素垂直方向的同步。（还没问老师
    reg reg2dvi_pHSync;         //像素水平方向的同步。（还没问老师
    blk_mem_gen_0   blk_mem_gen_real(.clka(use_ram_clk),.ena(use_ram_ena),
                        .wea(use_ram_wea),.addra(use_ram_addra),.dina(use_ram_dina),
                    .clkb(use_ram_clk),.enb(use_ram_enb),.addrb(use_ram_addrb),
                      .doutb(doutb));
    rgb2dvi_0 rgb2dvi_0_real(.vid_pData(rgb_data),.vid_pHSync(),.vid_pVSync(),.vid_pVDE(),.aRst()
                            ,.PixelClk(rgb2dvi_PixelClk),.TMDS_Clk_p(),.TMDS_Clk_n(),.TMDS_Data_p(),TMDS_Data_n());
    initial
    fork
      use_ram_clk = 0;
      use_ram_ena = 0;//用不到a口所以设为0;
      use_ram_wea = 0;//用不到a口所以设为0;
      use_ram_addra = 18'b0;//因为用不到a的地址，所以设为零。
      use_ram_dina = 8'b0;       //ram中a口的输入数据
      use_ram_enb = 1;              //ram中b口的使能数据设为1。
      //count_clk = 11'b0;          计数时钟信号，使得读完ram中的数据之后将a口和b口的使能信号变为不使能
      use_ram_addrb = 18'b0;     //ram中b口的地址信号
      rgb_data = 24'b0;
      rgb2dvi_reset = 0;
      rgb2dvi_PixelClk = 0;     //这是rgb2dvi的时钟，但是是6ps为一个周期。
    join

    always
      #1  use_ram_clk = ~use_ram_clk;       //时钟周期为2ps
    
    always
    begin
      if (use_ram_addrb == 235201)
        use_ram_addrb = 0;  
      else
        #2 use_ram_addrb = use_ram_addrb + 1;  //相应的，每个时钟周期上升沿之后在换成新的地址，每次加一，最后加到最大会变为0重新记。

    end
    
    always 
      #2  count_clk = count_clk + 1;          //每个时钟周期都加一
      
    always
      #2  rgb_data = {rgb_data[15:0],use_ram_doutb[7:0]};//每个时钟周期把一个数据存入中间寄存器，凑够24位再传给rgb2dvi

    always
    begin
      #5  rgb2dvi_PixelClk = 1;
      #1  rgb2dvi_PixelClk = 0;           //周期为6，一个周期中，前5ps都是低电平，还有1ps是高电平
    end

endmodule
