class InfoGroup {
  final int id;
  final String title;
  final List<String> info;

  const InfoGroup({required this.id, required this.title, required this.info});

  static const whoCanDonate = [
    InfoGroup(id: 0, title: 'Donneurs de sang :', info: _conditions),
    InfoGroup(
      id: 1,
      title: 'Vous ne devriez pas donner de sang si :',
      info: _doNotDonateIf,
    ),
    InfoGroup(
      id: 2,
      title: 'Attendre 6 mois avant le don si :',
      info: _wait6MonthsIf,
    ),
    InfoGroup(
      id: 3,
      title: 'Attendre 12 mois avant le don :',
      info: _wait12MonthsIf,
    ),
  ];
}

const _conditions = [
  'Doit être en bonne santé générale',
  "Doit être âgé d'au moins 18 ans et d'au plus 65 ans. Après 60 ans, les donneurs doivent obtenir l'approbation d'un médecin transfusionnel",
  'Doit peser au moins 50 kg',
  "Ne doit pas être à risque de transmettre des maladies transmissibles par le sang",
  '''
Doit avoir un taux d'hémoglobine ou d'hématocrite de:
     o 13,5-18 g/dl (0,40%) pour un homme.
     o 12,5-16 g/dl (0,38%) pour une femme.
  ''',
  'Doit avoir une tension artérielle systolique de 100-140 mmHg et une tension artérielle diastolique de 60-90 mmHg',
  'Doit avoir un pouls de 60 à 100 bpm (battements par minute)',
  'Doit avoir une température inférieure à 37,6°C',
  'Doit avoir un nombre de plaquettes supérieur à 150x109/L',
];

const _doNotDonateIf = [
  'Vous avez déjà pris de la drogue',
  'Votre partenaire se drogue',
  'Vous êtes séropositif',
  "Vous êtes un homme qui a eu des contacts sexuels avec un autre homme",
  'Votre partenaire est séropositif',
  "Vous avez plus d'un partenaire sexuel",
  "Vous pensez que votre partenaire a des relations sexuelles à risque",
];

const _wait6MonthsIf = [
  'Vous avez des partenaires occasionnels',
  'Vous avez changé de partenaire sexuel',
];

const _wait12MonthsIf = [
"Après un tatouage ou un piercing à l'oreille/au corps",
'Après une scarification (sauf si thérapeutique)',
"Si vous avez suivi un traitement d'acupuncture et que vous ne disposiez pas d'aiguilles à usage strictement personnel ou d'aiguilles à usage unique",
'Si vous avez été coupé avec des objets potentiellement contaminés (en partageant des lames de rasoir, par exemple)',
"Si vous avez eu un contact prolongé avec une peau lésée contaminée par des sécrétions ou du sang",
'Si vous avez été blessé avec une aiguille sale',
'En cas de morsure humaine',
'Après chirurgie ou évaluation endoscopique',
];
