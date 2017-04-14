#added this file from scratch for internationalization
#I18n is abbreviation for 'internationalization'...starts with 'i', ends with 'n', 18 characters in between

#encoding: utf-8
I18n.default_locale = :en

LANGUAGES = [
  ["English",                   'en'],
  ["Espa&ntilde;ol".html_safe,  'es']
]

#&ntilde = HTML equivalent of n con tilde character in spanish (not available on US keyboard)
#calling html_safe informs Rails that the string is safe to be interpreted as containing HTML
