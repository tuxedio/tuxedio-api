describe Person, type: :model do
  before { delete_db }

  subject { build :person }

  describe '#profile' do
    describe '#bio' do
      it 'can create an bio' do
        person = build :person, bio: 'This is about me'
        expect(person.bio).to eq 'This is about me'
      end

      it 'cannot be too long' do
        person = build :person, bio: 'a' * 256
        expect(person).to_not be_valid
      end
    end

    it 'can have a gender' do
      person = build :person, gender: 'male'
      expect(person.gender).to eq 'male'
    end

    it 'can have a hometown' do
      person = build :person, hometown: 'Atlanta'
      expect(person.hometown).to eq 'Atlanta'
    end

    it 'can have a location' do
      person = build :person, location: 'Boulder'
      expect(person.location).to eq 'Boulder'
    end

    it 'can have a website' do
      person = build :person, website: 'http://test.com'
      expect(person.website).to eq 'http://test.com'
    end

    it 'should persist in database' do
      expect(subject.save).to be true
      expect(Person.first).to be_a Person
    end
  end

  describe '#account' do
    context 'email already registered' do
      before { subject.save }

      it 'should save the account' do
        user = create :user
        subject.account = user
        expect(subject.account).to be_a User
      end
    end
  end
end
