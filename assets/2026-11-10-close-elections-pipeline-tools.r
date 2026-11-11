## Created on Tuesday, April 23, 2019 at 2:53pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2020, SomeWeekendReading.  All rights reserved.  As if you care.

##
## Collection of various tools for writing command-line-callable pipelines.  All of this stuff
## exists in other, smaller files but is collected here for convenience.
##

##
## For use after subsetting a dataframe with factor columns.
##

dropUnusedFactorLevels <- function(df)  {              # Subset may have removed some rows which
  sapply(1 : ncol(df), function(colnum) {              # are the only users of certain factor
    if (class(df[, colnum]) == "factor")               # levels.  Redo the factors, to use only
      df[, colnum] <<- factor(df[, colnum])            # the levels that are present, so
  })                                                   # levels() returns something sane.
  df                                                   #
}                                                      #

##
## Save dataframe as tab-separated text file with annotations I like.
##

saveDataframe <- function(df, destFile, na = "NA") {   # Write out a tab-separated file
  if (!is.null(destFile))                              # If destination file is not NULL
    write.table(df, file = destFile, quote = FALSE, sep = "\t", na = na,
                row.names = FALSE, col.names = TRUE)   # No quotes, no row names, but do
}                                                      #  use col names

saveDataframeCompressed <- function(df, destFile, na = "NA") {
  destFileCompressed <- sprintf("%s.gz", destFile)     # Name of gzip'd destination file
  saveDataframe(df, gzfile(destFileCompressed), na)    # Save to compressing stream
  destFileCompressed                                   # Return name of compressed file
}                                                      #

library("tools")                                       # For file_ext()
loadCompressedDataframe <- function(path, sep = "\t", header = TRUE, ...) {
  ## NB: there will often be warnings about reading from the closed stream; the authors
  ## swear that these are (a) unavoidable and (b) harmless.  *sigh*
  conn <- switch(tolower(file_ext(path)),              # Dispatch on file extension to figure
                 "gz" = gzfile,                        #  out compression type; open
                 "bz" = bzfile,                        #  decompressing stream to file and
                 "xz" = xzfile,                        #  read & return dataframe
                 stop(sprintf("Unknown compressed file extension: %s?!", file_ext(path))))(path, "r")
  tryCatch(read.table(conn, sep = sep, header = header, ...), finally = close(conn))
}                                                      #  ensuring stream gets closed

saveResultsCompressed <- function(df, path) {          # Save dataframe, compressed, yacking about it
  compressedPath <- saveDataframeCompressed(df, path)  #
  cat(sprintf("\n* Saved compressed to %s.\n", compressedPath))
  TRUE                                                 # Flag that we did it, for maybeAssign()
}                                                      #

loadOrComputeDf <- function(dfPath, dfFn) {            # Don't recompute dataframe if save file exists
  dfPathGZ <- paste(dfPath, ".gz", sep = "")           # Compressed save file
  if (file.exists(dfPathGZ)) {                         # If compressed save file exists,
    cat(sprintf("\n* Loading existing data from %s", dfPathGZ))
    loadCompressedDataframe(dfPathGZ)                  #  then just load dataframe from it
  } else {                                             # Else no save file exists,
    ans <- dfFn()                                      #  so compute dataframe (yacking to stdout),
    saveResultsCompressed(ans, dfPath)                 #  save as compressed file,
    ans                                                #  and return it
  }                                                    #
}                                                      #

library("gdata")                                       # To read binary .xls file
read.xlsInCLocale <- function(f, ...) {                # Make Perl shut up about locale!
  oldLCALL <- Sys.getenv("LC_ALL")                     # Preserve existing LC_ALL value, if any
  tryCatch({                                           # Guarantee we restore old val
    Sys.setenv(LC_ALL = "C")                           # Set locale to "C", and do our work:
    read.xls(f, ...)                                   #  read .xls file for return value
  }, finally = Sys.setenv(LC_ALL = oldLCALL))          # Restore old LC_ALL before returning
}                                                      #  result of read.xls().

