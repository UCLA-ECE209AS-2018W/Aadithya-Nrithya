# Dolphin Attack on Smart Home Systems
# About 

This is the [project website](https://ucla-ece209as-2018w.github.io/Aadithya-Nrithya/) for the course ECE 209 AS. This website contains the necessary material for the project ' Dolphin Attack on Smart Home Systems'. It includes
- Problem statement
- Related Work
- Approach
- Method
- Findings
- Analysis
- Future Work

# Problem Statement
<p align="justify">
  
There is an increase in the use of Speech Recognition systems developed by Google, Amazon, Apple and Microsoft in mobile phones, laptops and more recently smart home devices. With fast advances in Machine Learning, Artificial Intelligence and Embedded Systems, these speech recognition(SR) systems are making their way into the common man's home, performing everyday tasks [1]. However, there are always vulnerabilities in any technology. One such vulnerability that can be exploited to a attacker's advantage is the non-linearity of the microphones present in the COTS devices. Inaudible sounds (Ultrasonic frequency) can used to attack these devices by exploiting the above vulnerability. The original low frequency components used to modulate the ultrasound carrier are demodulated and interpreted by the SR systems due to this effect. The attack we choose to implement is the portable Dolphin Attack which involves attacking mobile phones and laptops by transmitting attack commands from a smart phone over a ultrasonic transducer [2]. This attack is relatively inexpensive and can be launched on the go. The damage that can be caused to the user can be both mental and monetary. Dolphin commands can be used to accomplish benign tasks like prank calls,order takeouts, schedule Uber and range upto malicious monetary transcations. We analyse different implementations of the portable Dolphin attack and evaluate the results. 
  
</p>

# Related Work

<p align="justify">
  
Traditionally, several techniques have been used to attack Speech Recognition and Voice Control Systems. An interesting attack on the early generation Alexa in Amazon Echo was entirely unintentional [3] NPR's weekend edition broadcast a listen up section about Alexa which prompted a number of these devices to respond to the story by turning up the thermostat and shopping online. Carlini et al, chose to attack the speech recognition system by hiding the attack commands such that they can be deciphered by the system but remain incomprehensible to the user [4]. This attack is accomplished in both scenarios, when the attackers have knowledge of the SR system's internal structure and when they do not. This work is based on the work of Vaidya et al which involves mangling normal input commands using an audio mangler. This converts them into morphed sounds which retain the acoustic features of the key words [5]. In CommanderSong, attack commands are embedded in songs which are then used to attack the voice control systems [6]. The wireless channel may also be utilized for command injection. Chaouki et al show that specific electromagnetic interference signals can be coupled with the headphones used with smartphones in order to inject voice commands to the speech recognition systems [7]. The attack closest to the Dolphin attack is the Backdoor Attack [8]. Here, two ultrasonic signals, one carrying the attack command and another pilot tone used for original signal reconstruction, are transmitted to the receiver. The microphone non linearities are ultilized to recover the original attack command and activate the speech recognition system. The major difference between the Backdoor and Dolphin Attacks is the way the non linearities are leveraged to achieve the attack. Backdoor uses two ultrasonic signals and frequency modulation  as opposed to a single voice signal amplitude modulated on an ultrasonic carrier in the Dolphin Attack. The Dolphin attack is superior to the above approaches in that it can be accomplished without being noticed by the user, without any commodity hardware and is relatively inexpensive.
  
</p>

# Approach

The DolphinAttack can be accomplished using two methods
  
- Tabletop Attack 
- Portable Attack


## Tabletop Attack

<p align="justify">
This is the original version of the attack, carried out using custom hardware. It consists of :
</p> 

- Audio signal source
- Vector signal generator
- Vifa ultrasonic speaker

<p align="justify">
  
The attack commands are generated using a text to speech converter on a smart phone. The audio output is given to a vector signal generator which is used to modulate the input frequency on a high frequency carrier. The signal generator can be used to sweep over a range of frquencies to find the most effective attack frequency for a given phone model and SR system. The output of the signal generator is connected to a Vifa Ultrasonic speaker which transmits the modulated commands. The attack success can be tested on different SR systems like Siri, Cortana, Google Assistant, Alexa etc on different devices like laptops and mobilephones. However, this method is expensive and space consuming.
 
</p>



## Portable Attack

<p align="justify">
  
This is the "on the go" version of the attack, used to test the feasibility of attacking the victim while on the move, walking past him/her, for example. It consists of :
</p>

- Audio signal source
- Audio Amplifier
- Ultrasonic transducer

<p align="justify">
  
The attack commands are generated by recording the attacker's voice on a smart phone. It is then modulated on software or the output of signal generator from the tabletop attack is stored in the smartphone. This modulated audio signal is given as the input to an audio amplifier through the phone's audio jack. The amplifier output is used to drive the ultrasonic transducer. The range of this attack is slightly limited compared to the tabletop attack but can be increased by increasing the amplifier gain.
  
</p>

The portable dolphin attack was chosen as the means of attack over the table top attack for two major reasons :

- Low Cost of Implementation
- Reduced Physical Intervention

<p align="justify">
 
According to the analysis in [1], the cost of implementing the attack through the portable mode was only a few dollars as opposed to the default table top attack which involved using the expensive ultrasonic wideband speaker Vifa and the vector signal generator.
</p>

At the receiver side, the non linearity present in the device's microphone can be modeled as

- out(t ) = A*s<sub>in</sub>(t) + B*(s<sub>in</sub><sup>2</sup>(t))
 
<p align="justify">
In order to utilize this non linearity to demodulate the the baseband signal, the original voice signal is amplitude modulated using the following function
</p>

- s<sub>in</sub>(t)=m(t)*c(t) + c(t), where c(t)= cos(2*pi*F<sub>c</sub>*t)

<p align="justify">
From the two equations, the signal at the receiver end contains the the intended carrier and it's sideband frequencies and also harmonics and cross products at f<sub>m</sub>, 2(f<sub>c</sub>−f<sub>m</sub>), 2(f<sub>c</sub>+f<sub>m</sub>), 2f<sub>c</sub> , 2f<sub>c</sub>+f<sub>m</sub>, and 2f<sub>c</sub>−f<sub>m</sub>. The microphone is followed by an amplifier and a low pass filter which removes all components above the audible range. However, the original signal,f<sub>m</sub>, remains within the audible range and can be successfully recognized by the speech recognition system to perform the attack.
 
</p>

# Method

<p align="justify">
The components that are required for carrying out the portable attack include :
</p>

- 3.5 mm Audio Jack pigtail-mono and stereo
- SparkFun Class-D audio amplifier TPA2005D1
- STM32 Nucleo Board
- Samsung S7 Edge  as Attack phone
- Multiple Smartphones as Victim
- Ultrasonic transducer (UTR-1440K-TT-R)
- Battery

The Software includes 

- Matlab
- Audacity
- Mbed Online Compiler

### Samsung S7 Edge

<p align="justify">
  
The attack requires carrier frequency - baseband frequency to be greater than 20 kHz. The minimum sampling rate should be twice this value. Most smart phones only support a maximum sampling rate of upto 48 kHz, restricting the transmitted signal to a frequency of 24 kHz. This does not give us a wide range of frequencies to work with. Fortunately, the Samsung Galaxy S7 Edge supports a sampling rate of 192 kHz and lends itself well to constructing the attack.

</p>

### Audio Amplifier

<p align="justify">
  
The TPA2005D1 is chosen as it is a variable gain audio amplifier meant specifically to drive transducers. The default gain value is 2 but can be increased upto 10, thereby extending the range of the portable attack.

</p>

### Ultrasonic transducer (UTR-1440K-TT-R)

<p align="justify">
  
The Samsung phone provides a sufficient sampling rate, however it’s speaker's output frequencies are restricted to the audio range.
Thus a narrow band transducer is utilized for transmission of the attack signal over the ultrasonic band of 40 kHz. This particular carrier is chosen as it was the most widely available as opposed to other frequencies like 23 or 25 kHz.
  
</p>
  

### Victim devices

The attack was tested on various victim phones like
- Oneplus 5
- Xiaomi Redmi Note 4
- Samsung S6 Edge
- Samsung S7 Edge

Tablet
- Nexus 7

Apple MacBook

Wearable
- Apple Watch

## Initial Attack

<p align="justify">
  
Input voice signals were recorded on the Samsung S7 and amplitude modulated on a 40 kHz carrier using MATLAB. Two types of modulation were performed. One, using an inbuilt amplitude modulation function on MATLAB and another using the modulation function specific to exploiting the microphone's non linearity, as explained above. Observing the frequency spectrum of the resulting  modulated signals showed that the inbuilt function performed supressed carrier modulation while the custom function produces signals at the carrier frequency and two side bands. The output wave file was given as input to the audio amplifier, from the phone, through a 3.5mm stereo audio jack pigtail cable, as the phone had a stereo speaker. However, the amplifier operates on a differential input. So the left and right channels of the audio jack are combined together before connecting to the amplifier. This is powered by a 4.7V battery. The output of the audio amplifier is given as input to the ultrasonic transducer. The attack is tested on the above mentioned victim devices at varying distances and for various input commands like 'What is the temperature ?' , 'Ok Google' etc.,
  
</p>

<img src="Figures/Dolphin_attack.jpg" width="400" height="400"/> 
<figure>
      <img src="plots/5Kmonotone.png" alt='missing' />
        <figcaption>Matlab Transmitter Side Analysis</figcaption>
</figure>

### Findings

<p align="justify">
  
We found that the original signal was not reconstructed at the receiver end as expected. Further analysis of individual components was thus required. The audio jack cable output was connected to an oscilloscope. On sweeping the frequencies given as input to the jack from the phone, over a range of 20 Hz-20 kHz, it was found that the sound was cut off at 14kHz. In order to test if this filtering was done by the phone or the audio jack, the same test was repeated using different phones to find the same effect at the same frequency. Also, it was found that the phone could play 18 kHz and possibly beyond by manual testing using commodity earphones. The stereo jack was replaced by a 3.5mm mono jack and the experiment was repeated. This jack was found to cut off frequencies below 16 kHz. A similar phenomenon was observed in Apple earphones beyond 18kHz.

</p>

The link for the audio jack testing can be found [here](https://ucla-ece209as-2018w.github.io/Aadithya-Nrithya/)

<p align="justify">

Additionally, the non linearity model for the microphone at the receiver seemed to hold for the speaker on the attack side as well. This hypothesis was tested by connecting a probe from the laptop to the oscilloscope and playing the high frequency signal. Components within the audible range were observed. This caused frequency components in the audible range that hindered the proper recognition of commands, at the receiver end.
  
</p>

<img src="Figures/Testing.jpg" width="400" height="400"/> 


## Revised Attack 

<p align="justify">
The need for the audio jack pigtail cable was eliminated using an STM32 Nucleo Development board with an Mbed OS as the source of the attack signal. The Nucleo is equipped with a 12 bit DAC, the output of which is connected to the audio amplifier and then to the transducer. The setup's viability is first tested using montone signals. Audacity was used as the tool to generate monotone sine waves. The audio signal, sampled at 96 kHz was modulated on MATLAB. The resulting wav file was converted to array of samples stored in a C file using a tool called WAVtoCode Converter. The Mbed online compiler was used for generating the binary. The generated binary was flashed in the flash memory of the Nucleo board, which outputs the data to the DAC. 
 </p>

<img src="Figures/Revised.jpg" width="400" height="400"/> 

### Findings

<p align="justify">
The waveform of the signals at the transmitting and receiving end were generated and analysed using MATLAB and Audacity respectively. In the case of the low frequency monotones, the spectrum of the modulated signals was observed at the expected carrier frequency at the transmitter side. However, the expected harmonic on the receiver side could not be distinguished by plotting the spectrum of the signal recorded on the victim microphone. This was because of ambient noise in the range of a few hertz to almost 20 kHz.
When the frequency of the baseband signal was increased beyond the audible range, definite harmonics were observed on the receiver side
This was tested for different frequencies, receivers and at different locations and found consistent. However, the harmonics were not at the expected frequencies. Also, at 96 kHz, the reconstruction of the DAC output was not satisfactory, so that sampling rate was increased to 192 kHz. The attack did not succeed in activating the Speech Recognition Systems on the various test devices
</p>

<figure>
      <img src="plots/Voice.png" alt='missing' />
        <figcaption>Matlab Transmitter Side Analysis for voice </figcaption>
</figure> 

<figure>
      <img src="Figures/revised_receiver.PNG" alt='missing' />
</figure> 

<figure>
      <img src="Figures/30k_baseband.PNG" width="300" height="300" />
       <figcaption> Harmonics at receiver side for 30K baseband </figcaption>
</figure> 


# Analysis

<p align="justify">

The audible sounds in the speaker end while playing ultrasonic modulated signals is proof of the success of the non linearity model. The reason for the failure of the attack could be attributed to the lack of availability of the wide range of  ultrasonic transducers necessary for testing the attack on different victim devices, to find the ideal attack frequency. We were limited to using a very narrow band 40kHz transducer and later a 25 kHz transducer. Thus modulation could not be done over a range of frequencies to test the one most ideal for the attack. While the DolphinAttack paper mentions the frequency bands at which the attack was successful for different devices, there is no mention of the success rate or attack effectiveness. So a device on which the attack worked for a frequency range of 23-40 kHz could have been 100% successful at one of these frequencies and the other cases could have been due to the influence of external factors.

</p>

# Future Work

<p align="justify">

Moving forward, the attack can be tested using a number of transducers over a range of ultrasonic frequencies. Defence measures such as comparing the original voice signal with the demodulated attack signal at the receiver end and using machine learning techniques such as regression or classification  to predict the validity of the input command and allowing only legitimate commands to activate the system should be explored.
</p>

# Acknowledgements

<p align="justify">
  
We would like to thank Professor Mani Srivastava, Mr. Moustafa and all others at NESL for their guidance and unwavering support over the course of this project.

</p> 


# Reference
[1] https://www.inc.com/kevin-j-ryan/internet-trends-7-most-accurate-word-recognition-platforms.html

[2] Zhang, Guoming, et al. "Dolphin Attack: Inaudible voice commands." Proceedings of the 2017 ACM SIGSAC Conference on Computer and Communications Security. ACM, 2017.

[3] https://www.digitaltrends.com/home/amazon-echo-alexa-npr/

[4] Carlini, Nicholas, et al. "Hidden Voice Commands." USENIX Security Symposium. 2016.

[5] Vaidya, Tavish, et al. "Cocaine noodles: exploiting the gap between human and machine speech recognition." WOOT 15 (2015): 10-11.

[6] Yuan, Xuejing, et al. "CommanderSong: A Systematic Approach for Practical Adversarial Voice Recognition." arXiv preprint arXiv:1801.08535 (2018).

[7] Kasmi, Chaouki, and Jose Lopes Esteves. "IEMI threats for information security: Remote command injection on modern smartphones." IEEE Transactions on Electromagnetic Compatibility 57.6 (2015): 1752-1755.

[8] Roy, Nirupam, Haitham Hassanieh, and Romit Roy Choudhury. "BackDoor: Sounds that a microphone can record, but that humans can't hear." GetMobile: Mobile Computing and Communications 21.4 (2018): 25-29.


