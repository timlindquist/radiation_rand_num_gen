# radiation_rand_num_gen
generating random numbers from events detected on a geiger counter excited by Uranium


uart_tx.v created by jakeh12

Build command: "./build -1k geiger"

Call MATLAB script with: process('geigerRaw.txt');
Have logging serial software write to a file titled "geigerCap.txt" make sure it closes the file after every write. CoolTerm has an option in Settings --> Receive uncheck "Leave File open while capturing"
Conversion command: "./hexConvert.sh" this converts geigerCap.txt to geigerRaw.txt

Start serial capture, hexConvert.sh and process.m in parallel to see histogram plot in real time
