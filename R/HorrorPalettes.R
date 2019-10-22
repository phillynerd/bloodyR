#horror palettes

#' horror_cols
#'
#' Assorted shades of blood. Any updates to this palette should be made within this object. This object is used by other functions; if you need to call hex codes directly use horror_colors.
#' @keywords colors, theme
#' @export
#' @examples
#'  horror_cols #shows all colors and codes
#'  horror_cols['blood']

# List of all main colors we use
horror_cols <- c(vintageblood = 	"#9D1C05",
                 brightblood = "#CA2A1E",
                 blood = "#6C150A",
                 darkblood = "#470d01")

#' horror_cols
#'
#' Function to extract various shades of blood as hex codes
#' @param ... Character names of horror_cols. Options include vintageblood, brightblood, blood, and darkblood.
#' @keywords colors, theme
#' @export
#' @examples
#' horror_colors('vintageblood')
#' horror_colors('brightblood', 'darkblood')

horror_colors <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(horror_cols)

  horror_cols[cols]
}

#' horror_pals
#'
#' A list of horror movie inspired palettes.  Many palettes from colorpalette.cinema on Instagram. Any updates to these palettes should be made within this object. This object is used by other functions; if you need to call palettes directly use horror_palettes().
#'
#' @keywords palettes, theme
#' @export
#' @examples
#'  horror_pals['SOTL']


# List of all palettes we have available

horror_pals <- list(
  #sequential
  TheShining = c("#B2471B", "#923009", "#6C150A", "#55120A", "#37200E"),
  SOTL = c("#100C0B", "#371A16", 	"#470D01", "#7F3623", "#DCB8A2"),
  Exorcist = c(	"#0C0D11", 	"#12121C", "#242843", 	"#363C5C", "#626EA2", "#7E87C0", 	"#C3B2ED"),
  Suspiria = c("#0D0503", "#2A0A0B","#490C13","#CF2E4F","#CA5D7D", "#DEC6D4"),
  NeonDemon_blue = c("#181D33", 	"#19334E", 	"#0C4C65", "#0A667D", 	"#0B899F", "#13A6C2"),
  NeonDemon_red = c("#0A0509", 	"#170B19", "#3C1019", "#641616"),
  GetOut = c("#16110E", "#240726", "#2B0820", "#431B40",	"#62238D", "#573895", "#3A5465"),
  #divergent
  GetOut_Divergent = c("#16110E", "#240726", "#2B0820", "#431B40",	"#62238D", "#573895", "#3A5465", "#334E69", 	"#243455", 	"#5B2928"),
  Excision_Divergent = c("#501C0F", "#9C3C24","#D08158","#DCCEB4", "#67A6B7","#57919D","#2F605D"),
  NeonDemon_Divergent = c("#181D33", 	"#19334E", 	"#0C4C65", "#0A667D", 	"#0B899F", "#13A6C2", "#641616", "#3C1019", "#170B19" , "#0A0509"),
  #qualitative
  DawnoftheDead_Q = c("#B2A9AA", "#0A0509", "#5B5638", "#E2DBAD",	"#22260B", "#AA8B76", "#4E1D0F", "#E9E5E2"),
  Suspiria_Q = c("#2A0A0B", "#CF2E4F", "#2D3573", "#CA5D7D", "#DEC6D4", "#490C13"),
  Excision_Q = c(	"#D08158", 	"#57919D", "#9C3C24", "#2F605D", "#501C0F", "#67A6B7"),
  TexasChainsaw_Q = c("#040605", "#684A42", 	"#44272B", "#521826", "#793037", 	"#A36363", 	"#A08888", "#444B3B", "#26372D", "#18222B"),
  Nosferatu_Q = c(	"#000000", "#192533", "#2F455D", 	"#486682", "#485663",  "#908976",  "#747567", "#645B4C", "#60424A", "#F1D690"),
  Exorcist_Q = c("#242843", 	"#615EB5", "#626EA2",	"#C3B2ED", "#666D61", "#98A095", "#B1BA1F", "#D5DA91"),
  Greyscale = c("#fafafa", "#f2f2f2", "#e9e9e9", "#a9a9a9", "#6a6a6a", "#4b4b4b", "#292929"))

#' horror_palettes
#'
#' Return function to interpolate a Spring Health color palette
#'
#' @param palette Character name of palette in SH_pals. Default palette is Qualitative1. Options include sequential color palettes
#' (PrimaryGreen based on paradiso, SecondaryOrange based on Flamingo, TertiaryYellow, TertiaryGreen, TertiaryStormy, and Greyscale), diverging palettes (Divergent_PF, using paradiso and flamingo; Divergent_YS, using yellow and stormy), and qualitative palettes (Qualitative1 and Qualitative2)
#' @param reverse Boolean indicating whether the palette should be reversed. Default is FALSE
#' @param ... Additional arguments to pass to colorRampPalette()
#' @keywords palettes, scales, theme
#' @export
#' @examples
#' horror_palettes('GetOut')

