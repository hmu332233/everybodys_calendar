# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Calendar.create(name: '전북대')
Event.create(title: '첫번째 일정', start:'2017-08-08', end: '', calendar_id: 1, url: '/events/125')
Event.create(title: '두번째 일정', start:'2017-08-15', end: '', calendar_id: 1, url: '/events/126')
Event.create(title: '세번째 일정', start:'2017-08-20', end: '', calendar_id: 1, url: '/events/127')
Event.create(title: '네번째 일정', start:'2017-08-21', end: '2017-08-25', url: '/events/128')
