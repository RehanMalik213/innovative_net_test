class AppImages {
  AppImages._();
  static const basePath = 'assets/images/';
  static const vectorBasePath = 'assets/vectors/';

  static const pngFormat = '.png';
  static const jpgFormat = '.jpg';
  static const svgFormat = '.svg';

  //***** SVG Vectors*****/
  // Helper method
  static String _svg(String name) => '$vectorBasePath$name$svgFormat';
  static final String appVersion = _svg('app_version');
  static final String date = _svg('date');
  static final String history = _svg('history');
  static final String home = _svg('home');
  static final String lock = _svg('lock');
  static final String loginIcon = _svg('login_icon');
  static final String mail = _svg('mail');
  static final String notification = _svg('notification');
  static final String payload = _svg('payload');
  static final String person = _svg('person');
  static final String phone = _svg('phone');
  static final String route = _svg('route');
  static final String drawer = _svg('drawer');
  static final String clock = _svg('clock');

  //***** jpg Images*****/

  //*****PNG Images*****/
}
