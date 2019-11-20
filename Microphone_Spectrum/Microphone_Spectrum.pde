// Add sound library:
//   Sketch/Import Library/Add Library -> Sound (by the processing foundation)
//
// Displays spectrum from the microphone
//
import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 128; //512
float[] spectrum = new float[bands];

void setup() {
  size(512, 360);
  background(255);
    
  // Create an input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  in.play();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  
  // Apmlitude is proportional to mouse position on vertical axis
  in.amp(map(mouseY, height, 0, 0, 1));

  for(int i = 0; i < bands; i++){
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up to get more amplitude.
    line( i*4, height, i*4, height - spectrum[i]*height*10 );
  } 
}
