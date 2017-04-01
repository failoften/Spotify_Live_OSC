
import ddf.minim.*;

Minim minim;
AudioInput in;

boolean isChanging;

void setup()
{
  size(512, 200, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw()
{
  background(0);
  stroke(255);

  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    if (in.left.get(i) > 0) {
      line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
      line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
    } else {
      println("SILENCE = " + int(in.left.get(i)));
    }
  }
}

void changingTrack()
{
  if ( isChanging )
  {
  } else
  {
    isChanging = true;
  }
}