# Dolphin Attack on Smart Home Systems
# About 

This is the project website for the course ECE 209 AS. This website contains the necessary material for the project ' Dolphin Attack on Smart Home Systems'. It includes
- Problem statement
- Related Work
- Approach
- Method
- Findings
- Analysis
- Discussion

# Problem Statement
<p align="justify">
There is an increasing usage of Speech Recognition systems developed by Google, Amazon, Apple and Microsoft in Mobile Phones, Laptops and more recently smart home speaker systems. With fast advances in Machine Learning, Artificial Intelligence and Embedded Systems, these speech recognition systems are making their way into the common man's home, performing everyday tasks. However there always vulnerabilities in any technology. One such vulnerability that can be exploited to a attacker's advantage is the non-linearity of the microphones present in the COTS devices. Inaudible sounds (Ultrasonic frequency) can used to attack these devices by exploiting the above vulnerability. Ultrasonic sounds which are above 20 KHz and completely inaudible, can still be picked up the speech recognition systems in these devices through the non-linearity of the audio circuits. The original low frequency components used to modulate the ultrasound carrier are demodulated and interpreted by the SR systems due to this effect. The attack we choose to implement is the portable Dolphin Attack which involves attacking mobile phones and laptops by transmitting attack commands from a smart phone over a ultrasonic transducer. This attack is relatively inexpensive and can be launched on the fly. The amount of damage that can be caused to the user can be both mental and monetary. Dolphin commands can be used to accomplish benign tasks like prank calls,order takeouts, schedule Uber and range upto malicious monetary transcations. We analyse the feasibility of carrying out the portable Dolphin attack and evaluate the results. 
</p>

# Related Work
<p align="justify">
Traditionally, several techniques have been used to attack Speech Recognition and Voice Control Systems. An interesting attack on the early generation Alexa in Amazon Echo was entirely unintentional[] NPR's weekend edition broadcast a Listen up section about Alexa which prompted a number of these devices to respond to the story by turning up the thermostat and shopping online. Carlini et al chose to attack the speech recognition system by hiding the attack commands such that they can be sdeciphered by the system but remain incomprehensible to the user. This attack is accomplished in both scenarios, when the attackers have knowledge of the SR system's internal structure and when they do not. This work is based on the work of Vaidya et al in mangling nromal input commands using an audio mangler which converts them into morphed sounds which retain the acoustic features of the key words. In CommaderSong, attack commands are embedded in songs which are then used to attack the voice control systems The wireless cahnnel may also be utilized for command injection.Chaouki et al show that specific electromagnetic commands can be coupled with the headphones used with smartphones in order to inject voice commands to the speech recognition systems. The attack closest to the Dolphin attack is the Backdoor Attack. Here, two ultrasonic signals, one carrying the attack command and another pilot tone used for original signal reconstruction are transmitted to the receiver. The microphone non linearities are ultilized to recover the original attack command and activate the speech recognition system. The Dolphin command is superior to the above approaches in that it can be accomplished without being noticed by the user, without any commodity hardware and is relatively inexpensive.
  

You can use the [editor on GitHub](https://github.com/UCLA-ECE209AS-2018W/Aadithya-Nrithya/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

# Approach
<p align="justify">
The portable dolphin attack was chosen as the means of attack over the table top attack for two major reasons :
- Low Cost of Implementation
- Reduced physical Intervention

According to the analysis in [ ], the cost of implementing the attack through the portable mode was only a few dollars as opposed to the default table top which involved using expensive Ultrasonic wideband speaker Vifa [ ] and the Vector Signal Generator. The components that are required for carrying out the portable include :

- 3.5 mm Audio Jack pigtail-mono and stereo
- SparkFun Class-D audio amplifier TPA2005D1
- Samsung S7 Edge  as Attack phone
- Multiple Smartphones as Victim
- Ultrasonic transducer (UTR-1440K-TT-R)

</p>

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/UCLA-ECE209AS-2018W/Aadithya-Nrithya/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.


# Reference
[ ] Zhang, Guoming, et al. "Dolphin Attack: Inaudible voice commands." Proceedings of the 2017 ACM SIGSAC Conference on Computer and Communications Security. ACM, 2017.
