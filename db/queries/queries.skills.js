const queries = {
	fetchSkill:"SELECT skills.id, skills.name as skill, skills.description, effects.name as effect FROM skillseffects"
	+" inner join skills on skillseffects.skill_id = skills.id"
	+" INNER join effects on skillseffects.effect_id = effects.id"
	+" where skillseffects.skill_id = ?",
	fetchSkills:'',
	createSkill:"INSERT INTO skills(name, description, picture, level) VALUES (?, ?, ?, ?)",
	updateSkill:"UPDATE skills SET "
}


module.exports = queries;