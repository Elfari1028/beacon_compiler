import 'dart:io';

RegExp identifiers = RegExp(
    r'(BEGIN)|(IF)|(END)|(ELSE)|(THEN)|(FOR)|(\+)|(\*)|(\,)|(:=)|(:)|(\()|(\))|[a-zA-Z][A-Za-z0-9]*|[0-9]{1,}',
    multiLine: true);

RegExp ident = RegExp(r'[a-zA-Z][A-Za-z0-9]*');
RegExp number = RegExp(r'([0-9]{1,}$)');

void main(List<String> arguments) {
  
  
  var file = File(arguments[0]).readAsStringSync();

  var res = file.splitMapJoin(
    identifiers,
    onMatch: onMatch,
    onNonMatch: onNonMatch,
  );
  
  print(res);
}

Map<String, String> tokenName = {
  ':=': 'Assign\n',
  '+': 'Plus\n',
  '*': 'Star\n',
  ',': 'Comma\n',
  '(': 'LParenthesis\n',
  ')': 'RParenthesis\n',
  ':': 'Colon\n',
};

String onMatch(Match match) {
  var str = match.group(0);
  if (str == 'BEGIN') {
    return 'Begin\n';
  } else if (str == 'IF') {
    return 'If\n';
  } else if (str == 'END') {
    return 'End\n';
  } else if (str == 'ELSE') {
    return 'Else\n';
  } else if (str == 'THEN') {
    return 'Then\n';
  } else if (str == 'FOR') {
    return 'For\n';
  } else if (ident.hasMatch(str)) {
    return ('Ident($str)\n');
  } else if (number.hasMatch(str)) {
    return ('Int($str)\n');
  } else {
    return tokenName[str];
  }
}

String onNonMatch(String str) {
  if(str == '')return '';
  if (RegExp(r'\s').hasMatch(str)) {
    return '';
  } else {
    return 'Unknown\n';
  }
}
