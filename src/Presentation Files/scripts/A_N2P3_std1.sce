scenario = "A_N2P3_std1";
pcl_file = "A_N2P3_std1.pcl";

default_path = "C:\\Users\\PRESENTATION\\Desktop\\Active Projects\\A_V_N2P3_version2\\Stimuli";

scenario_type = trials;
default_background_color = 0, 0, 0;
write_codes = true; 
active_buttons = 2;
button_codes = 125, 225;  
no_logfile = false;

pulse_width = 5; #trigger duration in milliseconds

begin;

###Define Stimuli###

picture {} default;

bitmap { filename = "chkr_lge4.png"; } pic1;
bitmap { filename = "chkr_lge5.png"; } pic2;
bitmap { filename = "chkr_lge6.png"; } pic3;

#bitmap { filename = "white_trigger_test.png"; } pic1;
#bitmap { filename = "white_trigger_test.png"; } pic2;
#bitmap { filename = "white_trigger_test.png"; } pic3;

picture { bitmap pic1; x = 0; y =0; }checkerboard1;
picture { bitmap pic2; x = 0; y =0; }checkerboard2;
picture { bitmap pic3; x = 0; y =0; }checkerboard3;

#ORIGINAL SOUNDS- difference in dB
#sound { wavefile { filename = "004.wav"; } wav_aud_1; } aud1;
#sound { wavefile { filename = "001.wav"; } wav_aud_2; } aud2;
#sound { wavefile { filename = "009.wav"; } wav_aud_3; } aud3;

#sounds with stereo (2 channels)
#sound { wavefile { filename = "004_stereo.wav"; } wav_aud_1; } aud1;
#sound { wavefile { filename = "001_stereo.wav"; } wav_aud_2; } aud2;
#sound { wavefile { filename = "009_stereo.wav"; } wav_aud_3; } aud3;

#sounds normalised to account for dB difference and with stereo (2 channels)
#USE THESE?!!
sound { wavefile { filename = "004_norm_2.wav"; } wav_aud_1; } aud1;
sound { wavefile { filename = "001_norm.wav"; } wav_aud_2; } aud2;
sound { wavefile { filename = "009_norm_7.wav"; } wav_aud_3; } aud3;

picture {
   text {
      caption = "End of Block";
      font_size = 30;
      text_align = align_center;
      font_color = 255, 0, 255;
   } end_block_txt;
	x = 0; y = 0;   
} end_block_pic;

###Define Trials###

#start
trial {
trial_duration = 4995;
	stimulus_event {
		picture default;
		time = 0;
	}event_start;
} trial_start;

#vis 1
trial { 
		
	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;
		
	stimulus_event{
		picture checkerboard1;
		code = "vis1";
		port_code = 110;
		duration = 295;
	}vis1_se;
	
} trial_vis1;

#vis 2
trial { 
		
	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;
		
	stimulus_event{
		picture checkerboard2;
		code = "vis2";
		port_code = 111;
		duration = 295;
		}vis2_se;
	
} trial_vis2;

#vis 3
trial { 
		
	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;
		
	stimulus_event{
		picture checkerboard3;
		code = "vis3";
		port_code = 112;
		duration = 295;
		}vis3_se;
	
} trial_vis3;

#aud 1
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;

	stimulus_event{	
		picture default;
		code = "v_aud1";
		port_code = 120;
		duration = 295;
	}v_aud1_se;

	stimulus_event{
		sound aud1; 
		code = "a_aud1";
		parallel = true;
	}a_aud1_se;
		
}trial_aud1;

#aud 2
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;

	stimulus_event{	
		picture default;
		code = "v_aud2";
		port_code = 121;
		duration = 295;
	}v_aud2_se;

	stimulus_event{
		sound aud2; 
		code = "a_aud2";
		parallel = true;
	}a_aud2_se;
		
}trial_aud2;

#aud 3
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;

	stimulus_event{	
		picture default;
		code = "v_aud3";
		port_code = 122;
		duration = 295;
	}v_aud3_se;

	stimulus_event{
		sound aud3; 
		code = "a_aud3";
		parallel = true;
	}a_aud3_se;
		
}trial_aud3;

#av 1
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;
				
	stimulus_event{	
		picture checkerboard1;
		code = "v_av1";
		port_code = 130;
		duration = 295;
	}v_av1_se;

	stimulus_event{
		sound aud1; 
		code = "a_av1";
		parallel = true;
	}a_av1_se;
	
} trial_av1;

#av 2
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;

	stimulus_event{		
		picture checkerboard2;
		code = "v_av2";
		port_code = 131;
		duration = 295;
	}v_av2_se;

	stimulus_event{
		sound aud2; 
		code = "audv";
		parallel = true;
	}a_av2_se;
			
} trial_av2;

#av 3
trial { 

	#STIMULUS REFERENCE	
	picture default;
	code = "default";
	time = 0;

	stimulus_event{	
		picture checkerboard3;
		code = "vis1";
		port_code = 132;
		duration = 295;
	}v_av3_se;
	
	stimulus_event{
		sound aud3; 
		code = "audv";
		parallel = true;
	}a_av3_se;
		
} trial_av3;

#isi
trial{ 
   picture default;
   time = 0;
	duration = 995;
	code = "isi";
}trial_isi;

#end block
trial{
	trial_duration = forever;
	trial_type = first_response; 
	terminator_button = 1;
	stimulus_event {
      picture end_block_pic;
   } event_end_block;  
}trial_end_block;
