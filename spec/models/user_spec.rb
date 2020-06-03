require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      expect(user).to be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      expect(user).to_not be_valid
    end

    it 'is not valid without a last name' do
      user = User.new(first_name: "Name", email: "test@test.com", password: "Password", password_confirmation: "Password")
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(first_name: "Name", last_name: "Surname", password: "Password", password_confirmation: "Password")
      expect(user).to_not be_valid
    end

    it 'must have a unique email' do
      user1 = User.new(first_name: "Name", last_name: "Surname", email: "TEST@TEST.com", password: "Password", password_confirmation: "Password")
      user1.save

      user2 = User.new(first_name: "Name", last_name: "Surname", email: "test@test.COM", password: "Password", password_confirmation: "Password")
      expect(user2).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com")
      expect(user).to_not be_valid
    end

    it 'is not valid when password and password confirmation don\'t match' do
      user = User.new(first_name: "Name", last_name: "Surname", password: "Password", password_confirmation: "Confirmation")
      expect(user).to_not be_valid
    end

    it 'is not valid with a password less than three characters' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "pw", password_confirmation: "pw")
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a user when provided an email and a password' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      user.save()

      expect(User.authenticate_with_credentials("test@test.com", "Password")).to be_a User
    end

    it 'should not authenticate a user with an incorrect email' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      user.save()

      expect(User.authenticate_with_credentials("example@test.com", "Password")).to eql(nil)
    end

    it 'should not authenticate a user with an incorrect password' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      user.save()

      expect(User.authenticate_with_credentials("test@test.com", "example")).to eql(nil)
    end

    it 'should authenticate a user even with spaces around the email address' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "test@test.com", password: "Password", password_confirmation: "Password")
      user.save()

      expect(User.authenticate_with_credentials(" test@test.com ", "Password")).to be_a User
    end

    it 'should authenticate a user even with incorrect case' do
      user = User.new(first_name: "Name", last_name: "Surname", email: "eXample@domain.COM", password: "Password", password_confirmation: "Password")
      user.save()

      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "Password")).to be_a User
    end
  end

end
