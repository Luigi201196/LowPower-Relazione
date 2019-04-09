
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fsm_adder is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_fsm_adder;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsm_adder.all;

entity datapath_adder_DW01_add_0 is

   port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (15 downto 0);  CO : out std_logic);

end datapath_adder_DW01_add_0;

architecture SYN_rpl of datapath_adder_DW01_add_0 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, n1,
      n_1002 : std_logic;

begin
   
   U1_15 : FA_X1 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           n_1002, S => SUM(15));
   U1_14 : FA_X1 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : FA_X1 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : FA_X1 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : FA_X1 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : FA_X1 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : FA_X1 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : FA_X1 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : FA_X1 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : FA_X1 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : FA_X1 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : FA_X1 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => n1, CO => carry_2_port, S
                           => SUM(1));
   U2 : XOR2_X1 port map( A => B(0), B => A(0), Z => SUM(0));
   U1 : AND2_X1 port map( A1 => B(0), A2 => A(0), ZN => n1);

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsm_adder.all;

entity datapath_adder is

   port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
         std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10, 
         SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));

end datapath_adder;

architecture SYN_behavioral of datapath_adder is

   component NOR2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component datapath_adder_DW01_add_0
      port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (15 downto 0);  CO : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal operanda_15_port, operanda_14_port, operanda_13_port, 
      operanda_12_port, operanda_11_port, operanda_10_port, operanda_9_port, 
      operanda_8_port, operanda_7_port, operanda_6_port, operanda_5_port, 
      operanda_4_port, operanda_3_port, operanda_2_port, operanda_1_port, 
      operanda_0_port, operandb_15_port, operandb_14_port, operandb_13_port, 
      operandb_12_port, operandb_11_port, operandb_10_port, operandb_9_port, 
      operandb_8_port, operandb_7_port, operandb_6_port, operandb_5_port, 
      operandb_4_port, operandb_3_port, operandb_2_port, operandb_1_port, 
      operandb_0_port, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, 
      N36, N37, N38, N39, N40, n2, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15
      , n16, n17, n18, n19, n20, n21, n22, n23, n24, n25_port, n26_port, 
      n27_port, n28_port, n29_port, n30_port, n31_port, n32_port, n33_port, 
      n34_port, n35_port, n36_port, n37_port, n38_port, n39_port, n40_port, n41
      , n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, 
      n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70
      , n71, n72, n73, n74, n75, n76, n77, n491, n492, n493, n_1003, n_1004, 
      n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, 
      n_1014, n_1015, n_1016, n_1017, n_1018, n_1019 : std_logic;

