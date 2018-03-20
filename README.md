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
There is an increasing usage of Speech Recognition systems developed by Google, Amazon, Apple and Microsoft in Mobile Phones, Laptops and more recently smart home speaker systems. With fast advancements in Machine Learning, Artificial Intelligence and Embedded Systems, these speech recognition systems are making their way into the common man's home performing everyday tasks. However there always vulnerabilities in any technology such as zero day vulnerabilities or hardware bugs. One such exploitation of the consumer hardware is the non-linearity of the microphones present in the devices. Inaudible sounds (Ultrasonic frequency) can be played using COTF devices to attack these devices by exploiting the above vulnerability. We chose to explore the security aspect of such system and the viability of attacking those systems. Ultrasonic sounds which are above 20 KHz and completely inaudible, can still be picked up the speech recognition systems in these devices through the non-linearity of the audio circuits. The non linearities of the microphones in mobile phone’s receiver demodulate the original low frequency components used to modulate the ultrasound carrier. The attack we choose to implement is the portable Dolphin Attack which is less expensive but more intensive to calculate and execute. Also the portable attack reduces the amount of physical intervention involved. The amount of damage that can be caused to the user can be both mental and monetary. Dolphin commands can be used to do prank calls or order takeouts or schedule Uber. We analyse the feasibility of carrying out the portable Dolphin attack and evaluate the results. 
</p>

# Related Work

You can use the [editor on GitHub](https://github.com/UCLA-ECE209AS-2018W/Aadithya-Nrithya/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

# Approach

The portable dolphin attack was chosen as the means of attack over the table top attack for two major reasons :
- Low Cost of Implementation
- Reduced physical Intervention

According to the analysis in [ ], the cost of implementing the attack through the portable mode was only a few dollars as opposed to the default table top which involved using expensive Ultrasonic wideband speaker Vifa [ ] and the Vector Signal Generator. The components that are required for carrying out the portable include :

- 3.5 mm Audio Jack pigtail-mono and stereo
- SparkFun Class-D audio amplifier TPA2005D1
- Samsung S7 Edge  as Attack phone
- Multiple Smartphones as Victim
- Ultrasonic transducer (UTR-1440K-TT-R)

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
