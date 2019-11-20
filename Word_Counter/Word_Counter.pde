// Takes some input text file, counts words and displays them
// More common words appear larger

IntDict counts;
String[] lines;
String allWords;
String[] tokens;

void setup(){  
  fullScreen();
  background(0);
  
  counts = new IntDict();
  lines = loadStrings("SampleText.txt");
  
  allWords = join(lines, "\n");
  tokens = splitTokens(allWords, "\n .?!,:;\"");
  
  for(int i = 0; i < tokens.length; i++){
    String word = tokens[i];
    word = word.toLowerCase();
    if(counts.hasKey(word)){
      counts.increment(word);
    }
    else{
      counts.set(word,1);
    }
  }
  
  String[] keys = counts.keyArray();
  for(String k : keys){
    int count = counts.get(k);
    textSize(count * 2);
    float x = random(width);
    float y = random(height);
    text(k, x, y);
  }
}

void draw(){}
