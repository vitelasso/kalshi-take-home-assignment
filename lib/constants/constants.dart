class Constants {
  //App title
  static const String strAppTitle = 'Kalshi';

  static const String strCommonOk = 'OK';
  static const String strCommonContinue = 'Continue';
  static const String strCommonReturn = 'Return';

  static const String strFinantialWellnessCalculation = 'Let\'s find out your financial wellness score.';
  static const String strFinantialWellnessTest = 'Financial wellness test';
  static const String strEnterInformation = 'Enter your financial information below';
  static const String strAnnualIncome = 'Annual income';
  static const String strMonthlyCosts = 'Monthly Costs';
  static const String strFinancialEncryptedInfo = 'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.';
  static const String strFinantialWellnessScore = 'Here\'s your financial wellness score.';


  static const String strFinantialWellnessScoreTitleHealthy = 'Congratulations!';
  static const String strFinantialWellnessScoreSubTitleHealthy = 'Your financial wellness score is Healthy.';
  static const String strFinantialWellnessScoreTitleMedium = 'There is room for improvement.';
  static const String strFinantialWellnessScoreSubTitleMedium = 'Your financial wellness score is Average.';
  static const String strFinantialWellnessScoreTitleLow = 'Caution!';
  static const String strFinantialWellnessScoreSubTitleLow = 'Your financial wellness score is Unhealthy.';

  static const Map<String, String> strFinantialWellnessScoreTitleMap = {
  'HEALTHY': strFinantialWellnessScoreTitleHealthy,
  'MEDIUM': strFinantialWellnessScoreTitleMedium,
  'LOW': strFinantialWellnessScoreTitleLow,
};

static const Map<String, String> strFinantialWellnessScoreSubTitleMap = {
  'HEALTHY': strFinantialWellnessScoreSubTitleHealthy,
  'MEDIUM': strFinantialWellnessScoreSubTitleMedium,
  'LOW': strFinantialWellnessScoreSubTitleLow,
};

  //Shared Preferences Key
  static const String keySelectedTheme = "key_selected_theme";
}
