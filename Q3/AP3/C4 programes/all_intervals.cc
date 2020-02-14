/* Used to check that the code in the slides is correct */

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Task {
  int id;
  int starting;
  int finishing;
  Task(int i, int s, int f):
    id(i), starting(s), finishing(f){}
};

bool overlap(const Task& t1, const Task& t2) {
  return t1.finishing > t2.starting and t2.finishing > t1.starting;
}

// PRE: tasks is sorted increasingly by starting time
vector<int> all_intervals(const vector<Task>& tasks) {  
  int n = tasks.size();
  vector<int> labelling(n,-1);// -1 for unassigned label

  for (int i = 0; i < n; ++i) {
    // Mark not available labels for the ith task
    vector<int> available_label(n + 1, true); // large UB
    for (int j = 0; j < i; ++j)
      if (overlap(tasks[i],tasks[j])) 
	available_label[labelling[j]] = false;

    int l = 0;
    while (not available_label[l]) ++l;
    labelling[i] = l;
  }
  
  return labelling;
}

bool comp (const Task& t1, const Task& t2) {
  return t1.starting < t2.starting;
}

int main(){
  vector<Task> tasks;
  int s, f, id = 1;
  while (cin >> s >> f) {
    tasks.push_back(Task(id,s,f));
    ++id;
  }
  sort(tasks.begin(),tasks.end(),comp);
  vector<int> labelling = all_intervals(tasks);
  for (uint i = 0; i < tasks.size(); ++i)
    cout << "Task " <<  tasks[i].id << " gets resource " << labelling[i] << endl;
}
