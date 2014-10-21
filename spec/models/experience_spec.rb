describe Experience, type: :model do
  subject { build :experience }

  describe '#location' do
    it 'can have a location' do
      experience = build :experience, location: 'Boulder'
      expect(experience.location).to eq 'Boulder'
    end
  end

  describe '#name' do
    it 'can have a name' do
      experience = build :experience, name: 'Goodtime'
      expect(experience.name).to eq 'Goodtime'
    end
  end

  describe '#description' do
    it 'can have a description' do
      experience = build :experience, description: 'Really good'
      expect(experience.description).to eq 'Really good'
    end
  end

  describe '#host' do
    after { delete_db }

    it 'can have a host' do
      experience = create :hosted_experience
      expect(experience.host).to be_a Person
    end
  end
end
