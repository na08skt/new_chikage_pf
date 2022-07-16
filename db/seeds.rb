# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
    email: 'chikage@admin.com',
    password: 'chikage'
)

User.create!(
    account_name: 'chikage_guest',
    email: 'chikage@guest.com',
    password: 'chikage',
    introduction: 'このアカウントはゲストログイン専用の
    アカウントのため機能が制限されています。機能をご利用
    したい場合は、お手数ですがご自身でアカウントを作成し
    てください。'
  )

User.create!(
    account_name: 'chikage_test1',
    email: 'chikage@test1.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test１”です'
  )
  
User.create!(
    account_name: 'chikage_test2',
    email: 'chikage@test2.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test2”です'
  )
  
User.create!(
    account_name: 'chikage_test3',
    email: 'chikage@test3.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test3”です'
  )