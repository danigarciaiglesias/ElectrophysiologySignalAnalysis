### Periodogram Function for R
###
### Daniel García Iglesias
### github.com/danigarciaiglesias
###
### Ago 2016

periodogram <- function (x, win, fs, range, plot) {

# x for the signal to computate the periodogram
# win for the windowing to use. If no windowning / rectangular windowing, write rep (1, length(x))
# fs is the sampling rate of the signal to analyze
# range is "onesided" or "twosided" 
# plot is a value to indicate if plotting is necesary (1 or 0)


	n <- length (x)

	if (range == "onesided") {range <- 1}
	else if (range == "twosided") {range <- 2}
	
	nfft <- n
  
  # By defautl nfft is equal to signal's length. nfft value can be added.
  # Also you can check that nfft value is 2^z :
	#nfft <- max (256, 2^ceiling(log2(n)))

	# Windowing of the signal

	if (length(win) == n) {x <- x*win}
	else if (length(win)<n) {
		x[1:length(win)] <- x*win
		x [(length(win)+1):n] <- x [(length(win)+1):n]*0
	}
  
  
  ## Compute periodogram
  
	Pxx <- ((abs (fft (x)))^ 2) / n
  
  # If nfft parameter is used, the fft (x, nfft) should be used instead fft(x)
	# Pxx <- ((abs (fft (x,nfft)))^ 2) / n

	Pxx <- Pxx / fs


		## Generate output arguments

	if (range == 1) {	# onesided
	Pxx <- Pxx[1:((nfft/2)+1)] + c(0, rev(Pxx[(nfft/2+2):nfft]), 0)
	f <- (0:(nfft/2))/nfft;
	}

	else if (range == 2) {	# twosided
	      f <- c (0:(nfft-1))/nfft;
	}

	f <- f * fs

		## Plot
    # If plot is selected
    
  if (plot==1) {
	   PxxLog <- 10 * log10(Pxx)
	   plot (f, PxxLog, "l", xlab="frequency [Hz]", ylab="Power density [dB/Hz]", main="Periodogram Power Spectral Density Estimate")
  }

  
		## Return
    
	Answer <- list (Pxx=Pxx, PxxLog=PxxLog, f=f)
	return (invisible(Answer))

}
