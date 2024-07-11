void main(){
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');
  Employee jenny = Employee('제니');


  // instance를 만든 다음 실행(instance에 귀속)
  seulgi.name = 'gyou1';

  seulgi.printNameAndBuilding(); // 제 이름은 gyou1입니다. null 건물에서 근무하고 있습니다.
  chorong.printNameAndBuilding(); // 제 이름은 초롱입니다. null 건물에서 근무하고 있습니다.

  // class 실행하거나 값을 바꾸기(class에 귀속)
  Employee.building = '규원마을';
  
  seulgi.printNameAndBuilding(); // 제 이름은 gyou1입니다. 규원마을 건물에서 근무하고 있습니다.
  chorong.printNameAndBuilding(); // 제 이름은 초롱입니다. 규원마을 건물에서 근무하고 있습니다.
  jenny.printNameAndBuilding(); // 제 이름은 제니입니다. 규원마을 건물에서 근무하고 있습니다.

  // static method
  Employee.printBuilding(); // 저희는 규원마을 건물에서 근무중입니다.
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고 있는 건물
  static String? building;
  // 알바생 이름
  String name;

  Employee(
    this.name,
  );

  void printNameAndBuilding(){
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }

  static void printBuilding(){
    print('저희는 $building 건물에서 근무중입니다.');
  }
}