describe ExperienceTime, type: :model do
  describe '#starts_at' do
    it 'cannot start before current time' do
      time = build :experience_time, starts_at: 1.day.ago
      expect(time).to_not be_valid
    end
  end

  describe '#ends_at' do
    it 'cannot end before start time' do
      time = build :experience_time,
        starts_at: DateTime.now + 2.weeks,
        ends_at: DateTime.now + 1.week

      expect(time).to_not be_valid
    end
  end
end
