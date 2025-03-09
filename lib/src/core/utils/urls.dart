class URL{
  static const baseUrl = 'http://118.139.166.244:1500/api/';

  static const signupUrl = '${baseUrl}Authentication/RegisterUser';

  static const loginUrl = '${baseUrl}Authentication/login';
  
  static const vitalSignsUrl = '${baseUrl}VitalSigns/GetVitalSignsByMrno?MRNo=';
}