begin
   
   SUM_reg_15_inst : DFFR_X1 port map( D => N40, CK => clock, RN => n493, Q => 
                           SUM(15), QN => n_1003);
   SUM_reg_14_inst : DFFR_X1 port map( D => N39, CK => clock, RN => n493, Q => 
                           SUM(14), QN => n_1004);
   SUM_reg_13_inst : DFFR_X1 port map( D => N38, CK => clock, RN => n493, Q => 
                           SUM(13), QN => n_1005);
   SUM_reg_12_inst : DFFR_X1 port map( D => N37, CK => clock, RN => n493, Q => 
                           SUM(12), QN => n_1006);
   SUM_reg_11_inst : DFFR_X1 port map( D => N36, CK => clock, RN => n493, Q => 
                           SUM(11), QN => n_1007);
   SUM_reg_10_inst : DFFR_X1 port map( D => N35, CK => clock, RN => n493, Q => 
                           SUM(10), QN => n_1008);
   SUM_reg_9_inst : DFFR_X1 port map( D => N34, CK => clock, RN => n493, Q => 
                           SUM(9), QN => n_1009);
   SUM_reg_8_inst : DFFR_X1 port map( D => N33, CK => clock, RN => n493, Q => 
                           SUM(8), QN => n_1010);
   SUM_reg_7_inst : DFFR_X1 port map( D => N32, CK => clock, RN => n493, Q => 
                           SUM(7), QN => n_1011);
   SUM_reg_6_inst : DFFR_X1 port map( D => N31, CK => clock, RN => n493, Q => 
                           SUM(6), QN => n_1012);
   SUM_reg_5_inst : DFFR_X1 port map( D => N30, CK => clock, RN => n493, Q => 
                           SUM(5), QN => n_1013);
   SUM_reg_4_inst : DFFR_X1 port map( D => N29, CK => clock, RN => n493, Q => 
                           SUM(4), QN => n_1014);
   SUM_reg_3_inst : DFFR_X1 port map( D => N28, CK => clock, RN => n493, Q => 
                           SUM(3), QN => n_1015);
   SUM_reg_2_inst : DFFR_X1 port map( D => N27, CK => clock, RN => n493, Q => 
                           SUM(2), QN => n_1016);
   SUM_reg_1_inst : DFFR_X1 port map( D => N26, CK => clock, RN => n493, Q => 
                           SUM(1), QN => n_1017);
   SUM_reg_0_inst : DFFR_X1 port map( D => N25, CK => clock, RN => n493, Q => 
                           SUM(0), QN => n_1018);
   n2 <= '0';
   U44 : AOI22_X1 port map( A1 => MUX12(9), A2 => n8, B1 => MUX13(9), B2 => n9,
                           ZN => n7);
   U45 : AOI22_X1 port map( A1 => MUX10(9), A2 => n10, B1 => MUX11(9), B2 => 
                           n11, ZN => n6);
   U46 : AOI22_X1 port map( A1 => MUX12(8), A2 => n8, B1 => MUX13(8), B2 => n9,
                           ZN => n13);
   U47 : AOI22_X1 port map( A1 => MUX10(8), A2 => n10, B1 => MUX11(8), B2 => 
                           n11, ZN => n12);
   U48 : AOI22_X1 port map( A1 => MUX12(7), A2 => n8, B1 => MUX13(7), B2 => n9,
                           ZN => n15);
   U49 : AOI22_X1 port map( A1 => MUX10(7), A2 => n10, B1 => MUX11(7), B2 => 
                           n11, ZN => n14);
   U50 : AOI22_X1 port map( A1 => MUX12(6), A2 => n8, B1 => MUX13(6), B2 => n9,
                           ZN => n17);
   U51 : AOI22_X1 port map( A1 => MUX10(6), A2 => n10, B1 => MUX11(6), B2 => 
                           n11, ZN => n16);
   U52 : AOI22_X1 port map( A1 => MUX12(5), A2 => n8, B1 => MUX13(5), B2 => n9,
                           ZN => n19);
   U53 : AOI22_X1 port map( A1 => MUX10(5), A2 => n10, B1 => MUX11(5), B2 => 
                           n11, ZN => n18);
   U54 : AOI22_X1 port map( A1 => MUX12(4), A2 => n8, B1 => MUX13(4), B2 => n9,
                           ZN => n21);
   U55 : AOI22_X1 port map( A1 => MUX10(4), A2 => n10, B1 => MUX11(4), B2 => 
                           n11, ZN => n20);
   U56 : AOI22_X1 port map( A1 => MUX12(3), A2 => n8, B1 => MUX13(3), B2 => n9,
                           ZN => n23);
   U57 : AOI22_X1 port map( A1 => MUX10(3), A2 => n10, B1 => MUX11(3), B2 => 
                           n11, ZN => n22);
   U58 : AOI22_X1 port map( A1 => MUX12(2), A2 => n8, B1 => MUX13(2), B2 => n9,
                           ZN => n25_port);
   U59 : AOI22_X1 port map( A1 => MUX10(2), A2 => n10, B1 => MUX11(2), B2 => 
                           n11, ZN => n24);
   U60 : AOI22_X1 port map( A1 => MUX12(1), A2 => n8, B1 => MUX13(1), B2 => n9,
                           ZN => n27_port);
   U61 : AOI22_X1 port map( A1 => MUX10(1), A2 => n10, B1 => MUX11(1), B2 => 
                           n11, ZN => n26_port);
   U62 : AOI22_X1 port map( A1 => MUX12(15), A2 => n8, B1 => MUX13(15), B2 => 
                           n9, ZN => n29_port);
   U63 : AOI22_X1 port map( A1 => MUX10(15), A2 => n10, B1 => MUX11(15), B2 => 
                           n11, ZN => n28_port);
   U64 : AOI22_X1 port map( A1 => MUX12(14), A2 => n8, B1 => MUX13(14), B2 => 
                           n9, ZN => n31_port);
   U65 : AOI22_X1 port map( A1 => MUX10(14), A2 => n10, B1 => MUX11(14), B2 => 
                           n11, ZN => n30_port);
   U66 : AOI22_X1 port map( A1 => MUX12(13), A2 => n8, B1 => MUX13(13), B2 => 
                           n9, ZN => n33_port);
   U67 : AOI22_X1 port map( A1 => MUX10(13), A2 => n10, B1 => MUX11(13), B2 => 
                           n11, ZN => n32_port);
   U68 : AOI22_X1 port map( A1 => MUX12(12), A2 => n8, B1 => MUX13(12), B2 => 
                           n9, ZN => n35_port);
   U69 : AOI22_X1 port map( A1 => MUX10(12), A2 => n10, B1 => MUX11(12), B2 => 
                           n11, ZN => n34_port);
   U70 : AOI22_X1 port map( A1 => MUX12(11), A2 => n8, B1 => MUX13(11), B2 => 
                           n9, ZN => n37_port);
   U71 : AOI22_X1 port map( A1 => MUX10(11), A2 => n10, B1 => MUX11(11), B2 => 
                           n11, ZN => n36_port);
   U72 : AOI22_X1 port map( A1 => MUX12(10), A2 => n8, B1 => MUX13(10), B2 => 
                           n9, ZN => n39_port);
   U73 : AOI22_X1 port map( A1 => MUX10(10), A2 => n10, B1 => MUX11(10), B2 => 
                           n11, ZN => n38_port);
   U74 : AOI22_X1 port map( A1 => MUX12(0), A2 => n8, B1 => MUX13(0), B2 => n9,
                           ZN => n41);
   U75 : AOI22_X1 port map( A1 => MUX10(0), A2 => n10, B1 => MUX11(0), B2 => 
                           n11, ZN => n40_port);
   U78 : AOI22_X1 port map( A1 => MUX02(9), A2 => n44, B1 => MUX03(9), B2 => 
                           n45, ZN => n43);
   U79 : AOI22_X1 port map( A1 => MUX00(9), A2 => n46, B1 => MUX01(9), B2 => 
                           n47, ZN => n42);
   U80 : AOI22_X1 port map( A1 => MUX02(8), A2 => n44, B1 => MUX03(8), B2 => 
                           n45, ZN => n49);
   U81 : AOI22_X1 port map( A1 => MUX00(8), A2 => n46, B1 => MUX01(8), B2 => 
                           n47, ZN => n48);
   U82 : AOI22_X1 port map( A1 => MUX02(7), A2 => n44, B1 => MUX03(7), B2 => 
                           n45, ZN => n51);
   U83 : AOI22_X1 port map( A1 => MUX00(7), A2 => n46, B1 => MUX01(7), B2 => 
                           n47, ZN => n50);
   U84 : AOI22_X1 port map( A1 => MUX02(6), A2 => n44, B1 => MUX03(6), B2 => 
                           n45, ZN => n53);
   U85 : AOI22_X1 port map( A1 => MUX00(6), A2 => n46, B1 => MUX01(6), B2 => 
                           n47, ZN => n52);
   U86 : AOI22_X1 port map( A1 => MUX02(5), A2 => n44, B1 => MUX03(5), B2 => 
                           n45, ZN => n55);
   U87 : AOI22_X1 port map( A1 => MUX00(5), A2 => n46, B1 => MUX01(5), B2 => 
                           n47, ZN => n54);
   U88 : AOI22_X1 port map( A1 => MUX02(4), A2 => n44, B1 => MUX03(4), B2 => 
                           n45, ZN => n57);
   U89 : AOI22_X1 port map( A1 => MUX00(4), A2 => n46, B1 => MUX01(4), B2 => 
                           n47, ZN => n56);
   U90 : AOI22_X1 port map( A1 => MUX02(3), A2 => n44, B1 => MUX03(3), B2 => 
                           n45, ZN => n59);
   U91 : AOI22_X1 port map( A1 => MUX00(3), A2 => n46, B1 => MUX01(3), B2 => 
                           n47, ZN => n58);
   U92 : AOI22_X1 port map( A1 => MUX02(2), A2 => n44, B1 => MUX03(2), B2 => 
                           n45, ZN => n61);
   U93 : AOI22_X1 port map( A1 => MUX00(2), A2 => n46, B1 => MUX01(2), B2 => 
                           n47, ZN => n60);
   U94 : AOI22_X1 port map( A1 => MUX02(1), A2 => n44, B1 => MUX03(1), B2 => 
                           n45, ZN => n63);
   U95 : AOI22_X1 port map( A1 => MUX00(1), A2 => n46, B1 => MUX01(1), B2 => 
                           n47, ZN => n62);
   U96 : AOI22_X1 port map( A1 => MUX02(15), A2 => n44, B1 => MUX03(15), B2 => 
                           n45, ZN => n65);
   U97 : AOI22_X1 port map( A1 => MUX00(15), A2 => n46, B1 => MUX01(15), B2 => 
                           n47, ZN => n64);
   U98 : AOI22_X1 port map( A1 => MUX02(14), A2 => n44, B1 => MUX03(14), B2 => 
                           n45, ZN => n67);
   U99 : AOI22_X1 port map( A1 => MUX00(14), A2 => n46, B1 => MUX01(14), B2 => 
                           n47, ZN => n66);
   U100 : AOI22_X1 port map( A1 => MUX02(13), A2 => n44, B1 => MUX03(13), B2 =>
                           n45, ZN => n69);
   U101 : AOI22_X1 port map( A1 => MUX00(13), A2 => n46, B1 => MUX01(13), B2 =>
                           n47, ZN => n68);
   U102 : AOI22_X1 port map( A1 => MUX02(12), A2 => n44, B1 => MUX03(12), B2 =>
                           n45, ZN => n71);
   U103 : AOI22_X1 port map( A1 => MUX00(12), A2 => n46, B1 => MUX01(12), B2 =>
                           n47, ZN => n70);
   U104 : AOI22_X1 port map( A1 => MUX02(11), A2 => n44, B1 => MUX03(11), B2 =>
                           n45, ZN => n73);
   U105 : AOI22_X1 port map( A1 => MUX00(11), A2 => n46, B1 => MUX01(11), B2 =>
                           n47, ZN => n72);
   U106 : AOI22_X1 port map( A1 => MUX02(10), A2 => n44, B1 => MUX03(10), B2 =>
                           n45, ZN => n75);
   U107 : AOI22_X1 port map( A1 => MUX00(10), A2 => n46, B1 => MUX01(10), B2 =>
                           n47, ZN => n74);
   U108 : AOI22_X1 port map( A1 => MUX02(0), A2 => n44, B1 => MUX03(0), B2 => 
                           n45, ZN => n77);
   U109 : AOI22_X1 port map( A1 => MUX00(0), A2 => n46, B1 => MUX01(0), B2 => 
                           n47, ZN => n76);
   add_78 : datapath_adder_DW01_add_0 port map( A(15) => operanda_15_port, 
                           A(14) => operanda_14_port, A(13) => operanda_13_port
                           , A(12) => operanda_12_port, A(11) => 
                           operanda_11_port, A(10) => operanda_10_port, A(9) =>
                           operanda_9_port, A(8) => operanda_8_port, A(7) => 
                           operanda_7_port, A(6) => operanda_6_port, A(5) => 
                           operanda_5_port, A(4) => operanda_4_port, A(3) => 
                           operanda_3_port, A(2) => operanda_2_port, A(1) => 
                           operanda_1_port, A(0) => operanda_0_port, B(15) => 
                           operandb_15_port, B(14) => operandb_14_port, B(13) 
                           => operandb_13_port, B(12) => operandb_12_port, 
                           B(11) => operandb_11_port, B(10) => operandb_10_port
                           , B(9) => operandb_9_port, B(8) => operandb_8_port, 
                           B(7) => operandb_7_port, B(6) => operandb_6_port, 
                           B(5) => operandb_5_port, B(4) => operandb_4_port, 
                           B(3) => operandb_3_port, B(2) => operandb_2_port, 
                           B(1) => operandb_1_port, B(0) => operandb_0_port, CI
                           => n2, SUM(15) => N40, SUM(14) => N39, SUM(13) => 
                           N38, SUM(12) => N37, SUM(11) => N36, SUM(10) => N35,
                           SUM(9) => N34, SUM(8) => N33, SUM(7) => N32, SUM(6) 
                           => N31, SUM(5) => N30, SUM(4) => N29, SUM(3) => N28,
                           SUM(2) => N27, SUM(1) => N26, SUM(0) => N25, CO => 
                           n_1019);
   U4 : NOR2_X2 port map( A1 => n491, A2 => SEL11, ZN => n11);
   U5 : AND2_X2 port map( A1 => SEL01, A2 => n492, ZN => n44);
   U6 : AND2_X2 port map( A1 => SEL11, A2 => n491, ZN => n8);
   U7 : NAND2_X1 port map( A1 => n62, A2 => n63, ZN => operanda_1_port);
   U8 : NAND2_X1 port map( A1 => n26_port, A2 => n27_port, ZN => 
                           operandb_1_port);
   U9 : NAND2_X1 port map( A1 => n76, A2 => n77, ZN => operanda_0_port);
   U10 : NAND2_X1 port map( A1 => n68, A2 => n69, ZN => operanda_13_port);
   U11 : NAND2_X1 port map( A1 => n32_port, A2 => n33_port, ZN => 
                           operandb_13_port);
   U12 : NAND2_X1 port map( A1 => n66, A2 => n67, ZN => operanda_14_port);
   U13 : NAND2_X1 port map( A1 => n30_port, A2 => n31_port, ZN => 
                           operandb_14_port);
   U14 : NAND2_X1 port map( A1 => n60, A2 => n61, ZN => operanda_2_port);
   U15 : NAND2_X1 port map( A1 => n24, A2 => n25_port, ZN => operandb_2_port);
   U16 : NAND2_X1 port map( A1 => n58, A2 => n59, ZN => operanda_3_port);
   U17 : NAND2_X1 port map( A1 => n22, A2 => n23, ZN => operandb_3_port);
   U18 : NAND2_X1 port map( A1 => n56, A2 => n57, ZN => operanda_4_port);
   U19 : NAND2_X1 port map( A1 => n20, A2 => n21, ZN => operandb_4_port);
   U20 : NAND2_X1 port map( A1 => n54, A2 => n55, ZN => operanda_5_port);
   U21 : NAND2_X1 port map( A1 => n18, A2 => n19, ZN => operandb_5_port);
   U22 : NAND2_X1 port map( A1 => n52, A2 => n53, ZN => operanda_6_port);
   U23 : NAND2_X1 port map( A1 => n16, A2 => n17, ZN => operandb_6_port);
   U24 : NAND2_X1 port map( A1 => n50, A2 => n51, ZN => operanda_7_port);
   U25 : NAND2_X1 port map( A1 => n14, A2 => n15, ZN => operandb_7_port);
   U26 : NAND2_X1 port map( A1 => n48, A2 => n49, ZN => operanda_8_port);
   U27 : NAND2_X1 port map( A1 => n12, A2 => n13, ZN => operandb_8_port);
   U28 : NAND2_X1 port map( A1 => n42, A2 => n43, ZN => operanda_9_port);
   U29 : NAND2_X1 port map( A1 => n6, A2 => n7, ZN => operandb_9_port);
   U30 : NAND2_X1 port map( A1 => n74, A2 => n75, ZN => operanda_10_port);
   U31 : NAND2_X1 port map( A1 => n38_port, A2 => n39_port, ZN => 
                           operandb_10_port);
   U32 : NAND2_X1 port map( A1 => n72, A2 => n73, ZN => operanda_11_port);
   U33 : NAND2_X1 port map( A1 => n36_port, A2 => n37_port, ZN => 
                           operandb_11_port);
   U34 : NAND2_X1 port map( A1 => n70, A2 => n71, ZN => operanda_12_port);
   U35 : NAND2_X1 port map( A1 => n34_port, A2 => n35_port, ZN => 
                           operandb_12_port);
   U36 : NAND2_X1 port map( A1 => n64, A2 => n65, ZN => operanda_15_port);
   U37 : NAND2_X1 port map( A1 => n28_port, A2 => n29_port, ZN => 
                           operandb_15_port);
   U38 : INV_X1 port map( A => reset, ZN => n493);
   U39 : NAND2_X1 port map( A1 => n40_port, A2 => n41, ZN => operandb_0_port);
   U40 : AND2_X2 port map( A1 => SEL00, A2 => SEL01, ZN => n45);
   U41 : AND2_X2 port map( A1 => SEL10, A2 => SEL11, ZN => n9);
   U42 : INV_X1 port map( A => SEL00, ZN => n492);
   U43 : INV_X1 port map( A => SEL10, ZN => n491);
   U76 : NOR2_X2 port map( A1 => SEL00, A2 => SEL01, ZN => n46);
   U77 : NOR2_X2 port map( A1 => n492, A2 => SEL01, ZN => n47);
   U110 : NOR2_X2 port map( A1 => SEL10, A2 => SEL11, ZN => n10);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsm_adder.all;

