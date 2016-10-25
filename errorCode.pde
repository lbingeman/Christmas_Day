//code for displaying code
void labelList() { 
  while (errorList.size () > 20) { //limit size of display code to 20 lines 
    errorList.remove(0);
  }
  //label1.setText("" + errorList.get(0));
  //display error code  
  for (int i = 1; i < errorList.size(); i++) { 
    //label1.setText(label1.getText() + char(10) + errorList.get(i));
    if (errorList.size() == 20) {
      println("ive printed number: " + i + " . List length " + errorList.size() + " " + errorList.get(19));
    }
    else {
      println("ive printed number: " + i + " . List length " + errorList.get(i));
    }
  }
}