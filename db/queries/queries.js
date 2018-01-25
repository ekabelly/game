module.exports = {
	fetchChars:"SELECT characters.name, characters.level, characters.xp, classes.name as class, levels.reqxp FROM characters"
+" inner JOIN"
+" classes on characters.class = classes.id"
+" inner JOIN"
+" levels on characters.level = levels.id",
fetchChar:"SELECT characters.name, characters.id, characters.level, characters.xp, levels.reqxp, classes.name as class FROM characters"
+" inner JOIN"
+" classes on characters.class = classes.id"
+" inner JOIN"
+" levels on characters.level = levels.id"
+" where characters.id = ?",
fetchItems:"SELECT items.id as id, items.name, stats.name as stat, item_stats.value as stat_value, effects.name as effect, itemeffects.value as effect_value from items"
+" LEFT join item_stats on items.id = item_stats.item_id"
+" left join itemeffects on items.id = itemeffects.item_id"
+" left join stats on item_stats.stat_id = stats.id"
+" LEFT join effects on itemeffects.effect_id = effects.id"
}