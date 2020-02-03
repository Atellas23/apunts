/* Used to check that the code in the slides is correct */

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Task {
  int id;
  int duration;
  int deadline;
  Task(int i, int du, int de):
    id(i), duration(du), deadline(de){}
};

// PRE: tasks is sorted increasingly by deadline
vector<int> lateness(const vector<Task>& tasks) {
  int n = tasks.size();
  vector<int> starting_time(n);
  
  int t = 0;
  for (int i = 0; i < n; ++i) {
    starting_time[i] = t;
    t += tasks[i].duration;
  }
  
  return starting_time;
}

bool comp (const Task& t1, const Task& t2) {
  return t1.deadline <= t2.deadline;
}

int main(){
  vector<Task> tasks;
  int du, de, id = 1;
  while (cin >> du >> de) {
    tasks.push_back(Task(id,du,de));
    ++id;
  }
  sort(tasks.begin(), tasks.end(), comp);
  
  // PRE: deadline is sorted increasingly
  vector<int> starting_time = lateness(tasks);
  for (uint i = 0; i < tasks.size(); ++i)
    cout << "Task " <<  tasks[i].id << " starts at " << starting_time[i] << endl;
}
