/// string_wordwrap_width(string,width,break,split)
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      break       line break characters to insert into text, string
//      split       split words that are longer than the maximum, bool
//
/// GMLscripts.com/license
function string_wordwrap_width(_string, _width, _break, _split){
  var pos_space, pos_current, text_current, text_output;
  pos_space = -1;
  pos_current = 1;
  text_current = _string;
  if (is_real(_break)) _break = "\n";
  text_output = "";
  while (string_length(text_current) >= pos_current) {
    if (string_width(string_copy(text_current,1,pos_current)) > _width) {
			if (string_char_at(text_current,pos_current) == "\n") {
        text_output += string_copy(text_current,1,pos_current);
        text_current = string_copy(text_current,pos_current+1,string_length(text_current)-(pos_current));
        pos_current = 1;
        pos_space = -1;
			} else if (pos_space != -1) {
        //if there is a space in this line then we can break there
        text_output += string_copy(text_current,1,pos_space) + string(_break);
        //remove the text we just looked at from the current text string
        text_current = string_copy(text_current,pos_space+1,string_length(text_current)-(pos_space));
        pos_current = 1;
        pos_space = -1;
      } else if (_split) {
        //if not, we can force line breaks
        text_output += string_copy(text_current,1,pos_current-1) + string(_break);
        //remove the text we just looked at from the current text string
        text_current = string_copy(text_current,pos_current,string_length(text_current)-(pos_current-1));
        pos_current = 1;
        pos_space = -1;
      }
    }
    if (string_char_at(text_current,pos_current) == " ") pos_space = pos_current;
    pos_current += 1;
  }
  if (string_length(text_current) > 0) text_output += text_current;
    return text_output;
}

/// @arg file_prefix
/// @arg section
/// @arg key
function ini_open_read(_pref, _section, _key) {
		let _ini = global.locale == LOCALE_ENGLISH ? string(_pref) + "_eng.ini" : string(_pref) + "_jap.ini";
		ini_open(_ini);
		let _name = ini_read_string(_section, _key, "BROKEN");
		ini_close();
		_name = string_replace_all(_name, "#n", "\n");
		return _name;
}