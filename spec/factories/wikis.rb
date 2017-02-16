FactoryGirl.define do
  factory :wiki do
    title "My String"
    body "This is some stupid text to meet length requirements."
    private false
    user
  end
end
