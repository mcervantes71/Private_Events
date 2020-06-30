require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      id: '1',
      full_name: 'aulbourn',
      username: 'aknowles',
      email: 'aknowles@gmail.com',
      password: 'aknowles13',
      created_at: DateTime.now,
      updated_at: DateTime.now + 1.week
    )
    expect(user).to be_valid
  end

  it 'is not valid without a full_name' do
    user = User.new(full_name: nil)
    user.valid?
    expect(user.errors[:full_name]).to include("can't be blank")
  end

  it 'is not valid if same username exist' do
    User.create(
      full_name: 'Joe smith',
      username: 'joeyyoey',
      email: 'test@example.com',
      password: 'dottle123'
    )
    user = User.new(
      full_name: 'Jane smith',
      username: 'joeyyoey',
      email: 'jake@example.com',
      password: 'dottle123'
    )
    user.valid?
    expect(user.errors[:username]).to include('has already been taken')
  end

  it 'is not valid if password is not correct' do
    user = User.new(password: 'ak')
    user.valid?
    expect(user.valid?).to eq(false)
  end

  it 'is not valid if email is not correct' do
    user = User.new(email: 'aknowlesgmail.com')
    user.valid?
    expect(user.valid?).to eq(false)
  end
end
