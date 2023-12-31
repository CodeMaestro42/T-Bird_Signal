-- Language: VHDL
-- This is a VHDL file.
library IEEE;
use IEEE.std_logic_1164.all; 
library lpm;
use lpm.lpm_components.all;
entity Lab3 is
port (b,l,r,h, clk: in std_logic; -- connect clock to PIN_N2
L1, L2, L3, R1, R2, R3: out std_logic
);
end Lab3;
architecture state_machine of lab3 is
signal clk2: std_logic; -- delayed clock
type T_Bird_Signal is (Break, Leftb, Rightb, Hazard, Idle);
signal current_state : T_Bird_Signal;
signal next_state : T_Bird_Signal;
signal assignment_counter: integer range 0 to 3:=0;
begin

process(b,l,r,h)
begin
case current_state is 
	WHEN Idle =>
		if (b = '0')Then
			next_state <= Break; 
		elsif (h = '1' and b = '1') then
			next_state <= Hazard; 
		elsif (r = '1' and b ='1' and h = '0'and l='0') then
			next_state <= Rightb; 
		elsif (l = '1' and b ='1' and h ='0') then 
			next_state <= Leftb; 
		end if; 
	WHEN Leftb =>
		if (b = '0')Then
			next_state <= Break; 
		elsif (h = '1' and b = '1') then
			next_state <= Hazard; 
		elsif (r = '1' and b ='1' and h = '0' and l='0') then
			next_state <= Rightb; 
		elsif (l = '0' and b ='1' and h ='0') then 
			next_state <= Idle; 
		end if; 
		WHEN Rightb =>
		if (b = '0')Then
			next_state <= Break; 
		elsif (h = '1' and b = '1') then
			next_state <= Hazard; 
		elsif (r = '0' and b ='1' and h = '0') then
			next_state <= Idle; 
		elsif (l = '1' and b ='1' and h ='0') then 
			next_state <= Leftb; 
		end if; 
		WHEN Break =>
		if (b = '1')Then
			next_state <= Idle; 
		elsif (h = '1' and b = '1') then
			next_state <= Hazard; 
		elsif (r = '1' and b ='1' and h = '0' and l='0') then
			next_state <= Rightb; 
		elsif (l = '1' and b ='1' and h ='0') then 
			next_state <= Leftb; 
		end if; 
		WHEN Hazard =>
		if (b = '0')Then
			next_state <= Break; 
		elsif (h = '0' and b = '1') then
			next_state <= Idle; 
		elsif (r = '1' and b ='1' and h = '0' and l='0') then
			next_state <= Rightb; 
		elsif (l = '1' and b ='1' and h ='0') then 
			next_state <= Leftb;
		end if;
		END CASE;
		End Process;
		
		process
		Begin


		wait until (rising_edge(clk2));
		if assignment_counter <3 then 
		assignment_counter <= assignment_counter+1;
		else assignment_counter <=0;
		end if;
		
		current_state <= next_state;
		
	if current_state = Idle then
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';

	elsif current_state = Leftb then
	case assignment_counter is
	when 0 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 1 =>
	L1<='1';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 2 =>
	L1<='1';
	L2<='1';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 3 =>
	L1<='1';
	L2<='1';
	L3<='1';
	R1<='0';
	R2<='0';
	R3<='0';

	end case;

	
	elsif current_state = Rightb then
	case assignment_counter is
	when 0 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 1 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='1';
	R2<='0';
	R3<='0';
		when 2 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='1';
	R2<='1';
	R3<='0';
	when 3 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='1';
	R2<='1;
	R3<='1';
		
	end case;
	
	elsif current_state =  Break then
	L1<='1';
	L2<='1';
	L3<='1';
	R1<='1';
	R2<='1';
	R3<='1';
	
	elsif current_state = Hazard then
	case assignment_counter is
	when 0 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 1 =>
	L1<='1';
	L2<='1';
	L3<='1';
	R1<='1';
	R2<='1';
	R3<='1';
		when 2 =>
	L1<='0';
	L2<='0';
	L3<='0';
	R1<='0';
	R2<='0';
	R3<='0';
	when 3 =>
	L1<='1';
	L2<='1';
	L3<='1';
	R1<='1';
	R2<='1';
	R3<='1';
		end case;
	
end if;
	end process;
		

		
		
Delay: lpm_counter generic map(lpm_width=>24)
port map (clock=>clk, cout=>clk2);

end state_machine;
