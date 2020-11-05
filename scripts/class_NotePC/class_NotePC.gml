class NotePC() constructor {
	notes = [];
	count = 0;
	
	add = function(from, to, _pref, _section, _key) {
		notes[count] = new NotePCMail(from, to, _pref, _section, _key);
		count ++;
	}
}