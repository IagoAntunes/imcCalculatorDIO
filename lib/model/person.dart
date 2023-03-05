class Person {
  bool gender;
  int weight;
  int height;
  int age;

  Person({
    this.age = 18,
    this.weight = 80,
    this.height = 172,
    this.gender = false,
  });

  double calculateImc(Person person) {
    return (person.weight / ((person.height / 100) * (person.height / 100)));
  }
}
