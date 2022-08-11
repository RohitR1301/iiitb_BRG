/* Generated by Yosys 0.19+36 (git sha1 15393442d61, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module iiitb_brg(clk, reset, sel, clkout);
  wire [5:0] _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire [3:0] _144_;
  wire [3:0] _145_;
  wire [1:0] _146_;
  wire [1:0] _147_;
  wire [2:0] _148_;
  wire [2:0] _149_;
  input clk;
  wire clk;
  output clkout;
  reg clkout;
  reg [5:0] cnt1 = 6'h00;
  reg [1:0] cnt2 = 2'h0;
  reg [2:0] cnt3 = 3'h0;
  reg [3:0] cnt4 = 4'h0;
  input reset;
  wire reset;
  input [1:0] sel;
  wire [1:0] sel;
  sky130_fd_sc_hd__clkinv_1 _150_ (
    .A(_104_),
    .Y(_092_)
  );
  sky130_fd_sc_hd__clkinv_1 _151_ (
    .A(_109_),
    .Y(_088_)
  );
  sky130_fd_sc_hd__clkinv_1 _152_ (
    .A(_106_),
    .Y(_094_)
  );
  sky130_fd_sc_hd__clkinv_1 _153_ (
    .A(_097_),
    .Y(_087_)
  );
  sky130_fd_sc_hd__nor2b_1 _154_ (
    .A(_107_),
    .B_N(_106_),
    .Y(_113_)
  );
  sky130_fd_sc_hd__a21oi_1 _155_ (
    .A1(_108_),
    .A2(_113_),
    .B1(_141_),
    .Y(_085_)
  );
  sky130_fd_sc_hd__nor2b_1 _156_ (
    .A(_104_),
    .B_N(_105_),
    .Y(_114_)
  );
  sky130_fd_sc_hd__nor2_1 _157_ (
    .A(_141_),
    .B(_114_),
    .Y(_086_)
  );
  sky130_fd_sc_hd__nor2_1 _158_ (
    .A(_100_),
    .B(_102_),
    .Y(_115_)
  );
  sky130_fd_sc_hd__nor3b_1 _159_ (
    .A(_099_),
    .B(_101_),
    .C_N(_098_),
    .Y(_116_)
  );
  sky130_fd_sc_hd__nand3_1 _160_ (
    .A(_103_),
    .B(_115_),
    .C(_116_),
    .Y(_117_)
  );
  sky130_fd_sc_hd__a31oi_1 _161_ (
    .A1(_103_),
    .A2(_115_),
    .A3(_116_),
    .B1(_141_),
    .Y(_118_)
  );
  sky130_fd_sc_hd__nand2_1 _162_ (
    .A(_109_),
    .B(_110_),
    .Y(_119_)
  );
  sky130_fd_sc_hd__and3b_1 _163_ (
    .A_N(_111_),
    .B(_110_),
    .C(_109_),
    .X(_120_)
  );
  sky130_fd_sc_hd__a21o_1 _164_ (
    .A1(_112_),
    .A2(_120_),
    .B1(_141_),
    .X(_084_)
  );
  sky130_fd_sc_hd__nand2_1 _165_ (
    .A(_142_),
    .B(_143_),
    .Y(_121_)
  );
  sky130_fd_sc_hd__a211oi_1 _166_ (
    .A1(_112_),
    .A2(_120_),
    .B1(_121_),
    .C1(_141_),
    .Y(_122_)
  );
  sky130_fd_sc_hd__nand2b_1 _167_ (
    .A_N(_143_),
    .B(_142_),
    .Y(_123_)
  );
  sky130_fd_sc_hd__nor3_1 _168_ (
    .A(_141_),
    .B(_114_),
    .C(_123_),
    .Y(_124_)
  );
  sky130_fd_sc_hd__nand2b_1 _169_ (
    .A_N(_142_),
    .B(_143_),
    .Y(_125_)
  );
  sky130_fd_sc_hd__a211oi_1 _170_ (
    .A1(_108_),
    .A2(_113_),
    .B1(_125_),
    .C1(_141_),
    .Y(_126_)
  );
  sky130_fd_sc_hd__nor3_1 _171_ (
    .A(_122_),
    .B(_124_),
    .C(_126_),
    .Y(_127_)
  );
  sky130_fd_sc_hd__o21ba_1 _172_ (
    .A1(_117_),
    .A2(_127_),
    .B1_N(_118_),
    .X(_083_)
  );
  sky130_fd_sc_hd__nor2_1 _173_ (
    .A(_118_),
    .B(_121_),
    .Y(_079_)
  );
  sky130_fd_sc_hd__nor2_1 _174_ (
    .A(_118_),
    .B(_125_),
    .Y(_080_)
  );
  sky130_fd_sc_hd__nor2_1 _175_ (
    .A(_118_),
    .B(_123_),
    .Y(_081_)
  );
  sky130_fd_sc_hd__nor2_1 _176_ (
    .A(_142_),
    .B(_143_),
    .Y(_128_)
  );
  sky130_fd_sc_hd__o21ai_0 _177_ (
    .A1(_142_),
    .A2(_143_),
    .B1(_141_),
    .Y(_082_)
  );
  sky130_fd_sc_hd__and2_0 _178_ (
    .A(_141_),
    .B(_128_),
    .X(_129_)
  );
  sky130_fd_sc_hd__nand2_1 _179_ (
    .A(_141_),
    .B(_128_),
    .Y(_130_)
  );
  sky130_fd_sc_hd__nor2_1 _180_ (
    .A(_098_),
    .B(_129_),
    .Y(_073_)
  );
  sky130_fd_sc_hd__nand2_1 _181_ (
    .A(_117_),
    .B(_130_),
    .Y(_131_)
  );
  sky130_fd_sc_hd__xnor2_1 _182_ (
    .A(_098_),
    .B(_099_),
    .Y(_132_)
  );
  sky130_fd_sc_hd__nor2_1 _183_ (
    .A(_131_),
    .B(_132_),
    .Y(_074_)
  );
  sky130_fd_sc_hd__and3_1 _184_ (
    .A(_098_),
    .B(_099_),
    .C(_100_),
    .X(_133_)
  );
  sky130_fd_sc_hd__a21oi_1 _185_ (
    .A1(_098_),
    .A2(_099_),
    .B1(_100_),
    .Y(_134_)
  );
  sky130_fd_sc_hd__nor3_1 _186_ (
    .A(_129_),
    .B(_133_),
    .C(_134_),
    .Y(_075_)
  );
  sky130_fd_sc_hd__and2_0 _187_ (
    .A(_101_),
    .B(_133_),
    .X(_135_)
  );
  sky130_fd_sc_hd__nor2_1 _188_ (
    .A(_101_),
    .B(_133_),
    .Y(_136_)
  );
  sky130_fd_sc_hd__nor3_1 _189_ (
    .A(_129_),
    .B(_135_),
    .C(_136_),
    .Y(_076_)
  );
  sky130_fd_sc_hd__o21ai_0 _190_ (
    .A1(_102_),
    .A2(_135_),
    .B1(_130_),
    .Y(_137_)
  );
  sky130_fd_sc_hd__a21oi_1 _191_ (
    .A1(_102_),
    .A2(_135_),
    .B1(_137_),
    .Y(_077_)
  );
  sky130_fd_sc_hd__a21oi_1 _192_ (
    .A1(_102_),
    .A2(_135_),
    .B1(_103_),
    .Y(_138_)
  );
  sky130_fd_sc_hd__a311oi_1 _193_ (
    .A1(_102_),
    .A2(_103_),
    .A3(_135_),
    .B1(_138_),
    .C1(_131_),
    .Y(_078_)
  );
  sky130_fd_sc_hd__xor2_1 _194_ (
    .A(_107_),
    .B(_106_),
    .X(_095_)
  );
  sky130_fd_sc_hd__nand2_1 _195_ (
    .A(_107_),
    .B(_106_),
    .Y(_139_)
  );
  sky130_fd_sc_hd__xnor2_1 _196_ (
    .A(_108_),
    .B(_139_),
    .Y(_096_)
  );
  sky130_fd_sc_hd__xor2_1 _197_ (
    .A(_104_),
    .B(_105_),
    .X(_093_)
  );
  sky130_fd_sc_hd__xor2_1 _198_ (
    .A(_109_),
    .B(_110_),
    .X(_089_)
  );
  sky130_fd_sc_hd__xnor2_1 _199_ (
    .A(_111_),
    .B(_119_),
    .Y(_090_)
  );
  sky130_fd_sc_hd__nand3_1 _200_ (
    .A(_109_),
    .B(_110_),
    .C(_111_),
    .Y(_140_)
  );
  sky130_fd_sc_hd__xnor2_1 _201_ (
    .A(_112_),
    .B(_140_),
    .Y(_091_)
  );
  always @(posedge clk)
    if (_004_) cnt1[0] <= _000_[0];
  always @(posedge clk)
    if (_004_) cnt1[1] <= _000_[1];
  always @(posedge clk)
    if (_004_) cnt1[2] <= _000_[2];
  always @(posedge clk)
    if (_004_) cnt1[3] <= _000_[3];
  always @(posedge clk)
    if (_004_) cnt1[4] <= _000_[4];
  always @(posedge clk)
    if (_004_) cnt1[5] <= _000_[5];
  always @(posedge clk)
    if (_003_)
      if (!_062_) cnt2[0] <= 1'h0;
      else cnt2[0] <= _146_[0];
  always @(posedge clk)
    if (_003_)
      if (!_062_) cnt2[1] <= 1'h0;
      else cnt2[1] <= _147_[1];
  always @(posedge clk)
    if (_005_)
      if (reset) clkout <= 1'h0;
      else clkout <= _072_;
  always @(posedge clk)
    if (_002_)
      if (!_057_) cnt3[0] <= 1'h0;
      else cnt3[0] <= _148_[0];
  always @(posedge clk)
    if (_002_)
      if (!_057_) cnt3[1] <= 1'h0;
      else cnt3[1] <= _149_[1];
  always @(posedge clk)
    if (_002_)
      if (!_057_) cnt3[2] <= 1'h0;
      else cnt3[2] <= _149_[2];
  always @(posedge clk)
    if (_001_)
      if (_006_) cnt4[0] <= 1'h0;
      else cnt4[0] <= _144_[0];
  always @(posedge clk)
    if (_001_)
      if (_006_) cnt4[1] <= 1'h0;
      else cnt4[1] <= _145_[1];
  always @(posedge clk)
    if (_001_)
      if (_006_) cnt4[2] <= 1'h0;
      else cnt4[2] <= _145_[2];
  always @(posedge clk)
    if (_001_)
      if (_006_) cnt4[3] <= 1'h0;
      else cnt4[3] <= _145_[3];
  assign _144_[3:1] = cnt4[3:1];
  assign _145_[0] = _144_[0];
  assign _146_[1] = cnt2[1];
  assign _147_[0] = _146_[0];
  assign _148_[2:1] = cnt3[2:1];
  assign _149_[0] = _148_[0];
  assign _104_ = cnt2[0];
  assign _146_[0] = _092_;
  assign _109_ = cnt4[0];
  assign _144_[0] = _088_;
  assign _142_ = sel[0];
  assign _143_ = sel[1];
  assign _141_ = reset;
  assign _098_ = cnt1[0];
  assign _099_ = cnt1[1];
  assign _101_ = cnt1[3];
  assign _100_ = cnt1[2];
  assign _102_ = cnt1[4];
  assign _103_ = cnt1[5];
  assign _110_ = cnt4[1];
  assign _111_ = cnt4[2];
  assign _112_ = cnt4[3];
  assign _107_ = cnt3[1];
  assign _106_ = cnt3[0];
  assign _108_ = cnt3[2];
  assign _057_ = _085_;
  assign _105_ = cnt2[1];
  assign _062_ = _086_;
  assign _005_ = _083_;
  assign _001_ = _079_;
  assign _148_[0] = _094_;
  assign _002_ = _080_;
  assign _003_ = _081_;
  assign _004_ = _082_;
  assign _006_ = _084_;
  assign _000_[0] = _073_;
  assign _000_[1] = _074_;
  assign _000_[2] = _075_;
  assign _000_[3] = _076_;
  assign _000_[4] = _077_;
  assign _000_[5] = _078_;
  assign _097_ = clkout;
  assign _072_ = _087_;
  assign _149_[1] = _095_;
  assign _149_[2] = _096_;
  assign _147_[1] = _093_;
  assign _145_[1] = _089_;
  assign _145_[2] = _090_;
  assign _145_[3] = _091_;
endmodule