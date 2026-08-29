#import "content/data.typ": cv_data
#import "lib/template.typ": render_cv

#let filtered_experience = cv_data.experience.filter(entry =>
  entry.variant_tags.contains("systems")
)

#let filtered_skills = cv_data.skills.filter(cat =>
  cat.variant == "systems"
)

#let filtered_projects = cv_data.projects.filter(p =>
  p.variant_tags.contains("systems")
)

#let variant_data = cv_data + (
  experience: filtered_experience,
  skills: filtered_skills,
  projects: filtered_projects,
)

#render_cv(variant_data, variant: "systems")
