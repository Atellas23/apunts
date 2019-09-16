#include <iostream>
#include <fstream>
#include "Polygon.h"
using namespace std;

vector<Polygon> polygonList;
vector<string> console_log;
string end_of_file = "[end of file]";

/* CONVEX HULL USING THE GRAHAM SCAN METHOD */

bool abans(Point a, Point b) {
  if (a.getX() != b.getX()) return a.getX() > b.getX();
  else return a.getY() > b.getY();
}

void resort(vector<Point>& points) {
  // search for min x (and min y in case of a tie)
  int idx = 0;
  int min_x = points[idx].getX(), min_y = points[idx].getY();
  int n = points.size();
  for (int i = 1; i < n; ++i) {
	if (points[i].getX() < min_x) {
	  min_x = points[i].getX();
	  idx = i;
    }
    else if (points[i].getX() == min_x) {
	  if (points[i].getY() < min_y) {
		min_y = points[i].getY();
		idx = i;
	  }
    }
  }
  if (idx == 0) return;	// if nothing has to be changed, return the original vector unchanged
  // reorder in cyclical order
  vector<Point> aux;
  for (int j = idx; j < n; ++j) {
	aux.push_back(points[idx]);
	points.erase(points.begin()+idx);
  }
  for (int j = 0; j < idx; ++j) {
	aux.push_back(points[j]);
  }
  points.clear();
  points = aux;
  aux.clear();
}

bool leftof(Point p1, Point p2, Point p3) {
  return (p2.getX()-p1.getX())*(p3.getY()-p1.getY()) >= (p2.getY()-p1.getY())*(p3.getX()-p1.getX());
}

// Convex hull using the graham scan
// Precondition: the size of the points vector is at least 3
vector<Point> convexHull(vector<Point> points) {
  int n = points.size();
  if (n < 3) return points;
  sort(points.begin(), points.end(), abans);
  vector<Point> Q;
  Q.push_back(points[0]); Q.push_back(points[1]); Q.push_back(points[2]);
  int m = 2;
  for (int k = 3; k < n; ++k) {
    while (m > 0 and leftof(Q[m-1],Q[m],points[k])) --m;
    ++m;
    int s = Q.size();
    if (m < s) Q[m] = points[k];
    else Q.push_back(points[k]);
  }
  resort(Q);
  return Q;
}

/*----------------------------------------------------------------------------*/

bool inside(Point a, Polygon p) {
  vector<Point> tempPoints = p.getPoints();
  int size = tempPoints.size();
  for (int i = 0; i < size; ++i) {
    if (a == tempPoints[i]) return true;
  }
  vector<Point> hulledPoints = convexHull(tempPoints);
  tempPoints.push_back(a);
  return hulledPoints == convexHull(tempPoints);
}

void error(int error_id) {
  if (error_id == 0) cout << "error: unrecognized command" << endl;
  if (error_id == 1) cout << "error: undefined identifier" << endl;
  if (error_id == 2) cout << "error: wrong number or type of arguments" << endl;
  if (error_id == 3) cout << "error: wrong format" << endl;
  if (error_id == 4) cout << "error: no such file or directory" << endl;
}

vector<string> separate_words(string& s) {
  vector<string> command;
  int l = s.length();
  string word = "";
  for (int j = 0; j <= l; ++j) {
    if (s[j] == ' ' or j == l) {
      command.push_back(word);
      word = "";
    }
    else word = word + s[j];
  }
  return command;
}

int troba(string& id, int left = 0, int right = polygonList.size()) {
  if (polygonList.size() == 0) return -1;
  // This function looks for a name in polygonList taking advantage of the fact
  // that it is ordered in lexicographical order
  int mid = (left + right)/2;
  string tempName = polygonList[mid].getName();
  if ((left == mid or right == mid) and id != tempName) return -1;
  else if (id == tempName) return mid;
  else if (id > tempName) return troba(id,mid,right);
  else if (id < tempName) return troba(id,left,mid);
  else return -1;
}

void save_log() {
  ofstream logfile("report.log");
  for (string s : console_log) logfile << s << endl;
  logfile.close();
}

void log(string& s) {
  console_log.push_back(s);
}

bool polygonOrder(Polygon p1, Polygon p2) {
  return p1.getName() < p2.getName();
}

