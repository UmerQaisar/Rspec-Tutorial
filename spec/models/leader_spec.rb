require 'rails_helper'

RSpec.describe Leader, type: :model do
  let(:leader) { FactoryBot.build(:leader) }
  let(:group) { FactoryBot.build(:group) }

  context 'Should validate' do
    it 'with first name, last name, email and phone number present' do
      expect(leader).to be_valid
    end

    # it 'when group is not present' do
    #   leader.group = nil
    #   expect(group).to be_valid
    # end
  end

  context 'Should not be valid' do
    it 'when first name is not present' do
      leader.first_name = nil
      expect(leader).not_to be_valid
    end

    it 'when last name is not present' do
      leader.last_name = nil
      expect(leader).not_to be_valid
    end

    it 'when email is not present' do
      leader.email = nil
      expect(leader).not_to be_valid
    end

    it 'when phone number is not present' do
      leader.phone_number = nil
      expect(leader).not_to be_valid
    end
  end

  context 'Phone number format' do
    it 'should not be valid when phone number is of wrong format' do
      leader.phone_number = '3367777025'
      expect(leader).not_to be_valid
    end

    it 'should be valid when phone number is of right format' do
      leader.phone_number = '336-777-7025'
      expect(leader).to be_valid
    end
  end

  context 'Email format' do
    it 'should not be valid when email is of wrong format' do
      leader.email = 'umer_qaisar.com'
      expect(leader).not_to be_valid
    end

    it 'should be valid when email is of right format' do
      leader.email = 'umerqaisar786@gmail.com'
      expect(leader).to be_valid
    end
  end

  context 'Full Name' do
    it 'should expect leader full name to be Umer Qaisar' do
      leader.first_name = 'Umer'
      leader.last_name = 'Qaisar'
      expect(leader.full_name).to eq 'Umer Qaisar'
    end
  end

  context 'Group Name' do
    it 'should return No Group for this Leader when group is not present' do
      leader.group = nil
      expect(leader.group_name).to eq 'No Group for this Leader'
    end

    it 'should return Name of the group when group is present' do
      group.name = 'GCU'
      leader.group = group
      expect(leader.group_name).to eq 'GCU'
    end
  end
end
