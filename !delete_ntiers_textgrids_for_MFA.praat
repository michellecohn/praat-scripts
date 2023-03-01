################################################################################################
#
# Delete largest, then 2nd largest tier to get soundfile ready for MFA
#
#
# MC 2/15/22; updated 3/1/23
#
################################################################################################



inputdirectory$ = "/Users/michellecohn/data/"
outputdirector$ = "/Users/michellecohn/Desktop/mfa_ready/"


stimList = Create Strings as file list... stimList 'inputdirectory$'*IDS.TextGrid
n = Get number of strings

for i from 1 to n

	# READ IN EACH STIMULUS
	select stimList

	curFile$ = Get string... 'i'
	curSound = Read from file... 'inputdirectory$''curFile$'
	id$ = curFile$ - ".TextGrid"


#########################################################################################################
#
#	Update with numbers of tiers you want to remove, starting with the largest ones first! 
#	NB: if you remove a lower tier, they get reordered, so start from largest --> smallest
#
#########################################################################################################

	Remove tier... 3
	Remove tier... 2

#########################################################################################################

	Save as text file... 'outputdirectory$''id$'.TextGrid

	select all
	minus stimList
	Remove

endfor