entity fsm is

   port( Clock, reset : in std_logic;  S : out std_logic_vector (3 downto 0));

end fsm;

architecture SYN_behaviour of fsm is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal S_1_port, N8, n7, S_2_port, n6, n8_port, n10, S_0_port, n327, n328, 
      S_3_port, n330, n331, n_1020, n_1021 : std_logic;

begin
   S <= ( S_3_port, S_2_port, S_1_port, S_0_port );
   
   CURRENTSTATE_reg_1_inst : DFFR_X1 port map( D => S_2_port, CK => Clock, RN 
                           => n331, Q => n6, QN => n328);
   CURRENTSTATE_reg_0_inst : DFFR_X1 port map( D => N8, CK => Clock, RN => n331
                           , Q => n_1020, QN => n10);
   CURRENTSTATE_reg_2_inst : DFFR_X1 port map( D => n7, CK => Clock, RN => n331
                           , Q => n327, QN => n_1021);
   U9 : NOR2_X1 port map( A1 => n327, A2 => n8_port, ZN => n7);
   U10 : OAI21_X1 port map( B1 => n327, B2 => n328, A => n330, ZN => S_2_port);
   U11 : NOR2_X1 port map( A1 => n327, A2 => n10, ZN => S_0_port);
   U12 : OAI21_X1 port map( B1 => n327, B2 => n328, A => n8_port, ZN => 
                           S_1_port);
   U13 : NOR2_X1 port map( A1 => n6, A2 => n327, ZN => N8);
   U3 : INV_X1 port map( A => n8_port, ZN => S_3_port);
   U4 : NAND2_X1 port map( A1 => n10, A2 => n6, ZN => n8_port);
   U5 : INV_X1 port map( A => reset, ZN => n331);
   U6 : INV_X1 port map( A => S_0_port, ZN => n330);

