################################
#
# Pad the end of the soundfile, such that the total dur = 900ms
#
# Checks if the file is already 900ms
#
################################

stimuli_folder$ = "/Users/michellecohn/Desktop/Test2/Silence/"

stimList = Create Strings as file list... stimList 'stimuli_folder$'*.wav
n = Get number of strings

for i from 1 to n

	# READ IN EACH STIMULUS
	select stimList

	curFile$ = Get string... 'i'
	curSound = Read from file... 'stimuli_folder$''curFile$'
	Rename... word1

	
	curDur = Get total duration

	#Pad with zeros at end (up to 900ms)
	#startpad = 0.100
	#Create Sound from formula... startzeros 1 0.0 'startpad' 44100 0

	selectObject: "Sound word1"
	#Copy... word1
	
	addzeros = 0.900 -'curDur'


	if addzeros <> 0

	Create Sound from formula... zeros 1 0.0 'addzeros' 44100 0

	selectObject: "Sound word1" 
	plusObject: "Sound zeros" 
	Concatenate
	Rename... adjustedsound
	Scale intensity... 55.0

	Save as WAV file... 'stimuli_folder$'OUTPUT/'curFile$'

	endif

	if addzeros = 0 
	Save as WAV file... 'stimuli_folder$'OUTPUT/'curFile$'
	endif 
endfor
