class Chart {
  static List<Chart> _charts = <Chart>[
    Chart(subject: "4011", absence: 20, presence: 80),
    Chart(subject: "4021", absence: 25, presence: 74),
    Chart(subject: "4031", absence: 22, presence: 78)
  ];

  String subject;
  double absence;
  double presence;

  Chart({this.subject, this.absence, this.presence});

  String getSubjectName(int index) {
    return _charts[index].subject;
  }

  /// Absence Attendances
  double getAbsence(int index) {
    return _charts[index].absence;
  }

  void setAbsence(int index, double amount) {
    _charts[index].absence = amount;
  }

  /// Presence Attendances
  double getPresence(int index) {
    return _charts[index].presence;
  }

  void setPresence(int index, double amount) {
    _charts[index].presence = amount;
  }

  void addChart(String name, double presence, double absence) {
    _charts.add(Chart(subject: name, absence: absence, presence: presence));
  }

  void addAbsence() {
    this.absence = this.absence++;
  }

  void addPresence() {
    this.presence = this.presence++;
  }
}
