################################################
#
# Pad each stimulus with zeros at the beginning
#
################################################

stimuli_folder$ = "/Users/michellecohn/Desktop/Test2/Silence/"

	curDur = Get total duration
	Rename... word1

	#Pad with zeros at end (up to 900ms)
	startpad = 0.100
	Create Sound from formula... startzeros 1 0.0 'startpad' 44100 0

	selectObject: "Sound word1"
	#Copy... word1
	
	addzeros = 0.900 -'curDur'-'startpad'
	Create Sound from formula... zeros 1 0.0 'addzeros' 44100 0

	selectObject: "Sound startzeros"
	plusObject: "Sound word1" 
	plusObject: "Sound zeros" 
	Concatenate
	Rename... adjustedsound
	Scale intensity... 55.0

	#Save as WAV file... 'stimuli_folder$'_adjusted_'curFile$'.wav

	Save as WAV file... 'stimuli_folder$'_adjusted_dib_same-spliced.wav