showDataframeHeadTail <- function(df) {                # Show representative values in df
  print(head(df))                                      # Describe the dataframe contents
  cat("...\n")                                         #  by showing the first few rows, ellipsis,
  print(tail(df))                                      #  and the last few rows
}                                                      #

## NB: withTranscript() has a dependency on makeDirectory().

##
## Capturing text output to streams, files, and strings
##

withOutputTo <- function(conn, bodyFn, split = FALSE, type = "output", closeConn = TRUE) {
  ## Connection (aka stream) oriented subroutine for everything else.
  tryCatch({                                           # Capture output to connection
    sink(conn, split = split, type = type)             # Tee or not; stdout|stderr
    ## *** NB: stderr can't be tee'd to file & console simultaneously, so errors not logged!
    bodyFn()                                           # Execute bodhi, return whatever it does
  }, finally = { sink(); flush(conn); if (closeConn) close(conn) })
}                                                      #

withOutputToFile <- function(filename, bodyFn) {       # Capture output to a text file
  withOutputTo(file(filename, open = "w"), bodyFn)     # Just a wrapper for withOutputTo()
}                                                      # Returns whatever bodyFn() does

withOutputToString <- function(bodyFn, split = FALSE) {# Capture output to a string
  ## NB 3 caveats:
  ## - You can't call textConnectionValue() on a closed text connection.  So we must tell
  ##   withOutputTo() NOT to close it, then get the value, then guarantee closure ourselves.
  ## - If the last line is not terminated by a newline, it doesn't get put into the output
  ##   and flush() doesn't force it.  So we check isIncomplete() & do our own nl when needed.
  ## - Also, text connections return a vector of lines.  We reassemble that into 1 string,
  ##   w/separator newlines.
  ##
  ## *** Add ability to add a prefix to each line?  E.g., indentation, line label, ...
  ##     e.g. a fn called on line # and line, returns a prefix for that line, default "".
  c <- textConnection(NULL, open = "w", local = TRUE)  # Text connection to receive chars
  tryCatch({                                           # Guarantee we close the connection
    withOutputTo(c, bodyFn, split = split, closeConn = FALSE)
    if (isIncomplete(c)) cat("\n", file = c)           # flush() doesn't force this, alas...
    paste(textConnectionValue(c), collapse = "\n")     # Paste together vector of strings
  }, finally = close(c))                               # Close text connection
}                                                      # Returns string, not bodyFn() value

printToString <- function(x) {                         # (Almost) how to print to a string
  ## Just a simpler, less functional, older, sometimes more convenient version of the above.
  ## Returns the vector of lines for times when you want that (e.g., calling legend()).
  ## *** Could be subsumed into withOutputToString() if we made the paste-up step optional
  c <- textConnection(NULL, open = "w", local = TRUE)  # Text connection to receive chars
  tryCatch({                                           # Ensure text connection gets closed
    sink(c); print(x); sink()                          # Print to the text connection
    textConnectionValue(c)                             # Really a vector of lines, not 1 str
  }, finally = close(c))                               # Reliably close the text connection
}                                                      #

##
## These are useful for analysis pipelines, to note each phase & capture a transcript.
##

archiveAnalysisScript <- function(outDir, ...) {       # Copy scripts to output dir (archiving)
  scripts <- list(...)                                 # Get list of &rest args
  lapply(scripts, function(script) {                   # Map over all scripts
    scriptName <- basename(script)                     # Name of script (no directory)
    scriptDest <- file.path(outDir, scriptName)        # Where it's going
    file.copy(script, scriptDest, overwrite = TRUE)    # NB: agnostic about script directory!
  })                                                   #
  cat(sprintf("* Archived analysis script(s) to %s:", outDir))
  sapply(scripts, function(script) { cat(sprintf("\n  - %s", script)) })
  cat("\n")                                            # Describe what we did
}                                                      # CITOKATE!  Heh.

