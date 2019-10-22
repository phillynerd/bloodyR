# bloodyR

## To avoid fainting, keep repeating "it's only a palette...it's only a palette"

A horror movie inspired palette package for R. 

## Installation
devtools::install_github("phillynerd/bloodyr")

## Functions 
This includes several functions to help you use the palettes: 

* horror_colors() a function that calls a list of various blood colors and returns hexcodes.  Can be used to call a specific blood color inside another function.  Colors include vintageblood, brightblood, blood, & darkblood. 
* horror_palettes() a function that calls the list of all palettes and returns hexcodes.  can be used to call a specific palette inside another function outside of scale_color_horror() or scale_fill_horror()
* scale_color_horror() - for ggplot2, allows you to directly call any palette
* scale_fill_horror() - for ggplot2, allows you to directly call any palette
* the_palettes_have_eyes(): for viewing individal palettes available in the package
 
### Available palettes:                  

* Sequential-ish: Exorcist, GetOut, NeonDemon_blue, NeonDemon_red, TheShining, SOTL, Suspiria, Greyscale
* Qualitative-ish: DawnoftheDead_Q, Excision_Q, Exorcist_Q, Nosferatu_Q, Suspiria_Q, TexasChainsaw_Q,
*  Divergent: Excision_Divergent,GetOut_Divergent,NeonDemon_Divergent,
 
Most palettes inspired by the awesome work of [@colorpalette.cinema] (https://www.instagram.com/colorpalette.cinema/) 
