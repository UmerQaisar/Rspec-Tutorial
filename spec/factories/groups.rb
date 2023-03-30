FactoryBot.define do
  factory :group do
    name { 'GCU' }
    group_type { 'College' }
    description { 'Group to connect people' }
    size { 8 }
    leader
  end
end
