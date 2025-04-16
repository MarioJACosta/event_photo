import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'q9kguiku': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CameraPage
  {
    'ro99esq7': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CreateAccountPage
  {
    '8svl3crc': {
      'pt': 'Criar conta',
      'en': 'Create Account',
    },
    'j3kou5kl': {
      'pt': 'Email',
      'en': 'Email',
    },
    '1b4jsy5i': {
      'pt': 'Password',
      'en': 'Password',
    },
    'kh16v6tx': {
      'pt': 'Criar',
      'en': 'Create',
    },
    'r4l3145x': {
      'pt': 'Ou criar conta com',
      'en': 'Or create account with',
    },
    'gijj3dlw': {
      'pt': ' Google',
      'en': '',
    },
    'np7ogi5b': {
      'pt': 'Já tens conta?',
      'en': 'Already have an account?',
    },
    'q6az47xr': {
      'pt': '  Inicia sessão aqui',
      'en': 'Sign in here',
    },
    'm4dg5xzn': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // LoginPage
  {
    '0d03mvlo': {
      'pt': 'Bem Vindo',
      'en': 'Wellcome',
    },
    'ywtitvgy': {
      'pt': 'Email',
      'en': 'Email',
    },
    'ibc3rkwg': {
      'pt': 'Password',
      'en': 'Password',
    },
    'waz9fyvz': {
      'pt': 'Iniciar',
      'en': 'Sign In',
    },
    'sczm25fe': {
      'pt': 'Ou inicia sessão com',
      'en': 'Or sign in with',
    },
    'dt42q034': {
      'pt': 'Google',
      'en': '',
    },
    'k2rsqo7z': {
      'pt': 'Ainda não tens conta?',
      'en': 'Don\'t have an account yet?',
    },
    '9taqmhca': {
      'pt': '  Criar conta',
      'en': 'Create account',
    },
    'j6v2heor': {
      'pt': 'Recuperar Password',
      'en': 'Forgot password',
    },
    'crhhmjnk': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPasswordPage
  {
    'x72obwic': {
      'pt': 'Recuperar password',
      'en': 'Forgot Paasword',
    },
    'iwacd5pv': {
      'pt':
          'Introduz o email para o qual enviar o link para recuperar a passwaord',
      'en': 'Enter the email to which to send the link to recover the password',
    },
    '4qpf5tr4': {
      'pt': 'Email',
      'en': 'Email',
    },
    'nk624bt9': {
      'pt': 'Enviar',
      'en': 'Send',
    },
    'zo38gyd7': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CreateProfilePage
  {
    'mko3aoie': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ProfilePage
  {
    'mokpbqzn': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // EditProfilePage
  {
    'n77uyosa': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ReviewPhotoPage
  {
    '0cw1cy9m': {
      'pt': 'Adiciona a tua legenda',
      'en': 'Add your legend',
    },
    'yghdfrme': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ListAlbunsPage
  {
    '50f0pbsh': {
      'pt': 'Os meus albums',
      'en': 'My albums',
    },
    '88yv2j3g': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // AlbunsDetailsPage
  {
    'ungd1txx': {
      'pt': 'Home',
      'en': 'Os meus albums',
    },
  },
  // PhotoDetailPage
  {
    '645840jn': {
      'pt': 'Home',
      'en': 'Os meus albums',
    },
  },
  // CreateAlbumPage
  {
    'c36h5wxw': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
    'ezameogu': {
      'pt': 'Novo Album',
      'en': 'New Album',
    },
    '6wlamvfa': {
      'pt': 'Guardar',
      'en': 'Save',
    },
    'f5e4wocq': {
      'pt': 'Nome do Album',
      'en': 'Album\'s name',
    },
    '1xtaejww': {
      'pt': 'Dá um nome ao teu album',
      'en': 'Give your album a name',
    },
    'v433mlbg': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // EditProfileComponent
  {
    'xcck4i56': {
      'pt': 'Mudar a photo',
      'en': 'Change Photo',
    },
    'eioimndj': {
      'pt': 'Nome',
      'en': 'Full Name',
    },
    'ylqge88d': {
      'pt': 'Nome completo...',
      'en': 'Your full name...',
    },
  },
  // CommentsBottomSheetComponent
  {
    '00ywe6nf': {
      'pt': 'Comentários',
      'en': 'Comments',
    },
    'ahup1w57': {
      'pt': 'Adiciona um comentário...',
      'en': 'Add a comment...',
    },
  },
  // EditAlbumComponent
  {
    '5zjcnluw': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'zv8qnmt5': {
      'pt': 'Editar Nome',
      'en': 'Edit Name',
    },
    '1kskr87u': {
      'pt': 'Apagar Album',
      'en': 'Delete Album',
    },
  },
  // ListAlbumsComponent
  {
    'a5c4352y': {
      'pt': 'Albums',
      'en': 'Albums',
    },
    'zv4rx8pg': {
      'pt': 'Criar Album',
      'en': 'Create Album',
    },
  },
  // CreateAlbumComponent
  {
    'ox1m5mz8': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
    'ekbu501o': {
      'pt': 'Novo Album',
      'en': 'New Album',
    },
    'xczlzyo1': {
      'pt': 'Guardar',
      'en': 'Save',
    },
    'ru9skrsa': {
      'pt': 'Nome do Album',
      'en': 'Album\'s name',
    },
    '28c54na4': {
      'pt': 'Dá um nome ao teu album',
      'en': 'Give your album a name',
    },
  },
  // Miscellaneous
  {
    'bk1zouzs': {
      'pt': 'Precissamos de tirar fotos do evento',
      'en': '',
    },
    'hung3kvt': {
      'pt': '',
      'en': '',
    },
    'cx59dfa6': {
      'pt': '',
      'en': '',
    },
    'w4bi1ptj': {
      'pt': '',
      'en': '',
    },
    'if69b9w9': {
      'pt': '',
      'en': '',
    },
    'ta0x1f8t': {
      'pt': '',
      'en': '',
    },
    'h9gd9gb8': {
      'pt': '',
      'en': '',
    },
    '2i2yc2kv': {
      'pt': '',
      'en': '',
    },
    'bmjmcxu0': {
      'pt': '',
      'en': '',
    },
    'pjoq959z': {
      'pt': '',
      'en': '',
    },
    'sw4d2grt': {
      'pt': '',
      'en': '',
    },
    'q22fghvn': {
      'pt': '',
      'en': '',
    },
    'ivh1sv71': {
      'pt': '',
      'en': '',
    },
    'ufljdrhd': {
      'pt': '',
      'en': '',
    },
    'oxyk4nzm': {
      'pt': '',
      'en': '',
    },
    '1bvsabny': {
      'pt': '',
      'en': '',
    },
    'j1q52tg3': {
      'pt': '',
      'en': '',
    },
    '87h91aa6': {
      'pt': '',
      'en': '',
    },
    'wzox4ocd': {
      'pt': '',
      'en': '',
    },
    '82qi5rw8': {
      'pt': '',
      'en': '',
    },
    '2ntkdefj': {
      'pt': '',
      'en': '',
    },
    'fveyp71m': {
      'pt': '',
      'en': '',
    },
    '8j0wichy': {
      'pt': '',
      'en': '',
    },
    'jztsiw7v': {
      'pt': '',
      'en': '',
    },
    'cjhz5140': {
      'pt': '',
      'en': '',
    },
    'vvatp31c': {
      'pt': '',
      'en': '',
    },
    '0j4mfcqp': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
