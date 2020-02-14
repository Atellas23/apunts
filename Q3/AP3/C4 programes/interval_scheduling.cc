/* Used to check that the code in the slides is correct */

#include <iostream>
#include <vector>
#include <climits>
#include <algorithm>
using namespace std;

struct Task {
  int id;
  int starting;
  int finishing;
  Task(int i, int s, int f):
    id(i), starting(s), finishing(f){}
};


// PRE: task is sorted increasingly by finishing time
vector<int> interval_scheduling (const vector<Task>& tasks) {
  int n = tasks.size();
  vector<int> res; // result
  int idx = 0;
  int last_finish_time = INT_MIN;

  while (idx < n) {
    // Look for non-overlapping task with smallest finishing time
    while (tasks[idx].starting < last_finish_time and idx < n) ++idx;
    if (idx < n) {  // Add tasks[idx] to solution
      res.push_back(tasks[idx].id);
      last_finish_time = tasks[idx].finishing;
    }
  }
  return res;     
}

bool before (const Task& t1, const Task& t2) {
  return t1.finishing < t2.finishing;
}

int main(){
  vector<Task> tasks;
  int s, f, id = 1;
  while (cin >> s >> f) {
    tasks.push_back(Task(id,s,f));
    ++id;
  }
  sort(tasks.begin(), tasks.end(), before);

  vector<int> result = interval_scheduling(tasks);
  for (auto& x: result) cout << x << endl;
}


// Llegir i ordenar!!!!
