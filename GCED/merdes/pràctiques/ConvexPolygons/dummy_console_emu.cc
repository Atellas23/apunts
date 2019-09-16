#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

string initCreate = "you are creating a ";
string initRequest = "you are requesting the ";

vector<string> console_log;

void save_log() {
  ofstream logfile("report.log");
  for (auto s : console_log) logfile << s << endl;
  logfile.close();
}

void log(string& s) {
  console_log.push_back(s);
}

void main_stream(vector<string>& c) {
  if (c[0] == "create") cout << initCreate+c[1] << endl;
  else if (c[0] == "req") cout << initRequest+c[1] << endl;
  else cout << "error: unrecognized command" << endl;
}

vector<string> separate_words(string& s) {
  vector<string> command;
  string word = "";
  int l = s.length();
  for (int j = 0; j <= l; ++j) {
    if (s[j] == ' ' or j == l) {
      command.push_back(word);
      word = "";
    }
    else word = word + s[j];
  }
  return command;
}

// Custom command line example
int main() {
  // Set up the command interpreter
  string s;
  while (getline(cin, s)) {
    log(s);
    if (s[0] == '#') cout << '#' << endl; // Commentary check
    else {                                // Separate in different words (considered different when separated by a space ' ')
      vector<string> command = separate_words(s);
      main_stream(command);                   // Run command through the main command line stream
    }
  }
  save_log();
}
