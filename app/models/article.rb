class Article < ApplicationRecord
  # Каталог статей
  enum kind: { article: 0, lesson: 1 }

  enum category: {
    breakdowns: 0,# Разборы VFX (до/после)
    tech: 1, # Технологии
    people: 2,# Личности
    picks: 3,# Подборки
     # Учебник (уроки)
    theory: 10,# Теория VFX
    production_tech: 11# Технологии создания VFX
  }

  enum status: { draft: 0, published: 1, archived: 2 }

  validates :title, :slug, presence: true
  validates :slug, uniqueness: true

  scope :published, -> { where(status: :published) }
end