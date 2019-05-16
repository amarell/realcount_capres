class RealCount{
  String ts;
  Chart chart;
  Progress progress;

  RealCount({
    this.ts,
    this.chart,
    this.progress
});

  factory RealCount.fromJson(Map<String, dynamic> parsedJson){
    return new RealCount(
      ts: parsedJson['ts'],
      chart: Chart.fromJson(parsedJson['chart']),
      progress: Progress.fromJson(parsedJson['progress']),
    );
  }
}

class Chart{
  int jokowi;
  int prabowo;

  Chart({
    this.jokowi,
    this.prabowo
});

  factory Chart.fromJson(Map<String, dynamic> json){
    return new Chart(
      jokowi: json['21'],
      prabowo: json['22']
    );
  }
}

class Progress{
  int total;
  int proses;

  Progress({
    this.proses,
    this.total
  });
    factory Progress.fromJson(Map<String, dynamic> json){
    return new Progress(
      proses: json['proses'],
      total: json['total']
    );
  }

}