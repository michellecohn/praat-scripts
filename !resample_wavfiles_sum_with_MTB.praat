####################################
#
#
# Resample all soundfiles in a folder 
# combine them with MTB file
#
# MC 2/12/2018
#
#
####################################

# Load in sounds

directory$ = chooseDirectory$ ("Choose the directory containing sound files")
directory$ = "'directory$'" + "/" 

Create Strings as file list... list 'directory$'*.wav
number_files = Get number of strings

##########  LOAD IN ALL THE FILES ########## 
for ifile to number_files
	select Strings list
	sound$ = Get string... ifile
	Read from file... 'directory$''sound$'
	
	# Resample 
	Resample... 44100.0 50

	# selectObject: 'sound$'
	plusObject: "Sound mtb_file_mono_900ms"
	
	Combine to stereo
	Convert to mono

	Write to WAV file... 'directory$'MTB/MTB'sound$'.wav



endfor



