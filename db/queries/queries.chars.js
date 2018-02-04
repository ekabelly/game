const queries = {
	fetchChars:"SELECT characters.name, characters.id, characters.level, classes.name as class FROM characters"
	+" inner JOIN"
	+" classes on characters.class = classes.id"
	+" inner JOIN"
	+" levels on characters.level = levels.id",
	fetchChar:"SELECT characters.name, characters.id, characters.level, characters.xp, levels.reqxp, classes.name as class, classes.picture as classImg FROM characters"
	+" inner JOIN"
	+" classes on characters.class = classes.id"
	+" inner JOIN"
	+" levels on characters.level = levels.id"
	+" where characters.id = ?",
	fetchCharStats:"SELECT stats.name as stat, characterstats.value FROM characterstats"
	+" inner join stats on characterstats.stat_id = stats.id"
	+" where characterstats.character_id = ?",
	fetchCharItems:"SELECT items.name as item, items.id as id, character_items.used FROM character_items"
	+" INNER JOIN items on character_items.item_id = items.id"
	+" where character_items.character_id = ?",
	findCharByName:"SELECT id FROM characters where name like ",
	whereUser:" where characters.user = ?",
	createChar:"INSERT INTO characters (user, name, class, level) VALUES (?, ?, ?, 1)"
}

module.exports = queries;