## Created on Thursday, December  5, 2013 at 3:24pm EST by WeekendEditor on WeekendEditorMachine.
## UnCopyright (u) 2013, nobody in particular.  All rights reversed.  As if you care.

##
## When is Dodds's Day?  When is Weekend Editrix's Day?
## Who are these "Dodds" and "Weekend Editrix" people, anyway?
##

## > cambSunData    <- doit(location = "Cambridge")
## > parisSunData   <- doit(location = "Paris")
## > athensSunData  <- doit(location = "Athens")
## > elkhartSunData <- doit(location = "Elkhart")
##
## up-arrow   is c-x 8 <RET> 2191
## degree     is C-x 8 <RET> b0
## dash/minus is C-x 8 <RET> 2212
doit <- function(location    = "Cambridge",
                 sunDataFile = sprintf("./sun-times-%s-%s.tsv", format(Sys.time(), "%Y"), location),
                 plotFile    = sub("^(.*)\\.tsv$", "\\1.png", sunDataFile)) {
  ## Dodds himself: http://web.fastermac.net/~dodds/analemma/greeting-message.htm (now defunct)
  ## Data sources:  https://www.timeanddate.com/sun/usa/boston
  ##                https://www.timeanddate.com/sun/france/paris
  ##                https://www.timeanddate.com/sun/greece/athens
  ## General notes: https://analemma.com/

  parseDate <- function(d) { as.POSIXct(strptime(d, format = "%d-%b-%y")) }

  parseTime <- function(d, t) {                        # Combine date & time into POSIXct
    as.POSIXct(strptime(sprintf("%s %s", as.character(d), as.character(t)),
                        format = "%d-%b-%y %I:%M %p")) #
  }                                                    #

  parseAngle <- function(theta) { as.numeric(gsub("^([+-]?[0-9\\.]+).*$", "\\1", theta)) }

  significantDays <- function(sunData) {               # Dodds, Weekend Editrix, and solstice
    sunDataTimes <- transform(sunData,                 # Hours since midnight
                              SunsetTime  = Sunset  - Date,
                              SunriseTime = Sunrise - Date)
    ## Each one gets several days @ extremum; take the middle day in the range
    dodds    <- subset(sunDataTimes, subset = SunsetTime == min(SunsetTime))
    dodds    <- dodds[ceiling(nrow(dodds) / 2),       "Date", drop = TRUE]
    solstice <- subset(sunDataTimes, subset = Day.Sec    == min(Day.Sec))
    solstice <- solstice[ceiling(nrow(solstice) / 2), "Date", drop = TRUE]
    editrix  <- subset(sunDataTimes, subset = SunriseTime == max(SunriseTime))
    editrix  <- editrix[ceiling(nrow(editrix) / 2),   "Date", drop = TRUE]
    c("Dodds" = dodds, "Solstice" = solstice, "Weekend Editrix" = editrix)
  }                                                    #

  withPars <- function(bodyFn, ...) {                  # Call bodyFn with graphics pars set
    oldParList <- NULL                                 # Capture old vals: params changed only
    tryCatch({ oldParList <- par(...); bodyFn() }, finally = par(oldParList))
  }                                                    # Guarantee old vals restored @ end

  withGraphicsToImageFile <- function(file, width, height, ask, deviceFn, bodyFn) {
    if (is.null(file)) {                               # If no file, then execute directly
      pixelsPerInch <- par("cra") / par("cin")         #   px/in horiz & vertical; new device
      dev.off()                                        #   on screen wants size in inches!
      dev.new(width = width / pixelsPerInch[[1]], height = height / pixelsPerInch[[2]])
      withPars(bodyFn, "ask" = ask)                    #   plotting goes to screen device
    } else                                             # Else there is a file, so execute
      tryCatch({                                       #  w/graphics redirected to a PNG file
        deviceFn(file, width = width, height = height, bg = "transparent")
        withPars(bodyFn, "ask" = FALSE)                # No asking, just go ahead and plot
      }, finally = dev.off())                          # Guarantee closure of the file device
  }                                                    #

  withPNG <- function(file, width, height, ask, bodyFn) {# Capture graphics to .png file
    withGraphicsToImageFile(file, width, height, ask, png, bodyFn)
  }                                                    #

  drawDateLine <- function(d, lab1, lab2) {            # Draw vertical line @ given date,
    parsedD <- as.POSIXct(d)                           #  with labels
    abline(v = parsedD, lty = "dotted", col = "black") # Black, dotted line
    text(x = parsedD, y = 7.5, srt = 90, adj = c(0, -0.3), labels = lab1)
    if (!is.null(lab2))                                # If 2nd label supplied, do that too
      text(x = parsedD, y = 7.5, srt = 90, adj = c(0, +1.2), labels = lab2)
  }                                                    #

  ## NB: dropped Nov 01-03, which was confusing things with the DST->EST time change.
  sunData <- transform(transform(subset(read.table(sunDataFile, sep = "\t", header = TRUE),
                                        ## Drop boring columns
                                        select = -c(Day.Length, Difference, Distance)),
                                 ## Parse dates & times as POSIX times
                                 Date     = parseDate(Date),
                                 Sunrise  = parseTime(Date, Sunrise),
                                 Sunset   = parseTime(Date, Sunset),
                               # Altitude = parseAngle(Altitude),
                                 Noon     = parseTime(Date, Noon)),
                       Day.Sec = as.numeric(difftime(Sunset, Sunrise, units = "secs")))

  sigDays     <- significantDays(sunData)              # Days of significance:
  doddsDay    <- sigDays[["Dodds"]]                    # - earliest sunset
  solsticeDay <- sigDays[["Solstice"]]                 # - shortest length
  editrixDay  <- sigDays[["Weekend Editrix"]]                  # - latest sunrise
  cat("Days of earliest sunset, shortest length, and latest sunrise:\n")
  print(subset(sunData, subset = Date %in% sigDays))   # Show these Very Important Days

  withPNG(sprintf(plotFile, location), 700, 700, FALSE, function() {
    withPars(function() {                              # Save/restore graphics parameters
      pointColors <- c("Sunrise" = "red", "Noon" = "green", "Sunset" = "blue")
      matplot(x = sunData$"Date",                      # Date of Nov - Jan
              y = subset(transform(sunData,            # Time of event (hr since midnight)
                                   Sunrise = as.numeric(Sunrise - Date),
                                   Noon    = as.numeric(Noon    - Date),
                                   Sunset  = as.numeric(Sunset  - Date)),
                         select = c(Sunrise, Noon, Sunset)),
              type = "p", col = "black", pch = 21, bg = pointColors, cex = 1.5,
              xaxt = "n", xlab = NA, ylab = "Time of Day (hr since midnight)",
              main = sprintf("%s Sunrise/Noon/Sunset: %s Winter Solstice",
                             location, strftime(sunData[1, "Date"], format = "%Y")))

      ticks <- seq(from = 1, to = nrow(sunData), by = 7)# Weekly ticks on time axis
      axis(1, sunData[ticks, "Date"], format(sunData[ticks, "Date"], "%b %d"))

      legend("topright", inset = c(0.02, 0.20), bg = "antiquewhite", pch = 21, pt.cex = 2,
             ## Reverse order to keep color labels in same order top-to-bottom as curves
             pt.bg = rev(pointColors), legend = rev(names(pointColors)))

      ## Add vertical lines at Very Important Days
      drawDateLine(doddsDay,    sprintf("Earliest Sunset: %s", doddsDay),    "Dodds's Day")
      drawDateLine(solsticeDay, sprintf("Shortest Day: %s",    solsticeDay), "Winter Solstice")
      drawDateLine(editrixDay,  sprintf("Latest Sunrise: %s",  editrixDay),  "Weekend Editrix's Day")

    }, "pty" = "m",                                    # Maximal plotting area
       "bg"  = "transparent",                          # Transparent background
       "ps"  = 18,                                     # Larger type size
       "las" = 2,                                      # Labels perp to axes
       "mgp" = c(2.2, 0.6, 0),                         # Pull in on tick labels & axis title
       "mar" = c(5, 3.5, 2, 0.5))                      # Allocate margins
  })                                                   # Done capturing graphics

  invisible(sunData)                                   # Return data, invisibly
}                                                      #
