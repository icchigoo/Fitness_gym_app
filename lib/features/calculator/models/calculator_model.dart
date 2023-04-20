class CalTile {
  const CalTile({required this.title, required this.leading});
  final String leading;
  final String title;
  static const List<CalTile> getCalData = [
    CalTile(title: 'Body Mass Index', leading: 'BMI'),
    CalTile(title: 'Basal Metabolic Rate', leading: 'BMR'),
    CalTile(title: 'Body Fat Percentage', leading: 'BFP'),
    CalTile(title: 'Ideal Body Weight', leading: 'IBW'),
    CalTile(title: 'Waist-Hip ratio', leading: 'WHR'),
    CalTile(title: 'A Body Shape Index', leading: 'ABSI'),
  ];
}

class CalResult {
  final String description;
  const CalResult({required this.description});
  static const List<CalResult> getCalResult = [
    CalResult(
      description:
          'If your BMI is less than 18.5, it falls within the underweight range. If your BMI is 18.5 to 24.9, it falls within the Healthy Weight range. If your BMI is 25.0 to 29.9, it falls within the overweight range. If your BMI is 30.0 or higher, it falls within the obese range.',
    ),
    CalResult(
      description:
          "Your BMR score is a number which refers to how many calories you burn at rest. Most people's BMR is between 1000 – 2000. This means that they need to take in between 1000 – 2000 calories each day to fuel their basic functions while in a resting state.",
    ),
    CalResult(
      description:
          "However, generally 14-17% BFP is a fit, and healthy range, although 18-25% is considered acceptable. Male athletes, depending on the sport, usually have between 6 and 13% BFP.",
    ),
    CalResult(
      description:
          "Males: IBW = 50 kg + 2.3 kg for each inch over 5 feet. Females: IBW = 45.5 kg + 2.3 kg for each inch over 5 feet.",
    ),
    CalResult(
      description:
          "Men should have a waist to hip ratio slightly under a 1.0 - a . 99 according to this study. Women should have a waist to hip ratio under 1.0 - a . 90 or lower.",
    ),
    CalResult(
      description:
          "A normal range for BSI has not been established, as it is a relatively new measure and research on its clinical significance is ongoing. However, some studies suggest that a BSI of less than 0.077 is associated with a lower risk of cardiometabolic disease in both men and women. It's important to note that the BSI is just one of many measures of body composition and health, and should be considered in the context of an individual's overall health profile.",
    )
  ];
}
