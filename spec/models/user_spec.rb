describe User, type: :model do
  before { delete_db }

  subject do
    User.new(
      username: 'bobby123',
      password: 'somethinsomething',
      email:    'bobby123@test.com')
  end

  describe 'can create an account' do

    it 'should create an email' do
      expect(subject.email).to eq 'bobby123@test.com'
    end

    it 'should create a username' do
      expect(subject.username).to eq 'bobby123'
    end

    it 'should create a password' do
      expect(subject.password).to_not be nil
    end

    it 'should persist in database' do
      expect(subject.save).to be true
      expect(User.first).to be_a User
    end
  end

  describe 'cannot create an account' do
    context 'email already registered' do
      before { subject.save }

      it 'should not save the account' do
        user = User.new(
          username: 'bob',
          password: 'somethin',
          email:    'bobby123@test.com')

        expect(user.save).to be false
      end
    end
  end
end