void main_stream(vector<string>& c) {
  // Check if id exists in vector polygonList
  if (c[0] == "polygon") {
    int i = troba(c[1]);
    if (i >= 0) {
      cout << "identifier already exists! overwriting..." << endl;
      polygonList.erase(polygonList.begin()+i);
    }
    string name = c[1];
    int n = c.size();
    vector<Point> punts;
    for (i = 2; i < n; i += 2) {
      Point tempPoint(stod(c[i]), stod(c[i+1]));
      punts.push_back(tempPoint);
    }
    Polygon tempPolygon(name,punts);
    polygonList.push_back(tempPolygon);
    sort(polygonList.begin(), polygonList.end(), polygonOrder);
    cout << "ok" << endl;
  }

  /* CUSTOM COMMANDS */
  else if (c[0] == "num") cout << "the size of polygonList is " << polygonList.size() << '!' << endl;
  else if (c[0] == "exists") {
    if (troba(c[1]) >= 0) cout << "yes" << endl;
    else cout << "no" << endl;
  }
  /* CUSTOM COMMANDS */

  else if (c[0] == "perimeter") {
    int idx = troba(c[1]);
    if (idx < 0) error(1);
    else cout << polygonList[idx].perimeter() << endl;
  }
  else if (c[0] == "area") {
    string id = c[1];
    int idx = troba(c[1]);
    if (idx < 0) error(1);
    else cout << polygonList[idx].area() << endl;
  }
  else if (c[0] == "print") {
    int idx = troba(c[1]);
    if (idx < 0) error(1);
    else {
      vector<Point> hull = convexHull(polygonList[idx].getPoints());
      int n = hull.size();
      cout << c[1] + ' ' << hull[0].getX() << ' ' << hull[0].getY();
      for (int i = 1; i < n; ++i) cout << ' ' << hull[i].getX() << ' ' << hull[i].getY();
      cout << endl;
    }
  }
  else if (c[0] == "list") {
    int n = polygonList.size();
    if (n == 0) cout << "the list is empty!" << endl;
    else {
      cout << polygonList[0].getName();
      for (int i = 1; i < n; ++i) cout << ' ' + polygonList[i].getName();
      cout << endl;
    }
  }
  else if (c[0] == "load") {
    ifstream eat;
    eat.open(c[1]);
    if (not eat.good()) {
      error(4);
      return;
    }
    string food;
    while (getline(eat,food)) {
      log(food);
      // Separate in different words (considered different when separated by a space ' ')
      vector<string> command1 = separate_words(food);
      int i = troba(command1[0]);
      if (i >= 0) polygonList.erase(polygonList.begin()+i);
      int n = command1.size();
      vector<Point> puntsRNDM;
      for (i = 1; i < n; i += 2) {
        Point tempPunt(stod(command1[i]), stod(command1[i+1]));
        puntsRNDM.push_back(tempPunt);
      }
      Polygon tempPolygon(command1[0],puntsRNDM);
      polygonList.push_back(tempPolygon);
      sort(polygonList.begin(), polygonList.end(), polygonOrder);
    }
    eat.close();
    log(end_of_file);
    cout << "ok" << endl;
  }
  else if (c[0] == "save") {
    int idx = troba(c[2]);
    if (idx < 0) error(1);
    else {
      ofstream throw_up(c[1]);
      throw_up.setf(ios::fixed);
      throw_up.precision(3);
      Polygon tempPol = polygonList[idx];
      vector<Point> tempVec = tempPol.getPoints();
      int n = tempVec.size();
      throw_up << tempPol.getName();
      for (int i = 0; i < n; ++i) throw_up << ' ' << tempVec[i].getX() << ' ' << tempVec[i].getY();
      throw_up << endl;
      throw_up.close();
      cout << "ok" << endl;
    }
  }
  else if (c[0] == "setcol") {
    int idx = troba(c[1]);
    if (c.size() != 5) error(2);
    else if (idx < 0) error(1);
    else {
      vector<double> tempCol(3,0);
      for (int i = 2; i < 5; ++i) {
        int tempLength = c[i].length();
        for (int j = 0; j < tempLength; ++j) {
          if ((c[i][j] < '0' or c[i][j] > '9') and c[i][j] != '.') {
            error(3);
            return;
          }
        }
      }
      // If format is correct...
      tempCol[0] = stod(c[2]);  tempCol[1] = stod(c[3]);  tempCol[2] = stod(c[4]);
      for (int i = 0; i < 3; ++i) {
        if (stod(c[i]) > 1 or stod(c[i]) < 0) {
          error(3);
          return;
        }
      }
      polygonList[idx].setcol(tempCol);
      cout << "ok" << endl;
    }
  }
  else if (c[0] == "vertices") {
    int idx = troba(c[1]);
    if (idx < 0) error(1);
    else {
      vector<Point> temp = polygonList[idx].getPoints();
      cout << convexHull(temp).size() << endl;
    }
  }
  else if (c[0] == "centroid") {
    int idx = troba(c[1]);
    if (idx < 0) error(1);
    else {
      Point o = polygonList[idx].centroid();
      cout << o.getX() << ' ' << o.getY() << endl;
    }
  }
  else if (c[0] == "union") {
    if (c.size() != 4 and c.size() != 3) {
      error(2);
      return;
    }
    else if (c.size() == 4) {
      int idx2 = troba(c[2]);
      if (idx2 < 0) {
        error(1);
        return;
      }
      int idx3 = troba(c[3]);
      if (idx3 < 0) {
        error(1);
        return;
      }
      vector<Point> temp;
      vector<Point> tempP2 = polygonList[idx2].getPoints();
      vector<Point> tempP3 = polygonList[idx3].getPoints();
      int n2 = tempP2.size();
      int n3 = tempP3.size();
      for (int i = 0; i < n2; ++i) temp.push_back(tempP2[i]);
      for (int i = 0; i < n3; ++i) temp.push_back(tempP3[i]);
      int idx1 = troba(c[1]);
      if (idx1 >= 0) polygonList.erase(polygonList.begin()+idx1);
      vector<Point> vec = convexHull(temp);
      Polygon p(c[1],vec);
      polygonList.push_back(p);
      sort(polygonList.begin(), polygonList.end(), polygonOrder);
      cout << "ok" << endl;
    }
    else {
      int idx1 = troba(c[1]);
      if (idx1 < 0) {
        error(1);
        return;
      }
      int idx2 = troba(c[2]);
      if (idx2 < 0) {
        error(1);
        return;
      }
      vector<Point> tempP1 = polygonList[idx1].getPoints();
      vector<Point> tempP2 = polygonList[idx2].getPoints();
      int n2 = tempP2.size();
      for (int i = 0; i < n2; ++i) tempP1.push_back(tempP2[i]);
      vector<double> tempCol = polygonList[idx1].getcolor();
      polygonList.erase(polygonList.begin()+idx1);
      Polygon p(c[1],convexHull(tempP1),tempCol);
      polygonList.push_back(p);
      cout << "ok" << endl;
    }
  }
  else if (c[0] == "intersection") {
    if (c.size() != 4 and c.size() != 3) {
      error(2);
      return;
    }
    else if (c.size() == 4) {
      int idx2 = troba(c[2]);
      if (idx2 < 0) {
        error(1);
        return;
      }
      int idx3 = troba(c[3]);
      if (idx3 < 0) {
        error(1);
        return;
      }
      Polygon tempP2 = polygonList[idx2];
      Polygon tempP3 = polygonList[idx3];
      vector<Point> tempPoints2 = tempP2.getPoints();
      vector<Point> tempPoints3 = tempP3.getPoints();
      vector<Point> intersect;
      for (int i = 0; i < tempP3.getSize(); ++i) {
        if (inside(tempPoints3[i],tempP2)) intersect.push_back(tempPoints3[i]);
      }
      for (int j = 0; j < tempP2.getSize(); ++j) {
        if (inside(tempPoints2[j],tempP3)) intersect.push_back(tempPoints2[j]);
      }
      
    }
  }
  else if (c[0] == "inside") {
    int idx = troba(c[3]);
    if (idx < 0) {
      error(1);
      return;
    }
    Point a(stod(c[1]),stod(c[2]));
    if (inside(a,polygonList[idx])) cout << "yes" << endl;
    else cout << "no" << endl;
  }
  else error(0);
}

// Convex Polygon calculator
int main() {
  // Set up the command interpreter and output

  cout.setf(ios::fixed);
  cout.precision(3);
  string s;
  while (getline(cin, s)) {
    log(s);
    if (s[0] == '#') cout << '#' << endl; // Commentary check
    else {
      // Separate in different words (considered different when separated by a space ' ')
      vector<string> command = separate_words(s);
      // Run command through the main calculator stream
      main_stream(command);
    }
  }
  save_log();
}
