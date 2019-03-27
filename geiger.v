`include "uart_tx.v"
`default_nettype none
module geiger(
	input 	clk,
    output  LED1,
    output  LED2,
    output  LED3,
    output  LED4,
    output  LED5,
    input   PMOD1,  // reset
	output RS232_Tx
	);
	parameter WIDTH = 4;
	
	reg bit_q;
	reg bit_d;
	reg [WIDTH-1:0] output_q;
	reg [WIDTH-1:0] output_d;
	reg [WIDTH-1:0] count_q;
	reg [WIDTH-1:0] count_d;
	
	reg tx_data_valid_q;
	reg tx_data_valid_d;
	
	reg transmitting;

	wire pulse;
	


	assign pulse = PMOD1;
	
	assign LED1 = output_q[0];
	assign LED2 = output_q[1];
	assign LED3 = output_q[2];
	assign LED4 = output_q[3];
	assign LED5 = tx_data_valid_q;
	
	
	always @ (posedge clk) begin
			bit_q <= bit_d;
			output_q <= output_d;
			count_q <= count_d;
			tx_data_valid_q <= tx_data_valid_d;	
	end
	
	
	always @ (*) begin
			count_d = count_q;
			tx_data_valid_d = tx_data_valid_q;
			
			
			count_d++;
			
			if(pulse) begin
				tx_data_valid_d = 1;
			end
			
			if(tx_data_valid_q) begin
				tx_data_valid_d = 0;
			end
			
			
	end
	
	
	
	

	always @ (posedge pulse) begin
			bit_d = ~bit_q;
			output_d = count_q;
	end
		

	uart_tx uut (
		.clk (clk),
		.tx_data ({4'b0,output_q}),
		.tx_data_valid (tx_data_valid_q),
		.tx (RS232_Tx),
		.transmitting (transmitting)
	);



	
	
endmodule 