#include "mbed.h"
AnalogOut speaker(PA_4);
Ticker sampletick;
DigitalOut myled(LED1);
//Plays Audio Clip using Array in Flash
//
//setup const array in flash with audio values 
//from free wav file conversion tool at
//http://ccgi.cjseymour.plus.com/wavtocode/wavtocode.htm
//see https://os.mbed.com/users/4180_1/notebook/using-flash-to-play-audio-clips/
#include "cylonbyc.h"

#define sample_freq 192000
//get and set the frequency from wav conversion tool GUI
int i=0;

//interrupt routine to play next audio sample from array in flash
void audio_sample ()
{
    speaker.write_u16(sound_data[i]);
    i++;
    if (i>= NUM_ELEMENTS) {
        i = 0;
        sampletick.detach();
        myled = 0;
    }
}
int main()
{
    while(1) {
        myled = 1;
//use a ticker to play send next audio sample value to D/A
        sampletick.attach(&audio_sample, 1.0 / sample_freq);
//can do other things while audio plays with timer interrupts
        wait(2.0);
        
    }
}
