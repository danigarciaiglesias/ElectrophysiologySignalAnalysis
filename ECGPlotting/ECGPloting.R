# ECG Plotting.
# Daniel García Iglesias
# October 2016

# ECG Plotting is by default configurated with 25 mm/seg and 25 mm/mV recording.

# Set ECG recorded parameters
SR <- 1000 #Sampling rate
ECGLen <- #ECG plotted length

#Derivatios to plot. Set 1 for 12 derivations and 2 for V1-V6 derivations plotting
Derivations <- 2
if (Derivations == 1) { DerivPlotted <- c ("I", "II", "III", "aVR", "aVL", "aVF", "V1", "V2", "V3", "V4", "V5", V6") }
else if (Derivations == 2) { DerivPlotted <- c ("V1", "V2", "V3", "V4", "V5", V6") }

