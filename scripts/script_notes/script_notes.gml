
enum note_type {
	book,
	note,
	news,
	pc
}

/// @arg text
/// @arg note_type
function scr_note(_text, _type) {
	let note = instance_create_layer(0, 0, Layers.gui, obj_note);
	note.text = _text;
	note.type = _type;
}

/// @arg file_prefix
/// @arg section
/// @arg key
function scr_note_init(_pref, _section, _key) {
	note_file = _pref;
	note_section = _section;
	note_key = _key;
}


function scr_pc_note_init() {
	note = new NotePC();
}

/// @arg from
/// @arg to
/// @arg file_prefix
/// @arg section
/// @arg key
function scr_pc_note_add(_from, _to, _pref, _section, _key) {
	note.add(_from, _to, _pref, _section, _key);
}

function NotePC() constructor {
	notes = [];
	count = 0;
	
	add = function(from, to, _pref, _section, _key) {
		notes[count] = new NotePCMail(from, to, _pref, _section, _key);
		count ++;
	}
}

/// @arg from
/// @arg to
/// @arg text
function NotePCMail(_from, _to, _pref, _section, _key) constructor {
	from = _from;
	to = _to;
	pref = _pref;
	section = _section;
	key = _key;
}