end SYN_behaviour;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsm_adder.all;

entity fsm_adder is

   port( A, B, C, D, E, F : in std_logic_vector (15 downto 0);  Clock, reset : 
         in std_logic;  Output : out std_logic_vector (15 downto 0));

end fsm_adder;

architecture SYN_behaviour of fsm_adder is

   component datapath_adder
      port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
            std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10,
            SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));
   end component;
   
   component fsm
      port( Clock, reset : in std_logic;  S : out std_logic_vector (3 downto 0)
            );
   end component;
   
   signal sel_3_port, sel_2_port, sel_1_port, sel_0_port, sum_s_15_port, 
      sum_s_14_port, sum_s_13_port, sum_s_12_port, sum_s_11_port, sum_s_10_port
      , sum_s_9_port, sum_s_8_port, sum_s_7_port, sum_s_6_port, sum_s_5_port, 
      sum_s_4_port, sum_s_3_port, sum_s_2_port, sum_s_1_port, sum_s_0_port : 
      std_logic;

begin
   
   fsm_pin : fsm port map( Clock => Clock, reset => reset, S(3) => sel_3_port, 
                           S(2) => sel_2_port, S(1) => sel_1_port, S(0) => 
                           sel_0_port);
   datapath_pin : datapath_adder port map( MUX00(15) => A(15), MUX00(14) => 
                           A(14), MUX00(13) => A(13), MUX00(12) => A(12), 
                           MUX00(11) => A(11), MUX00(10) => A(10), MUX00(9) => 
                           A(9), MUX00(8) => A(8), MUX00(7) => A(7), MUX00(6) 
                           => A(6), MUX00(5) => A(5), MUX00(4) => A(4), 
                           MUX00(3) => A(3), MUX00(2) => A(2), MUX00(1) => A(1)
                           , MUX00(0) => A(0), MUX01(15) => sum_s_15_port, 
                           MUX01(14) => sum_s_14_port, MUX01(13) => 
                           sum_s_13_port, MUX01(12) => sum_s_12_port, MUX01(11)
                           => sum_s_11_port, MUX01(10) => sum_s_10_port, 
                           MUX01(9) => sum_s_9_port, MUX01(8) => sum_s_8_port, 
                           MUX01(7) => sum_s_7_port, MUX01(6) => sum_s_6_port, 
                           MUX01(5) => sum_s_5_port, MUX01(4) => sum_s_4_port, 
                           MUX01(3) => sum_s_3_port, MUX01(2) => sum_s_2_port, 
                           MUX01(1) => sum_s_1_port, MUX01(0) => sum_s_0_port, 
                           MUX02(15) => F(15), MUX02(14) => F(14), MUX02(13) =>
                           F(13), MUX02(12) => F(12), MUX02(11) => F(11), 
                           MUX02(10) => F(10), MUX02(9) => F(9), MUX02(8) => 
                           F(8), MUX02(7) => F(7), MUX02(6) => F(6), MUX02(5) 
                           => F(5), MUX02(4) => F(4), MUX02(3) => F(3), 
                           MUX02(2) => F(2), MUX02(1) => F(1), MUX02(0) => F(0)
                           , MUX03(15) => E(15), MUX03(14) => E(14), MUX03(13) 
                           => E(13), MUX03(12) => E(12), MUX03(11) => E(11), 
                           MUX03(10) => E(10), MUX03(9) => E(9), MUX03(8) => 
                           E(8), MUX03(7) => E(7), MUX03(6) => E(6), MUX03(5) 
                           => E(5), MUX03(4) => E(4), MUX03(3) => E(3), 
                           MUX03(2) => E(2), MUX03(1) => E(1), MUX03(0) => E(0)
                           , MUX10(15) => B(15), MUX10(14) => B(14), MUX10(13) 
                           => B(13), MUX10(12) => B(12), MUX10(11) => B(11), 
                           MUX10(10) => B(10), MUX10(9) => B(9), MUX10(8) => 
                           B(8), MUX10(7) => B(7), MUX10(6) => B(6), MUX10(5) 
                           => B(5), MUX10(4) => B(4), MUX10(3) => B(3), 
                           MUX10(2) => B(2), MUX10(1) => B(1), MUX10(0) => B(0)
                           , MUX11(15) => C(15), MUX11(14) => C(14), MUX11(13) 
                           => C(13), MUX11(12) => C(12), MUX11(11) => C(11), 
                           MUX11(10) => C(10), MUX11(9) => C(9), MUX11(8) => 
                           C(8), MUX11(7) => C(7), MUX11(6) => C(6), MUX11(5) 
                           => C(5), MUX11(4) => C(4), MUX11(3) => C(3), 
                           MUX11(2) => C(2), MUX11(1) => C(1), MUX11(0) => C(0)
                           , MUX12(15) => sum_s_15_port, MUX12(14) => 
                           sum_s_14_port, MUX12(13) => sum_s_13_port, MUX12(12)
                           => sum_s_12_port, MUX12(11) => sum_s_11_port, 
                           MUX12(10) => sum_s_10_port, MUX12(9) => sum_s_9_port
                           , MUX12(8) => sum_s_8_port, MUX12(7) => sum_s_7_port
                           , MUX12(6) => sum_s_6_port, MUX12(5) => sum_s_5_port
                           , MUX12(4) => sum_s_4_port, MUX12(3) => sum_s_3_port
                           , MUX12(2) => sum_s_2_port, MUX12(1) => sum_s_1_port
                           , MUX12(0) => sum_s_0_port, MUX13(15) => D(15), 
                           MUX13(14) => D(14), MUX13(13) => D(13), MUX13(12) =>
                           D(12), MUX13(11) => D(11), MUX13(10) => D(10), 
                           MUX13(9) => D(9), MUX13(8) => D(8), MUX13(7) => D(7)
                           , MUX13(6) => D(6), MUX13(5) => D(5), MUX13(4) => 
                           D(4), MUX13(3) => D(3), MUX13(2) => D(2), MUX13(1) 
                           => D(1), MUX13(0) => D(0), clock => Clock, reset => 
                           reset, SEL00 => sel_0_port, SEL01 => sel_1_port, 
                           SEL10 => sel_2_port, SEL11 => sel_3_port, SUM(15) =>
                           sum_s_15_port, SUM(14) => sum_s_14_port, SUM(13) => 
                           sum_s_13_port, SUM(12) => sum_s_12_port, SUM(11) => 
                           sum_s_11_port, SUM(10) => sum_s_10_port, SUM(9) => 
                           sum_s_9_port, SUM(8) => sum_s_8_port, SUM(7) => 
                           sum_s_7_port, SUM(6) => sum_s_6_port, SUM(5) => 
                           sum_s_5_port, SUM(4) => sum_s_4_port, SUM(3) => 
                           sum_s_3_port, SUM(2) => sum_s_2_port, SUM(1) => 
                           sum_s_1_port, SUM(0) => sum_s_0_port);

end SYN_behaviour;
