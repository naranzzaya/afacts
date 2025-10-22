require "open-uri"

User.destroy_all
Article.destroy_all
CommunityPost.destroy_all
DictionaryTerm.destroy_all
Meetup.destroy_all

u = User.create!(email: "demo@vfx.test", password: "password", username: "demo")

# Уроки (Учебник)
lesson1 = Article.create!(title: "Основы композиции", slug: "comp-basics", body: "Теория...", kind: :lesson, category: :theory, status: :published, user: u)
lesson2 = Article.create!(title: "Трекинг камеры", slug: "camera-tracking", body: "Практика...", kind: :lesson, category: :production_tech, status: :published, user: u)

# Статьи
Article.create!(title: "До/после: Inception", slug: "inception-bts", body: "Разбор сцен...", kind: :article, category: :breakdowns, status: :published, user: u)
Article.create!(title: "Green Screen vs LED", slug: "greenscreen-led", body: "Технологии...", kind: :article, category: :tech, status: :published, user: u)

# Глоссарий
term = DictionaryTerm.create!(term: "Compositing", definition: "Сведение слоёв в единый кадр", examples: "Keying, Rotoscoping")
LessonTerm.create!(article: lesson1, dictionary_term: term, context: "раздел про keying")

post = CommunityPost.create!(user: u, title: "Матт-пэйнт", body: "Моя работа", post_type: :gallery, status: :visible)

# тест изображения
file1 = File.open(Rails.root.join("gallery1.jpeg"))
file2 = File.open(Rails.root.join("gallery2.jpg"))
post.media = [file1, file2]
post.save!

Meetup.create!(title: "VFX Talk c гостем", description: "Интервью...", starts_at: 1.week.from_now, status: :upcoming)
Meetup.create!(title: "Postmortem: короткий метр", description: "Разбор производства", starts_at: 1.month.ago, status: :past)

puts "Seed done."