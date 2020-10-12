/// @description Insert description here
// You can write your code in this editor

//19 symbols 12 lines

if (checked = 0) {
	pages = [];
	page_current = 0;
	let _pref = note.notes[mail_current].pref;
	let _section = note.notes[mail_current].section;
	let _key = note.notes[mail_current].key;
	text = ini_open_read(_pref, _section, _key);
	from = note.notes[mail_current].from;
	to = note.notes[mail_current].to;
	
	let m_symbols = global.locale == LOCALE_JAPANESE ? 16 : 30;
	let m_lines = 7;//global.locale == LOCALE_JAPANESE ? 7 : 10;
	let word = "";
	let lines = [""];
	for (let j = 0; j < m_lines; j ++) {
		lines[j] = "";
	}
	let cline = 0;
	let page = 0;
	let newpage = 0;
	let templine = "";
	let tempnewline = 0;
	for (let i = 1; i <= string_length(text); i++) {
		let char = string_char_at(text, i);
		word += char;
		
		let eow = (char == " " || char == "\n");
		let eof = (i == string_length(text));
		let eowjap = 0;
		if (global.locale == LOCALE_JAPANESE) {
			eowjap = string_length(lines[cline] + word) > m_symbols - 1;
		}
		
		if (eow || eof || eowjap) {
			let enl = (char == "\n");
			if (enl) {
				word = string_copy(word, 1, string_length(word) - 1);
			}
			if (string_length(lines[cline] + word) > m_symbols) {
				cline ++;
				lines[cline] = "";
				newpage = (cline == m_lines);
				if (newpage) {
					templine = word;
					if (enl) {
						tempnewline = 1;
					}
				} else {
					lines[cline] = word;
				}
			} else {
				lines[cline] += word;
			}
			if (enl && !newpage) {
				cline ++;
				lines[cline] = "";
				newpage = (cline == m_lines);
			}
			if (eof) {newpage = 1;}
			if (newpage) {
				pages[page] = "";
				for (let j = 0; j < m_lines; j ++) {
					pages[page] += lines[j] + "\n";
					lines[j] = "";
				}
				page ++;
				cline = 0;
				lines[cline] = "";
				if (string_length(templine)) {
					lines[cline] = templine;
					if (tempnewline) {
						cline ++;
						lines[cline] = "";
					}
					tempnewline = 0;
				}
				templine = "";
				newpage = 0;
			}
			word = "";
		}
	}
	
	checked = 1;
}