scenario = "tone_oddball_450SOA";

no_logfile = false;
scenario_type = trials;

active_buttons = 1;
button_codes = 255;  

default_background_color = 0, 0, 0;
default_text_color = 255, 0, 255;
default_font_size = 18;  

write_codes = true; 
pulse_width = 10;
pcl_file = "tone_oddball_450SOA.pcl";

begin;

# port codes:
# 3 = 100 ms as a standard.
# 5 = 180 ms as a deviant.

#Load the auditory stimuli:
sound { wavefile { filename = "1000Hz_100ms.wav"; preload = true; }; } standard_tone;
sound { wavefile { filename = "1000Hz_180ms.wav"; preload = true; }; } deviant_tone;


picture {
} default;

picture {
   text {
      caption = "End of Block";
      font_size = 30;
      text_align = align_center;
      font_color = 255, 0, 255;
   } end_block_txt;
	x = 0; y = 0;   
} end_block_pic;

trial {
trial_duration = 2000;
	stimulus_event {
		picture default;
		code = "450 ISI";  
		port_code = 45;  
		time = 0;
	};
} nothing_trial;

trial {
trial_duration = 350;
	stimulus_event {
		picture default;
		time = 0;
	}event_isi;
} isi_trial;

trial {
	stimulus_event {
		sound standard_tone;  
		time = 0;     
		code = "standard";  
		port_code = 3;  
	} event_standard;
}standard_trial;
  
trial {
	stimulus_event {
		sound deviant_tone;   
		time = 0;     
		code = "deviant";  
		port_code = 5;  
	} event_deviant;
}deviant_trial;

trial {
	trial_duration = forever;
	trial_type = first_response; 
	terminator_button = 1;
	stimulus_event {
      picture end_block_pic;
   } event_end_block;  
} end_block_trial;


#Randomly generate ISI order 
#Use 8ms under ISI preferred to make sure screen refresh rate (60Hz) is always within this time and a delay in trial presentation doesn't happen - same for visual stimulus also
array <int> ISIs_1[num_stim] = { 4000, 6000, 8000, 10000, 5000, 7000, 9000, 11000, 12000 };  
#array <int> ISIs_1[num_stim] = { 3995, 5995, 7995, 9995, 4995, 6995, 8995, 10995, 11995 }; 
#array <int> ISIs_2[num_stim] = { 4992, 6992, 8992, 10992 };
array <int> ISI_order[num_trials];
loop int i = 1 until i > num_trials begin
	ISIs_1.shuffle();
	loop int j = 1 until j > num_stim begin
		ISI_order[i+j-1] = ISIs_1[j];
		j = j + 1;
	end;
#	ISIs_2.shuffle();
#	loop int j = 1 until j > num_stim begin
#		ISI_order[i+j+3] = ISIs_2[j];
#		j = j + 1;
#	end;
#  i = i + num_stim*2;
	i = i + num_stim;
end;

