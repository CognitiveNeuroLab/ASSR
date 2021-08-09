scenario = "ASSR_test1";

no_logfile = false;
scenario_type = trials;

active_buttons = 1;
button_codes = 255;  

default_background_color = 0, 0, 0;
default_text_color = 255, 0, 255;
default_font_size = 18;  

write_codes = true; 
pulse_width = 10;
pcl_file = "ASSR_test1.pcl";

begin;

# port codes:
# 2 = BA is standard.
# 4 = DA is deviant.

#Load the auditory stimuli:

#sound { wavefile { filename = "ba_jm.wav"; preload = true; }; } ba_sound;
#sound { wavefile { filename = "da_jm.wav"; preload = true; }; } da_sound;

sound { wavefile { filename = "click40Hz_bi_500.wav"; preload = true; }; } assr40_clicks;
#sound { wavefile { filename = "1000Hz_180ms.wav"; preload = true; }; } deviant_tone;


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
	stimulus_event {
		sound assr40_clicks;  
		time = 0;     
		code = "assr40";  
		port_code = 2;  
	} event_assr40;
}trial_assr40;
  
#isi
trial{ 
   picture default;
   time = 0;
	duration = 995;
	code = "isi";
}trial_isi;

trial {
	trial_duration = forever;
	trial_type = first_response; 
	terminator_button = 1;
	stimulus_event {
      picture end_block_pic;
   } event_end_block;  
} end_block_trial;





