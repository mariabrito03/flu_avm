
class Band {
  String id;
  String nomen;
  int numerusVotum;

  Band({
    required this.id,
    required this.nomen,
    required this.numerusVotum
  });
}


List<Band> bands = [
  Band(id: '1', nomen: 'OneDirection', numerusVotum: 5),
  Band(id: '2', nomen: 'Crepusculonas', numerusVotum: 1),
  Band(id: '3', nomen: 'Zorrilla Girls', numerusVotum: 2), 
  Band(id: '4', nomen: 'Kardachans', numerusVotum: 6), 
  Band(id: '5', nomen: 'Valencia Ultraviolencia', numerusVotum: 8), 
];