horror_palettes <- function(palette = "GetOut", reverse = FALSE, ...) {
  pal <- horror_pals[[palette]]

  if (reverse)
    pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' scale_color_horror
#'
#' ggplot2 compatible function for selecting the color scale based on Spring Health palettes
#'
#' @param palette Character name of palette in horror_pals. Default palette is Exorcist_Q.
#'                Options include sequential color palettes (PrimaryGreen based on paradiso, SecondaryOrange based on Flamingo,
#'                TertiaryYellow, TertiaryGreen, TertiaryStormy, and Greyscale), diverging palettes (Divergent_PF, using paradiso and flamingo;
#'                Divergent_YS, using yellow and stormy), and qualitative palettes (Qualitative1 and Qualitative2)
#' @param discrete Boolean indicating whether color aesthetic is discrete or not. Default is TRUE.
#' @param reverse Boolean indicating whether the palette should be reversed. Default is FALSE.
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @keywords palettes, scales, theme
#' @export
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'  geom_point(size = 4) +
#'  scale_color_horror(reverse = F, 'Nosferatu_Q')
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
#'   geom_point(size = 4, alpha = .6) +
#'   scale_color_horror(discrete = F, palette = 'NeonDemon_Divergent')


scale_color_horror <- function(palette = "Exorcist_Q", discrete = TRUE,
                           reverse = FALSE, ...) {
  pal <- horror_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("color", paste0("horror_", palette), palette = pal,
                   ...)
  } else {
    scale_color_gradientn(colors = pal(256), ...)
  }
}

#' scale_fill_horror
#'
#' ggplot2 compatible function for selecting the fill scale based on Spring Health palettes
#'
#' @param palette Character name of palette in horror_palettes. Options: "Exorcist", "GetOut", "NeonDemon_blue",
#' "NeonDemon_red", "TheShining", "SOTL", "Suspiria", "Excision_Divergent", "GetOut_Divergent", "NeonDemon_Divergent",
#' DawnoftheDead_Q", "Excision_Q", "Exorcist_Q", "Nosferatu_Q", "Suspiria_Q", "TexasChainsaw_Q", "Greyscale".
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#' geom_bar() +
#' theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#' scale_fill_horror(palette = "TheShining", guide = 'none')

scale_fill_horror <- function(palette = "Exorcist_Q", discrete = TRUE, reverse = FALSE,
                          ...) {
  pal <- horror_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("horror_", palette), palette = pal,
                   ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' the_palettes_have_eyes
#'
#' A function that will print the colors for any one of the available palettes.
#' This function only works on a single palette at a time
#'
#' @param palette Character name of palette in horror_palettes. Options: "Exorcist", "GetOut", "NeonDemon_blue",
#' "NeonDemon_red", "TheShining", "SOTL", "Suspiria", "Excision_Divergent", "GetOut_Divergent", "NeonDemon_Divergent",
#' DawnoftheDead_Q", "Excision_Q", "Exorcist_Q", "Nosferatu_Q", "Suspiria_Q", "TexasChainsaw_Q", "Greyscale".
#' @export
#' @examples
#' show_me_the_palette("GetOut")
#' show_me_the_palette("Nosferatu_Q")



the_palettes_have_eyes <- function(palette) {
  if(palette %in% c("Exorcist", "GetOut", "NeonDemon_blue",
                    "NeonDemon_red", "TheShining", "SOTL", "Suspiria",

                    "Excision_Divergent","GetOut_Divergent","NeonDemon_Divergent",

                    "DawnoftheDead_Q", "Excision_Q", "Nosferatu_Q", "Suspiria_Q",
                     "TexasChainsaw_Q", "Exorcist_Q",

                     "Greyscale")){

    cols <- horror_pals[[palette]]

    n_seq <- seq_along(cols)

    image(n_seq, 1, as.matrix(n_seq), col = cols,
          xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n",
          main = paste0("Horror Palette: ", palette))

    text(n_seq, 1, cols, col = "black", srt = 270)
  } else {stop("Invalid palette name entered. Must be: Exorcist, GetOut, NeonDemon_blue,
                    NeonDemon_red, TheShining, SOTL, Suspiria,
                    Excision_Divergent,GetOut_Divergent,NeonDemon_Divergent,
                    DawnoftheDead_Q, Excision_Q, Exorcist_Q, Nosferatu_Q, Suspiria_Q, TexasChainsaw_Q,
                    Greyscale")}
}



