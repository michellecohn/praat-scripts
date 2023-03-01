################
#
# 
#
# Combine MFA'd TextGrid (2 levels per speaker: phone + word)
# With other non-speech annotations on other TextGrid tiers (e.g., from ELAN)
# Here: condition, presence of error
#
# MC 3/24/21
# 
################

inputdirectory$ = "/Volumes/Extreme_SSD/2021_NSFZoomStudy_Adults/wav_and_textgrids(TIERS_reordered)/"
mfa_textgrid_directory$ = "/Volumes/Extreme_SSD/2021_NSFZoomStudy_Adults/wav_and_textgrids(MFA-d)/"
outputdirectory$ = "/Volumes/Extreme_SSD/2021_NSFZoomStudy_Adults/wav_and_textgrids(MFA-d_and_combined_with_annotationTIERS)/"


Create Strings as file list... list 'mfa_textgrid_directory$'*.TextGrid
number_files = Get number of strings

##########  LOAD IN ALL THE FILES ########## 
#for ifile to 1
for ifile to number_files

	select Strings list
	sound$ = Get string... ifile
	Read from file... 'mfa_textgrid_directory$''sound$'
	id$ = sound$ - ".TextGrid"
	Rename... "'id$'_MFA"
	
	Read from file... 'inputdirectory$''sound$'
	Rename... "'id$'_Orig"
	
	selectObject: "TextGrid _'id$'_MFA_"
	plusObject: "TextGrid _'id$'_Orig_"
	Merge

	Write to text file... 'outputdirectory$''id$'.TextGrid


	#select all
	##minus Strings list
	#Remove

endfor