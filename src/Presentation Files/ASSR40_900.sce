write_codes=true;
pulse_width=60;
pulse_value=2;

begin;

trial{stimulus_event{
		sound{wavefile{filename="click40Hz_bi_900.wav";}w;}ws; 
      code="s";
      port_code=3; 
		}sn;}snd;

picture{}default;

trial{ 
   picture default;
   time = 0;
	duration = 995;
	code = "offset";
	port_code=18; 
}trial_isi;

begin_pcl;
int num_trials = 150;
int num_stim = 16;
int ISI_order = 650;
array <int> ISIs_1[num_stim] = {500, 520, 540, 560, 580, 600, 620, 640, 660, 680, 700, 720, 740, 760, 780, 800}; 


			########  N of bursts for each condition	 ##########
loop int z=1 until z>num_trials
begin #

	snd.present();

	ISIs_1.shuffle();
	ISI_order = ISIs_1[1];

   trial_isi.set_duration(ISI_order);
	trial_isi.present();
	z=z+1; 
end;	#

