# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skill_array = [
  "Опыт управления IT-отделом (15 человек в подчинении).",
  "Управление бюджетом отдела.",
  "Развитие IT в компании.",
  "Участие в принятии управленческих решений в компании.",
  "Анализ рынка ERP-систем, выбор подходящей для нужд компании.",
  "Опыт выбора партнеров по внедрению ERP-систем (руководство проектом внедрения, участие в предпроектном обследовании, написание ТЗ со стороны заказчика).",
  "Дополнительный анализ и участие в выборе информационных систем.",
  "Автоматизация деятельности компании.",
  "Руководство внутренними проектами.",
  "Обеспечение информационной безопасности.",
  "Техническое обеспечение офиса, организация обновления парка техники.",
  "Обеспечение бесперебойной работы корпоративной ЛВС и оргтехники.",
  "Знание техники продаж.",
  "Умение вести переговоры.",
  "Ведение и расширение клиентской базы.",
  "Консультирование и предоставление клиентам информации об условиях продаж и ассортименте продукции компании.",
  "Работа на выставках, презентация продукции.",
  "Телефонные переговоры, прием и обработка заказов.",
  "Составление и заключение договоров.",
  "Первичная бухгалтерия.",
  "Контроль оформления документов.",
  "Ведение архива документов.",
  "Контроль отгрузки и доставки товара.",
  "Уверенное владение ПК.",
  "Планирование рабочего дня руководителя.",
  "Ведение документооборота.",
  "Делопроизводство.",
  "Деловая переписка.",
  "Жизнеобеспечение офиса.",
  "Организация приема посетителей.",
  "Уверенный пользователь оргтехники и ПК.",
  "Общее представлении о работе мини-АТС.",
  "Владение 10-пальцевым методом печати."
]
skill_array.each do |skill|
  Skill.find_or_create_by!(name: skill)
end

# Generate applicants

1.upto(50) do |i|
  sex = rand(0..1) == 0 ? :female : :male
  ap = Applicant.new(
    name: "#{FFaker::NameRU.last_name(sex)} #{FFaker::NameRU.first_name(sex)} #{FFaker::NameRU.patronymic(sex)}",
    contact: rand(0..1) == 0 ? FFaker::PhoneNumber.short_phone_number : FFaker::Internet.email,
    status: rand(1..10) < 3 ? 0 : 1,
    salary: (rand(2..5)*10+rand(3..8)*5)*1000,
    skill_ids: Skill.limit(rand(2..6)).order("random()").pluck(:id)
  )
  ap.save
end

# Generate vacancies

1.upto(50) do |i|
  sex = rand(0..1) == 0 ? :female : :male
  vac = Vacancy.new(
    name: "Вакансия ##{rand(50000).to_s.rjust(5,'0')}-#{rand(50000).to_s.rjust(5,'0')}",
    created_date: Date.today + rand(-10..8).days,
    validity: rand(15..45),
    salary: (rand(2..5)*10+rand(3..8)*5)*1000,
    contact: FFaker::NameRU.name,
    skill_ids: Skill.limit(rand(2..6)).order("random()").pluck(:id)
  )
  vac.save
end