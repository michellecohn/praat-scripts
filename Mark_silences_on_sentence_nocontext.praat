######################################################################################################
#
# At each "sp" (excluding where it falls in a sentence), label sentences in new tier
#
#
# MC 11/18/20
# 
######################################################################################################


### DEFINE I/O and new sentence tier ##

form Give the working directories

	comment Give the directory for the .wav and .textgrids (include final slash)
	text directory /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/!Siri-DS_code/Siri-DS (low error rate)/Handcorrected/


	comment Give the outputdirectory (include final slash)
	text outputdir /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/!Siri-DS_code/Siri-DS (low error rate)/Sentences_Marked/


endform


sentence_tier = 3
word_tier = 2


curr_folder$ = ""

## (2) Loop through TextGrids 
Create Strings as file list...  list 'directory$'*.TextGrid
#Create Strings as file list...  list 'directory$''curr_folder$'/*.wav

n_wav = Get number of strings

textgridstring$ = "" 

for ifile from 1 to n_wav
#for ifile from 1 to 1

	select Strings list
	curr_file$ = Get string... 'ifile'
   	Read from file... 'directory$''curr_folder$'/'curr_file$'
	name$ = selected$ ("TextGrid")

   	# Here we make a variable called "object_name$" that will be equal to the filename minus the ".wav" extension
	wavfile$ = curr_file$ - ".TextGrid" 
	Read from file... 'directory$''curr_folder$'/'wavfile$'.wav
   	object_name$ = selected$ ("Sound")



	########################################################
	# Create 3rd boundary (sentence tier)
	selectObject: "TextGrid 'name$'"
	Insert interval tier: sentence_tier, "Sentence"


	############ (3) Find all "sp"s, looping through; 

	number_of_intervals = Get number of intervals... word_tier

 	for i from 1 to number_of_intervals
		selectObject: "TextGrid 'name$'"
		interval_label$ = Get label of interval... word_tier 'i'

		if interval_label$ = "sp"

			begin_sp = Get starting point... word_tier 'i'
           	end_sp = Get end point... word_tier 'i'

			if begin_sp <> 0
				Insert boundary... sentence_tier 'begin_sp'
				Insert boundary... sentence_tier 'end_sp' - 0.00001
			endif


		endif
	endfor 



######################################################



Write to text file... 'outputdir$''name$'.TextGrid
selectObject: "Sound 'object_name$'"
Save as WAV file... 'outputdir$''object_name$'.wav

select all 
minus Strings list
#minus Strings Folder_list
Remove

endfor

