describe Person, type: :model do

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

    describe '#gender' do
      it 'can have a gender' do
        person = build :person, gender: 'male'
        expect(person.gender).to eq 'male'
      end

      it 'cannot have an invalid gender' do
        person = build :person, gender: 'mail'
        expect(person).to_not be_valid
      end
    end

    describe '#hometown' do
      it 'can have a hometown' do
        person = build :person, hometown: 'Atlanta'
        expect(person.hometown).to eq 'Atlanta'
      end
    end

    describe '#location' do
      it 'can have a location' do
        person = build :person, location: 'Boulder'
        expect(person.location).to eq 'Boulder'
      end
    end

    describe '#website' do
      it 'can have a website' do
        person = build :person, website: 'http://test.com'
        expect(person.website).to eq 'http://test.com'
      end
    end

    describe '#friends' do
      after { delete_db }

      it 'can have friends' do
        person = create :person
        friend = create :person
        person.friends << friend
        expect(person.friends).to include friend
      end

      it 'can know and be known' do
        person = create :person
        friend = create :person
        person.knows << friend
        friend.knows_me << person
        expect(person.friends).to include friend
        expect(friend.friends).to include person
      end
    end

    describe '#experiences' do
      it 'can have hosted experiences' do
        person = create :person_with_hosted_experiences
        expect(person.hosted_experiences).to have_at_least(4).items
      end
    end
  end

  describe '#account' do
    context 'email already registered' do
      before { subject.save }
      after { delete_db }

      it 'should save the account' do
        user = create :user
        subject.account = user
        expect(subject.account).to be_a User
      end
    end
  end
end
