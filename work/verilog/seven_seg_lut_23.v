/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_lut_23 (
    input [7:0] char,
    output reg [7:0] segs
  );
  
  
  
  always @* begin
    
    case (char)
      6'h30: begin
        segs = 8'h3f;
      end
      6'h31: begin
        segs = 8'h06;
      end
      6'h32: begin
        segs = 8'h5b;
      end
      6'h33: begin
        segs = 8'h4f;
      end
      6'h34: begin
        segs = 8'h66;
      end
      6'h35: begin
        segs = 8'h6d;
      end
      6'h36: begin
        segs = 8'h7d;
      end
      6'h37: begin
        segs = 8'h07;
      end
      6'h38: begin
        segs = 8'h7f;
      end
      6'h39: begin
        segs = 8'h67;
      end
      7'h61: begin
        segs = 8'hdc;
      end
      7'h41: begin
        segs = 8'h77;
      end
      7'h62: begin
        segs = 8'h7c;
      end
      7'h42: begin
        segs = 8'h7c;
      end
      7'h63: begin
        segs = 8'h58;
      end
      7'h43: begin
        segs = 8'h39;
      end
      7'h64: begin
        segs = 8'h5e;
      end
      7'h44: begin
        segs = 8'h5e;
      end
      7'h65: begin
        segs = 8'h79;
      end
      7'h45: begin
        segs = 8'h79;
      end
      7'h66: begin
        segs = 8'h71;
      end
      7'h46: begin
        segs = 8'h71;
      end
      7'h67: begin
        segs = 8'h6f;
      end
      7'h47: begin
        segs = 8'h7d;
      end
      7'h68: begin
        segs = 8'h74;
      end
      7'h48: begin
        segs = 8'h76;
      end
      7'h69: begin
        segs = 8'h10;
      end
      7'h49: begin
        segs = 8'h30;
      end
      7'h6a: begin
        segs = 8'h0c;
      end
      7'h4a: begin
        segs = 8'h0e;
      end
      7'h6b: begin
        segs = 8'h78;
      end
      7'h4b: begin
        segs = 8'h78;
      end
      7'h6c: begin
        segs = 8'h18;
      end
      7'h4c: begin
        segs = 8'h38;
      end
      7'h6e: begin
        segs = 8'h54;
      end
      7'h4e: begin
        segs = 8'h37;
      end
      7'h6f: begin
        segs = 8'h5c;
      end
      7'h4f: begin
        segs = 8'h3f;
      end
      7'h70: begin
        segs = 8'h73;
      end
      7'h50: begin
        segs = 8'h73;
      end
      7'h71: begin
        segs = 8'he7;
      end
      7'h51: begin
        segs = 8'hbf;
      end
      7'h72: begin
        segs = 8'h50;
      end
      7'h52: begin
        segs = 8'h33;
      end
      7'h73: begin
        segs = 8'h6d;
      end
      7'h53: begin
        segs = 8'h6d;
      end
      7'h74: begin
        segs = 8'h70;
      end
      7'h54: begin
        segs = 8'h31;
      end
      7'h75: begin
        segs = 8'h9c;
      end
      7'h55: begin
        segs = 8'hbe;
      end
      7'h56: begin
        segs = 8'h1c;
      end
      7'h56: begin
        segs = 8'h3e;
      end
      7'h78: begin
        segs = 8'h76;
      end
      7'h58: begin
        segs = 8'h76;
      end
      7'h79: begin
        segs = 8'h6e;
      end
      7'h59: begin
        segs = 8'h6e;
      end
      7'h7a: begin
        segs = 8'h5b;
      end
      7'h5a: begin
        segs = 8'h5b;
      end
      6'h20: begin
        segs = 8'h00;
      end
      6'h2d: begin
        segs = 8'h40;
      end
      7'h5f: begin
        segs = 8'h08;
      end
      6'h2e: begin
        segs = 8'h80;
      end
      default: begin
        segs = 8'h7f;
      end
    endcase
  end
endmodule
