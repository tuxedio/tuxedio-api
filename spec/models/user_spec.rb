describe User, type: :model do
  subject { create :user_with_role }

  describe '#role' do
    after { delete_db }

    it 'should be able to have a role' do
      expect(subject.role).to be_a Person
    end

    it 'should remove role upon deletion' do
      subject.destroy
      expect(Person.count).to eq 0
    end
  end

  describe '#email' do
    context 'email already registered' do
      after { delete_db }

      it 'should not save the account' do
        user = build :user, email: subject.email

        expect(user.save).to be false
      end
    end
  end

  describe '#handle' do
    it 'is unique' do
      user = build :user, handle: subject.handle

      expect(user).to_not be_valid
    end

    it 'has a reasonable length (between 3..20)' do
      users = [
        build(:user, handle: 'a' * 21),
        build(:user, handle: 'a' * 2)
      ]

      users.each{ |user| expect(user).to_not be_valid }
    end
  end
end