heraldPhase <- function(msg) {                         # Announce phase of computation with
  cat(paste("\n", msg, ":\n", sep = ""))               #  an underlined title: sprintf magic
  cat(chartr(" ", "-", sprintf("%*s\n\n", nchar(msg) + 1, "")))
}                                                      #  prints "", padded w/n+1 spaces

makeDirectory <- function(dir, okIfExists = TRUE) {    # Make a directory, cautiously
  if (!file.exists(dir))                               # If dir doesn't exist, make it
    dir.create(dir, showWarnings = TRUE, recursive = TRUE)
  else {                                               # Else it DOES already exist
    stopifnot(file.info(dir)$"isdir")                  #  signal if it's not a diretory
    stopifnot(okIfExists)                              #  signal if it IS a directory and
  }                                                    #    that's not ok
}                                                      #

maybeAssign <- function(varname, bodyFn) {             # Do something if var does not have val
  ## Conditional assignment of global var, if not already bound.  Useful for memo-izing
  ## longish computations like loading big datasets.
  if (exists(varname) && !is.null(get(varname)))       # If var exists & is not NULL, say so
    cat(sprintf("\n* Using already-loaded value of %s.\n", varname))
  else                                                 # Else does not exist or no useful value
    assign(varname, bodyFn(), envir = .GlobalEnv)      #  call body, assign val in global env
}                                                      #

removePreviousResults <- function(vars) {              # Make computation start all over again
  cat(sprintf("* Removing globals holding previous results"))
  root     <- globalenv()                              # Global environment
  bindings <- ls(all.names = TRUE, envir = root)       # Global variables in the global environment
  sapply(vars, function(v) {                           # Map over globals holding previous results
    if (v %in% bindings) {                             #  If it's bound as a global,
      rm(list = v, envir = root)                       #    remove it
      cat(sprintf("\n  - Removed global %s", v))       #    and say so
    }                                                  #  Else do nothing so there's no diagnostic
  })                                                   #
  cat("\n\n* Done.\n")                                 # Yep, we did that.
}                                                      #

withTranscript <- function(inDir, resultsDir, transcriptFile, name, bodyFn) {

  transcriptPath <- NULL                               # Just to establish scope for this var

  bodyFn2 <- function() {                              # What we wrap around bodyFn()
    dateFormat <- "%a %b %d %H:%M:%S %Y"               # How we want to print start/end dates
    startTime  <- Sys.time()                           # When we started as POSIXct
    cat(sprintf(paste("\n* %s on %s\n",                # Describe what we're about to do:
                      "  - input data directory: %s\n",#  where data came from,
                      "  - results directory:    %s\n",#  where results went,
                      "  - transcript to:        %s\n",#  and where the transcript goes
                      sep = ""),                       #  for later examination on transcript.
                name, format(startTime, dateFormat), inDir, resultsDir, transcriptPath))
    val        <- bodyFn()                             # Capture return value of bodyFn()
    finishTime <- Sys.time()                           # When we finished as POSIXct
    cat(sprintf("\n* %s completed %s (%.1f sec elapsed).\n",
                name, format(finishTime, dateFormat),  # Report elapsed time in seconds:
                as.numeric(finishTime - startTime, units = "secs")))
    val                                                # Returns whatever bodyFn() returns
  }                                                    #

  makeDirectory(resultsDir)                            # Make it if not already there
  invisible(                                           # Return value is invisible (if big)
    if (is.null(transcriptFile)) {                     # Not making transcript (e.g., if caller
      transcriptPath <- "nowhere"                      #  is doing so); dest is nowhere.
      bodyFn2()                                        #
    } else {                                           #
      transcriptPath <- file.path(resultsDir, transcriptFile)
      conn           <- file(transcriptPath, open = "w")# Open connection to transcript file
      withOutputTo(conn, bodyFn2, split = TRUE)        #
    })                                                 #
}                                                      #

##
## Randumb tools that come in handy from time to time
##

