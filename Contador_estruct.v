/* Generated by Yosys 0.9+4052 (git sha1 44520808, gcc 9.3.0-17ubuntu1~20.04 -fPIC -Os) */

(* top =  1  *)
(* src = "Contador_estruct.v:1.1-74.10" *)
module Contador_estruct(data_FIFO_0, data_FIFO_1, data_FIFO_2, data_FIFO_3, req, clk, state, idx, valid, data_out);
  wire _000_;
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
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  (* src = "Contador_estruct.v:7.11-7.14" *)
  input clk;
  (* src = "Contador_estruct.v:14.11-14.21" *)
  wire [4:0] contador_0;
  (* src = "Contador_estruct.v:14.23-14.33" *)
  wire [4:0] contador_1;
  (* src = "Contador_estruct.v:14.35-14.45" *)
  wire [4:0] contador_2;
  (* src = "Contador_estruct.v:14.47-14.57" *)
  wire [4:0] contador_3;
  (* src = "Contador_estruct.v:2.17-2.28" *)
  input [9:0] data_FIFO_0;
  (* src = "Contador_estruct.v:3.17-3.28" *)
  input [9:0] data_FIFO_1;
  (* src = "Contador_estruct.v:4.17-4.28" *)
  input [9:0] data_FIFO_2;
  (* src = "Contador_estruct.v:5.17-5.28" *)
  input [9:0] data_FIFO_3;
  (* src = "Contador_estruct.v:11.22-11.30" *)
  output [4:0] data_out;
  (* src = "Contador_estruct.v:9.17-9.20" *)
  input [1:0] idx;
  (* src = "Contador_estruct.v:6.11-6.14" *)
  input req;
  (* src = "Contador_estruct.v:8.17-8.22" *)
  input [3:0] state;
  (* src = "Contador_estruct.v:10.16-10.21" *)
  output valid;
  NOT _195_ (
    .A(contador_3[4]),
    .Y(_026_)
  );
  NOT _196_ (
    .A(contador_3[3]),
    .Y(_027_)
  );
  NOT _197_ (
    .A(contador_3[1]),
    .Y(_028_)
  );
  NOT _198_ (
    .A(contador_2[3]),
    .Y(_029_)
  );
  NOT _199_ (
    .A(contador_2[1]),
    .Y(_030_)
  );
  NOT _200_ (
    .A(contador_1[3]),
    .Y(_031_)
  );
  NOT _201_ (
    .A(contador_1[1]),
    .Y(_032_)
  );
  NOT _202_ (
    .A(contador_0[3]),
    .Y(_033_)
  );
  NOT _203_ (
    .A(contador_0[1]),
    .Y(_034_)
  );
  NOT _204_ (
    .A(idx[0]),
    .Y(_035_)
  );
  NOT _205_ (
    .A(idx[1]),
    .Y(_036_)
  );
  NOT _206_ (
    .A(state[0]),
    .Y(_037_)
  );
  NOR _207_ (
    .A(data_FIFO_3[6]),
    .B(data_FIFO_3[7]),
    .Y(_038_)
  );
  NOR _208_ (
    .A(data_FIFO_3[8]),
    .B(data_FIFO_3[9]),
    .Y(_039_)
  );
  NAND _209_ (
    .A(_038_),
    .B(_039_),
    .Y(_040_)
  );
  NOR _210_ (
    .A(data_FIFO_3[0]),
    .B(data_FIFO_3[1]),
    .Y(_041_)
  );
  NOR _211_ (
    .A(data_FIFO_3[3]),
    .B(data_FIFO_3[4]),
    .Y(_042_)
  );
  NOR _212_ (
    .A(data_FIFO_3[2]),
    .B(data_FIFO_3[5]),
    .Y(_043_)
  );
  NAND _213_ (
    .A(_041_),
    .B(_043_),
    .Y(_044_)
  );
  NOR _214_ (
    .A(_040_),
    .B(_044_),
    .Y(_045_)
  );
  NAND _215_ (
    .A(_042_),
    .B(_045_),
    .Y(_046_)
  );
  NAND _216_ (
    .A(contador_3[0]),
    .B(_046_),
    .Y(_047_)
  );
  NOR _217_ (
    .A(_028_),
    .B(_047_),
    .Y(_048_)
  );
  NAND _218_ (
    .A(contador_3[2]),
    .B(_048_),
    .Y(_049_)
  );
  NOT _219_ (
    .A(_049_),
    .Y(_050_)
  );
  NAND _220_ (
    .A(contador_3[3]),
    .B(_050_),
    .Y(_051_)
  );
  NOR _221_ (
    .A(state[1]),
    .B(state[3]),
    .Y(_052_)
  );
  NOR _222_ (
    .A(state[2]),
    .B(_037_),
    .Y(_053_)
  );
  NAND _223_ (
    .A(_052_),
    .B(_053_),
    .Y(_054_)
  );
  NOT _224_ (
    .A(_054_),
    .Y(_055_)
  );
  NAND _225_ (
    .A(_027_),
    .B(_049_),
    .Y(_056_)
  );
  NAND _226_ (
    .A(_051_),
    .B(_056_),
    .Y(_057_)
  );
  NOR _227_ (
    .A(_055_),
    .B(_057_),
    .Y(_024_)
  );
  NOR _228_ (
    .A(contador_3[2]),
    .B(_048_),
    .Y(_058_)
  );
  NAND _229_ (
    .A(_049_),
    .B(_054_),
    .Y(_059_)
  );
  NOR _230_ (
    .A(_058_),
    .B(_059_),
    .Y(_023_)
  );
  NAND _231_ (
    .A(_028_),
    .B(_047_),
    .Y(_060_)
  );
  NAND _232_ (
    .A(_054_),
    .B(_060_),
    .Y(_061_)
  );
  NOR _233_ (
    .A(_048_),
    .B(_061_),
    .Y(_022_)
  );
  NOR _234_ (
    .A(contador_3[0]),
    .B(_046_),
    .Y(_062_)
  );
  NAND _235_ (
    .A(_047_),
    .B(_054_),
    .Y(_063_)
  );
  NOR _236_ (
    .A(_062_),
    .B(_063_),
    .Y(_021_)
  );
  NOR _237_ (
    .A(data_FIFO_2[6]),
    .B(data_FIFO_2[7]),
    .Y(_064_)
  );
  NOR _238_ (
    .A(data_FIFO_2[8]),
    .B(data_FIFO_2[9]),
    .Y(_065_)
  );
  NAND _239_ (
    .A(_064_),
    .B(_065_),
    .Y(_066_)
  );
  NOR _240_ (
    .A(data_FIFO_2[0]),
    .B(data_FIFO_2[1]),
    .Y(_067_)
  );
  NOR _241_ (
    .A(data_FIFO_2[3]),
    .B(data_FIFO_2[4]),
    .Y(_068_)
  );
  NOR _242_ (
    .A(data_FIFO_2[2]),
    .B(data_FIFO_2[5]),
    .Y(_069_)
  );
  NAND _243_ (
    .A(_067_),
    .B(_069_),
    .Y(_070_)
  );
  NOR _244_ (
    .A(_066_),
    .B(_070_),
    .Y(_071_)
  );
  NAND _245_ (
    .A(_068_),
    .B(_071_),
    .Y(_072_)
  );
  NAND _246_ (
    .A(contador_2[0]),
    .B(_072_),
    .Y(_073_)
  );
  NOR _247_ (
    .A(_030_),
    .B(_073_),
    .Y(_074_)
  );
  NAND _248_ (
    .A(contador_2[2]),
    .B(_074_),
    .Y(_075_)
  );
  NOR _249_ (
    .A(_029_),
    .B(_075_),
    .Y(_076_)
  );
  NOR _250_ (
    .A(contador_2[4]),
    .B(_076_),
    .Y(_077_)
  );
  NAND _251_ (
    .A(contador_2[4]),
    .B(_076_),
    .Y(_078_)
  );
  NAND _252_ (
    .A(_054_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _253_ (
    .A(_077_),
    .B(_079_),
    .Y(_020_)
  );
  NAND _254_ (
    .A(_029_),
    .B(_075_),
    .Y(_080_)
  );
  NAND _255_ (
    .A(_054_),
    .B(_080_),
    .Y(_081_)
  );
  NOR _256_ (
    .A(_076_),
    .B(_081_),
    .Y(_019_)
  );
  NOR _257_ (
    .A(contador_2[2]),
    .B(_074_),
    .Y(_082_)
  );
  NAND _258_ (
    .A(_054_),
    .B(_075_),
    .Y(_083_)
  );
  NOR _259_ (
    .A(_082_),
    .B(_083_),
    .Y(_018_)
  );
  NAND _260_ (
    .A(_030_),
    .B(_073_),
    .Y(_084_)
  );
  NAND _261_ (
    .A(_054_),
    .B(_084_),
    .Y(_085_)
  );
  NOR _262_ (
    .A(_074_),
    .B(_085_),
    .Y(_017_)
  );
  NOR _263_ (
    .A(contador_2[0]),
    .B(_072_),
    .Y(_086_)
  );
  NAND _264_ (
    .A(_054_),
    .B(_073_),
    .Y(_087_)
  );
  NOR _265_ (
    .A(_086_),
    .B(_087_),
    .Y(_016_)
  );
  NOR _266_ (
    .A(data_FIFO_1[6]),
    .B(data_FIFO_1[7]),
    .Y(_088_)
  );
  NOR _267_ (
    .A(data_FIFO_1[8]),
    .B(data_FIFO_1[9]),
    .Y(_089_)
  );
  NAND _268_ (
    .A(_088_),
    .B(_089_),
    .Y(_090_)
  );
  NOR _269_ (
    .A(data_FIFO_1[0]),
    .B(data_FIFO_1[1]),
    .Y(_091_)
  );
  NOR _270_ (
    .A(data_FIFO_1[3]),
    .B(data_FIFO_1[4]),
    .Y(_092_)
  );
  NOR _271_ (
    .A(data_FIFO_1[2]),
    .B(data_FIFO_1[5]),
    .Y(_093_)
  );
  NAND _272_ (
    .A(_091_),
    .B(_093_),
    .Y(_094_)
  );
  NOR _273_ (
    .A(_090_),
    .B(_094_),
    .Y(_095_)
  );
  NAND _274_ (
    .A(_092_),
    .B(_095_),
    .Y(_096_)
  );
  NAND _275_ (
    .A(contador_1[0]),
    .B(_096_),
    .Y(_097_)
  );
  NOR _276_ (
    .A(_032_),
    .B(_097_),
    .Y(_098_)
  );
  NAND _277_ (
    .A(contador_1[2]),
    .B(_098_),
    .Y(_099_)
  );
  NOR _278_ (
    .A(_031_),
    .B(_099_),
    .Y(_100_)
  );
  NOR _279_ (
    .A(contador_1[4]),
    .B(_100_),
    .Y(_101_)
  );
  NAND _280_ (
    .A(contador_1[4]),
    .B(_100_),
    .Y(_102_)
  );
  NAND _281_ (
    .A(_054_),
    .B(_102_),
    .Y(_103_)
  );
  NOR _282_ (
    .A(_101_),
    .B(_103_),
    .Y(_015_)
  );
  NAND _283_ (
    .A(_031_),
    .B(_099_),
    .Y(_104_)
  );
  NAND _284_ (
    .A(_054_),
    .B(_104_),
    .Y(_105_)
  );
  NOR _285_ (
    .A(_100_),
    .B(_105_),
    .Y(_014_)
  );
  NOR _286_ (
    .A(contador_1[2]),
    .B(_098_),
    .Y(_106_)
  );
  NAND _287_ (
    .A(_054_),
    .B(_099_),
    .Y(_107_)
  );
  NOR _288_ (
    .A(_106_),
    .B(_107_),
    .Y(_013_)
  );
  NAND _289_ (
    .A(_032_),
    .B(_097_),
    .Y(_108_)
  );
  NAND _290_ (
    .A(_054_),
    .B(_108_),
    .Y(_109_)
  );
  NOR _291_ (
    .A(_098_),
    .B(_109_),
    .Y(_012_)
  );
  NOR _292_ (
    .A(contador_1[0]),
    .B(_096_),
    .Y(_110_)
  );
  NAND _293_ (
    .A(_054_),
    .B(_097_),
    .Y(_111_)
  );
  NOR _294_ (
    .A(_110_),
    .B(_111_),
    .Y(_011_)
  );
  NOR _295_ (
    .A(data_FIFO_0[6]),
    .B(data_FIFO_0[7]),
    .Y(_112_)
  );
  NOR _296_ (
    .A(data_FIFO_0[8]),
    .B(data_FIFO_0[9]),
    .Y(_113_)
  );
  NAND _297_ (
    .A(_112_),
    .B(_113_),
    .Y(_114_)
  );
  NOR _298_ (
    .A(data_FIFO_0[0]),
    .B(data_FIFO_0[1]),
    .Y(_115_)
  );
  NOR _299_ (
    .A(data_FIFO_0[3]),
    .B(data_FIFO_0[4]),
    .Y(_116_)
  );
  NOR _300_ (
    .A(data_FIFO_0[2]),
    .B(data_FIFO_0[5]),
    .Y(_117_)
  );
  NAND _301_ (
    .A(_115_),
    .B(_117_),
    .Y(_118_)
  );
  NOR _302_ (
    .A(_114_),
    .B(_118_),
    .Y(_119_)
  );
  NAND _303_ (
    .A(_116_),
    .B(_119_),
    .Y(_120_)
  );
  NAND _304_ (
    .A(contador_0[0]),
    .B(_120_),
    .Y(_121_)
  );
  NOR _305_ (
    .A(_034_),
    .B(_121_),
    .Y(_122_)
  );
  NAND _306_ (
    .A(contador_0[2]),
    .B(_122_),
    .Y(_123_)
  );
  NOR _307_ (
    .A(_033_),
    .B(_123_),
    .Y(_124_)
  );
  NOR _308_ (
    .A(contador_0[4]),
    .B(_124_),
    .Y(_125_)
  );
  NAND _309_ (
    .A(contador_0[4]),
    .B(_124_),
    .Y(_126_)
  );
  NAND _310_ (
    .A(_054_),
    .B(_126_),
    .Y(_127_)
  );
  NOR _311_ (
    .A(_125_),
    .B(_127_),
    .Y(_010_)
  );
  NAND _312_ (
    .A(_033_),
    .B(_123_),
    .Y(_128_)
  );
  NAND _313_ (
    .A(_054_),
    .B(_128_),
    .Y(_129_)
  );
  NOR _314_ (
    .A(_124_),
    .B(_129_),
    .Y(_009_)
  );
  NOR _315_ (
    .A(contador_0[2]),
    .B(_122_),
    .Y(_130_)
  );
  NAND _316_ (
    .A(_054_),
    .B(_123_),
    .Y(_131_)
  );
  NOR _317_ (
    .A(_130_),
    .B(_131_),
    .Y(_008_)
  );
  NAND _318_ (
    .A(_034_),
    .B(_121_),
    .Y(_132_)
  );
  NAND _319_ (
    .A(_054_),
    .B(_132_),
    .Y(_133_)
  );
  NOR _320_ (
    .A(_122_),
    .B(_133_),
    .Y(_007_)
  );
  NOR _321_ (
    .A(contador_0[0]),
    .B(_120_),
    .Y(_134_)
  );
  NAND _322_ (
    .A(_054_),
    .B(_121_),
    .Y(_135_)
  );
  NOR _323_ (
    .A(_134_),
    .B(_135_),
    .Y(_006_)
  );
  NAND _324_ (
    .A(state[2]),
    .B(req),
    .Y(_136_)
  );
  NAND _325_ (
    .A(_037_),
    .B(_052_),
    .Y(_137_)
  );
  NOR _326_ (
    .A(_136_),
    .B(_137_),
    .Y(_000_)
  );
  NOR _327_ (
    .A(idx[0]),
    .B(idx[1]),
    .Y(_138_)
  );
  NAND _328_ (
    .A(contador_0[4]),
    .B(_138_),
    .Y(_139_)
  );
  NOR _329_ (
    .A(_035_),
    .B(_036_),
    .Y(_140_)
  );
  NAND _330_ (
    .A(contador_3[4]),
    .B(_140_),
    .Y(_141_)
  );
  NAND _331_ (
    .A(_139_),
    .B(_141_),
    .Y(_142_)
  );
  NOR _332_ (
    .A(idx[0]),
    .B(_036_),
    .Y(_143_)
  );
  NAND _333_ (
    .A(contador_2[4]),
    .B(_143_),
    .Y(_144_)
  );
  NOR _334_ (
    .A(_035_),
    .B(idx[1]),
    .Y(_145_)
  );
  NAND _335_ (
    .A(contador_1[4]),
    .B(_145_),
    .Y(_146_)
  );
  NAND _336_ (
    .A(_144_),
    .B(_146_),
    .Y(_147_)
  );
  NOR _337_ (
    .A(_142_),
    .B(_147_),
    .Y(_148_)
  );
  NOR _338_ (
    .A(data_out[4]),
    .B(_000_),
    .Y(_149_)
  );
  NAND _339_ (
    .A(_000_),
    .B(_148_),
    .Y(_150_)
  );
  NAND _340_ (
    .A(_054_),
    .B(_150_),
    .Y(_151_)
  );
  NOR _341_ (
    .A(_149_),
    .B(_151_),
    .Y(_005_)
  );
  NAND _342_ (
    .A(contador_3[3]),
    .B(_140_),
    .Y(_152_)
  );
  NAND _343_ (
    .A(contador_2[3]),
    .B(_143_),
    .Y(_153_)
  );
  NAND _344_ (
    .A(contador_0[3]),
    .B(_138_),
    .Y(_154_)
  );
  NAND _345_ (
    .A(contador_1[3]),
    .B(_145_),
    .Y(_155_)
  );
  NAND _346_ (
    .A(_152_),
    .B(_154_),
    .Y(_156_)
  );
  NAND _347_ (
    .A(_153_),
    .B(_155_),
    .Y(_157_)
  );
  NOR _348_ (
    .A(_156_),
    .B(_157_),
    .Y(_158_)
  );
  NOR _349_ (
    .A(data_out[3]),
    .B(_000_),
    .Y(_159_)
  );
  NAND _350_ (
    .A(_000_),
    .B(_158_),
    .Y(_160_)
  );
  NAND _351_ (
    .A(_054_),
    .B(_160_),
    .Y(_161_)
  );
  NOR _352_ (
    .A(_159_),
    .B(_161_),
    .Y(_004_)
  );
  NAND _353_ (
    .A(contador_3[2]),
    .B(_140_),
    .Y(_162_)
  );
  NAND _354_ (
    .A(contador_2[2]),
    .B(_143_),
    .Y(_163_)
  );
  NAND _355_ (
    .A(contador_0[2]),
    .B(_138_),
    .Y(_164_)
  );
  NAND _356_ (
    .A(contador_1[2]),
    .B(_145_),
    .Y(_165_)
  );
  NAND _357_ (
    .A(_162_),
    .B(_164_),
    .Y(_166_)
  );
  NAND _358_ (
    .A(_163_),
    .B(_165_),
    .Y(_167_)
  );
  NOR _359_ (
    .A(_166_),
    .B(_167_),
    .Y(_168_)
  );
  NOR _360_ (
    .A(data_out[2]),
    .B(_000_),
    .Y(_169_)
  );
  NAND _361_ (
    .A(_000_),
    .B(_168_),
    .Y(_170_)
  );
  NAND _362_ (
    .A(_054_),
    .B(_170_),
    .Y(_171_)
  );
  NOR _363_ (
    .A(_169_),
    .B(_171_),
    .Y(_003_)
  );
  NAND _364_ (
    .A(contador_0[1]),
    .B(_138_),
    .Y(_172_)
  );
  NAND _365_ (
    .A(contador_3[1]),
    .B(_140_),
    .Y(_173_)
  );
  NAND _366_ (
    .A(_172_),
    .B(_173_),
    .Y(_174_)
  );
  NAND _367_ (
    .A(contador_2[1]),
    .B(_143_),
    .Y(_175_)
  );
  NAND _368_ (
    .A(contador_1[1]),
    .B(_145_),
    .Y(_176_)
  );
  NAND _369_ (
    .A(_175_),
    .B(_176_),
    .Y(_177_)
  );
  NOR _370_ (
    .A(_174_),
    .B(_177_),
    .Y(_178_)
  );
  NOR _371_ (
    .A(data_out[1]),
    .B(_000_),
    .Y(_179_)
  );
  NAND _372_ (
    .A(_000_),
    .B(_178_),
    .Y(_180_)
  );
  NAND _373_ (
    .A(_054_),
    .B(_180_),
    .Y(_181_)
  );
  NOR _374_ (
    .A(_179_),
    .B(_181_),
    .Y(_002_)
  );
  NAND _375_ (
    .A(contador_3[0]),
    .B(_140_),
    .Y(_182_)
  );
  NAND _376_ (
    .A(contador_2[0]),
    .B(_143_),
    .Y(_183_)
  );
  NAND _377_ (
    .A(contador_0[0]),
    .B(_138_),
    .Y(_184_)
  );
  NAND _378_ (
    .A(contador_1[0]),
    .B(_145_),
    .Y(_185_)
  );
  NAND _379_ (
    .A(_182_),
    .B(_184_),
    .Y(_186_)
  );
  NAND _380_ (
    .A(_183_),
    .B(_185_),
    .Y(_187_)
  );
  NOR _381_ (
    .A(_186_),
    .B(_187_),
    .Y(_188_)
  );
  NOR _382_ (
    .A(data_out[0]),
    .B(_000_),
    .Y(_189_)
  );
  NAND _383_ (
    .A(_000_),
    .B(_188_),
    .Y(_190_)
  );
  NAND _384_ (
    .A(_054_),
    .B(_190_),
    .Y(_191_)
  );
  NOR _385_ (
    .A(_189_),
    .B(_191_),
    .Y(_001_)
  );
  NOR _386_ (
    .A(_026_),
    .B(_051_),
    .Y(_192_)
  );
  NAND _387_ (
    .A(_026_),
    .B(_051_),
    .Y(_193_)
  );
  NAND _388_ (
    .A(_054_),
    .B(_193_),
    .Y(_194_)
  );
  NOR _389_ (
    .A(_192_),
    .B(_194_),
    .Y(_025_)
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _390_ (
    .C(clk),
    .D(_000_),
    .Q(valid)
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _391_ (
    .C(clk),
    .D(_001_),
    .Q(data_out[0])
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _392_ (
    .C(clk),
    .D(_002_),
    .Q(data_out[1])
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _393_ (
    .C(clk),
    .D(_003_),
    .Q(data_out[2])
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _394_ (
    .C(clk),
    .D(_004_),
    .Q(data_out[3])
  );
  (* src = "Contador_estruct.v:43.1-72.4" *)
  DFF _395_ (
    .C(clk),
    .D(_005_),
    .Q(data_out[4])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _396_ (
    .C(clk),
    .D(_006_),
    .Q(contador_0[0])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _397_ (
    .C(clk),
    .D(_007_),
    .Q(contador_0[1])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _398_ (
    .C(clk),
    .D(_008_),
    .Q(contador_0[2])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _399_ (
    .C(clk),
    .D(_009_),
    .Q(contador_0[3])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _400_ (
    .C(clk),
    .D(_010_),
    .Q(contador_0[4])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _401_ (
    .C(clk),
    .D(_011_),
    .Q(contador_1[0])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _402_ (
    .C(clk),
    .D(_012_),
    .Q(contador_1[1])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _403_ (
    .C(clk),
    .D(_013_),
    .Q(contador_1[2])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _404_ (
    .C(clk),
    .D(_014_),
    .Q(contador_1[3])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _405_ (
    .C(clk),
    .D(_015_),
    .Q(contador_1[4])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _406_ (
    .C(clk),
    .D(_016_),
    .Q(contador_2[0])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _407_ (
    .C(clk),
    .D(_017_),
    .Q(contador_2[1])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _408_ (
    .C(clk),
    .D(_018_),
    .Q(contador_2[2])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _409_ (
    .C(clk),
    .D(_019_),
    .Q(contador_2[3])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _410_ (
    .C(clk),
    .D(_020_),
    .Q(contador_2[4])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _411_ (
    .C(clk),
    .D(_021_),
    .Q(contador_3[0])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _412_ (
    .C(clk),
    .D(_022_),
    .Q(contador_3[1])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _413_ (
    .C(clk),
    .D(_023_),
    .Q(contador_3[2])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _414_ (
    .C(clk),
    .D(_024_),
    .Q(contador_3[3])
  );
  (* src = "Contador_estruct.v:17.1-40.4" *)
  DFF _415_ (
    .C(clk),
    .D(_025_),
    .Q(contador_3[4])
  );
endmodule
