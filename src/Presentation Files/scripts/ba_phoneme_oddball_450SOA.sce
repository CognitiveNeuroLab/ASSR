scenario = "ba_phoneme_oddball_450SOA";

no_logfile = false;
scenario_type = trials;

active_buttons = 1;
button_codes = 255;  

default_background_color = 0, 0, 0;
default_text_color = 255, 0, 255;
default_font_size = 18;  

write_codes = true; 
pulse_width = 10;
pcl_file = "ba_phoneme_oddball_450SOA.pcl";

begin;

# port codes:
# 2 = BA is standard.
# 4 = DA is deviant.

#Load the auditory stimuli:

#sound { wavefile { filename = "ba_jm.wav"; preload = true; }; } ba_sound;
#sound { wavefile { filename = "da_jm.wav"; preload = true; }; } da_sound;

sound { wavefile { filename = "ba_148-10.wav"; preload = true; }; } ba_sound;
sound { wavefile { filename = "da_148-10.wav"; preload = true; }; } da_sound;


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
trial_duration = 302;
	stimulus_event {
		picture default;
		time = 0;
	}event_isi;
} isi_trial;

trial {
	stimulus_event {
		sound ba_sound;  
		time = 0;     
		code = "standard";  
		port_code = 2;  
	} event_standard;
}standard_trial;
  
trial {
	stimulus_event {
		sound da_sound;   
		time = 0;     
		code = "deviant";  
		port_code = 4;  
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