##
## Estimate a ratio from numerator & denominator measurements.
##
## Unpaired section inspired from a whiteboard discussion with 'chim Theilhaber.
##
## Needs a test case, to compare against an obviously correct answer.
## Here, ratio should be exp(2) / exp(1) = e, and that's what we see @ large data sizes:
## > ratioConfidenceLimits(rlnorm(1000, meanlog = 2, sdlog = 1), rlnorm(1000, meanlog = 1, sdlog = 1))
##    ratio      ucl      lcl
## 2.739337 2.990190 2.509529
ratioConfidenceLimits <- function(ns, ds, alpha = 0.05, paired = FALSE) {
  ## Given separate measurements of numerator and denominator, estimate the ratio
  ## and its alpha-th upper & lower confidence limits.
  ##
  ## Assume the numerators and denominators are approximately lognormally distributed.
  ## - We log transform so the ordinary means & standard deviations tell all.
  ## - Then re-exponentiate estimate the ratio, and its confidence limits (alpha/2
  ##   chance of being above the upper, and alpha/2 chance of being below the lower).
  ##
  ## - Depending on whether the data are paired, we have 2 ways of getting the mean of
  ##   the log ratio and its standard error.
  ## - Once we have those, we can exponentiate to get the estimator for the ratio
  ##   and its confidence limits.
  ## - Return value: a list with fields "ratio", "ucl", and "lcl" for the ratio estimator and
  ##   its upper and lower confidence limits, respectively.
  if (paired) {                                        # If data are paired:
    stopifnot(length(ns) == length(ds))                #  insist nums & denoms be same length
    logRatios      <- log(mapply("/", ns, ds))         #  compute logs of PAIRWISE ratios
    meanLogRatio   <- mean(logRatios)                  #  mean of logs of ratios
    seMeanLogRatio <- sd(logRatios) / sqrt(length(ns)) #  se of mean of logs of ratios
  } else {                                             # Else data are not paired:
    logNs          <- log(ns)                          #  logs of numerators
    logDs          <- log(ds)                          #  logs of denominators
    meanLogRatio   <- mean(logNs) - mean(logDs)        #  mean of log ratio & its std err
    seMeanLogRatio <- sqrt(var(logNs) / length(ns) + var(logDs) / length(ds))
  }                                                    # Now exponentiate to get the ratio
  c("ratio" = exp(meanLogRatio),                       #   estimator & upper/lower conf limits
    "ucl"   = exp(qnorm(alpha / 2, mean = meanLogRatio, sd = seMeanLogRatio, lower = FALSE)),
    "lcl"   = exp(qnorm(alpha / 2, mean = meanLogRatio, sd = seMeanLogRatio)))
}                                                      #

tableRowColTotals <- function(tbl) {                   # Add row & col totals to a table
  tbl <- cbind(tbl, rowSums(tbl))                      # Put on col of row sums on right
  colnames(tbl)[[ncol(tbl)]] <- "Totals"               # Add title for row sums
  tbl <- rbind(tbl, colSums(tbl))                      # Put on row of col sums on bottom
  rownames(tbl)[[nrow(tbl)]] <- "Totals"               # Add title for col sums
  tbl                                                  # Return the annotated table
}                                                      #

sortTableByNames <- function(tbl) {                    # Sort table rows & columns so
  tbl[order(rownames(tbl)), order(colnames(tbl))]      #  the row & col names are in order
}                                                      #

transposeDataframe <- function(df, col1Name) {         # Transpose df w/some kind of names in col 1
  rownames(df)       <- as.character(df[, 1])          # 1st col goes into rownames
  tdf                <- cbind("foo" = colnames(df)[-1], as.data.frame(t(subset(df, select = -1))))
  colnames(tdf)[[1]] <- col1Name                       # Transpose beyond 1st col, then orig colnames
  rownames(tdf)      <- NULL                           #  in col1, name it how we like, remove rownames
  tdf                                                  # Return transposed dataframe
}                                                      #
