# Application of FFT with FIR filter
> The only motto of this project is to make one understand how Fast Fourier Transform can be used in the simplest of ways to remove unwanted frequencies in a given signal. 
----------------
Those of us aware of what Digital Signal Processing (DSP) is and does, will undoubtedly have studied about FFT, its uses and applications. Before the uprise of FFT, the Discrete Fourier Transform (DFT) which does the same job as that of FFT existed, and it has not lost its charm even today. 

_Wondering why we humans were in dire need of FFT even though DFT existed to do the same job? I've mentioned a few important characteristics of FFT below for you to understand, keep reading!_


 Imagine you have a voice signal consisting of 512 samples, in order to know its frequency response one would need to compute DFT. If you know the formula for calculating DFT, you'd understand that the time it takes to do that computation is of order (_512 x 512_). Hold on! What if you have a signal with 10^6 samples? How long will you take to compute the frequency components? Doing simple math will tell you that it would be no less than 10^12. This could just take hours and hours which would simply consume a lot of power and more importantly, your precious time. This is where FFT comes in to save the day!

## Fast Fourier Transform (FFT):

* A fast Fourier transform (FFT) is an algorithm that calculates the discrete Fourier transform (DFT) of some sequence and transforms the structure of the cycle of a waveform into sine components.  
* A fast Fourier transform can be used in various types of signal processing. It may be useful in reading things like sound waves, or for any image-processing technologies. 
* A fast Fourier transform can be used to solve various types of equations, or show various types of frequency activity in useful ways.  
* For example, fast Fourier transform might be helpful in sound engineering, seismology or in voltage measurements.  

> <img src="DFT vs. FFT.jpg" width="400" height="250" >
For a sample set of 1024 values, the FFT is 102.4 times faster than the discrete Fourier transform (DFT). The basis for this remarkable speed advantage is the _bit-reversal scheme of the CooleyTukey algorithm._

**Note:** These are just a few important aspects of FFT, there is a lot more out there than this. 

## Steps followed in the project: 

Four sinusoidal signals with different frequencies were used to do this project as shown in figure (though the frequencies aren't clear). You'll find the hidden frequencies shortly.

> <img src="AllSignals.jpg" width="400" height="250" >

A noisy signal was generated using MATLAB rand command which was added to all the signals. The four signals along with noise were added to generate a single signal with different frequency components, have a look (not clear either!)

> <img src="OverallSignal.jpg" width="400" height="250" >

The FFT of this signal was computed using the fft() function and the frequency spectrum was plotted to visualize the frequency components. Now you clearly see the frequency components along with the noise. 

> <img src="FreqResponseOriginalSignal.jpg" width="400" height="250" >

Next, a BPF was generated using the Filter Designer Toolbox and desired parameters were set which looked something like this, see the Magnitude Spectrum? Interesting, isn't it? You can change the parameters as you like to get the desired outcome. I wanted to remove the noise and retain the frequencies which I initially created my signal with. Thus the parameters. 

> <img src="BPF_Toolbox.png" width="400" height="250" >

Thus designed filter was exported to the workspace as an object,  this filter was applied to the actual signal and corresponding FFT was computed to check for the frequency components retained. 

> <img src="FreqResponseAfterPassingBPF.jpg" width="400" height="250" >
 
I did this with both LPF and BPF just to get the hang of it, you can do as many modifications and as much processing as you like and have fun with the toolbox. The possibilities are wide. 

Here's an image comparing all the signals generated in the process.

> <img src="ComparisonOfAllSignals.jpg" width="500" height="350" >

## Thank you for reading! Hope it helped :)