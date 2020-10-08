
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



function scr_pc_note_init() {
	note = new NotePC();
}

/// @arg from
/// @arg to
/// @arg text
function scr_pc_note_add(_from, _to, _text) {
	note.add(_from, _to, _text);
}

function NotePC() constructor {
	notes = [];
	count = 0;
	
	add = function(from, to, text) {
		notes[count] = new NotePCMail(from, to, text);
		count ++;
	}
}

/// @arg from
/// @arg to
/// @arg text
function NotePCMail(_from, _to, _text) constructor {
	from = _from;
	to = _to;
	text = _text;
}