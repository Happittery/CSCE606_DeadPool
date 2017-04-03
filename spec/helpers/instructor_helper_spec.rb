require 'rails_helper'

RSpec.describe InstructorHelper, type: :helper do
  describe "#course_name_for" do
    it "returns the subject and course number appended" do
      inst = FactoryGirl.create(:instructor)
      FactoryGirl.create(:evaluation, instructor: inst, subject: "CSCE", course: "121")
      expect(helper.course_name_for(inst.course_section_groups[0].first)).to eq("CSCE 121")
    end

    it "appends H to the course name if it is honors" do
      inst = FactoryGirl.create(:instructor)
      FactoryGirl.create(:evaluation, instructor: inst, subject: "CSCE", course: "121", section: 200)
      expect(helper.course_name_for(inst.course_section_groups[0].first)).to eq("CSCE 121H")
    end

    it "#is_honors" do
      expect(is_honors(221)).to eq("H")
      expect(is_honors(121)).to eq("")
    end 
  end
  
  describe "#term_format" do
    it "verifies terms were converted to SP/SU/FA format" do
      inst = FactoryGirl.create(:instructor)
      first = FactoryGirl.create(:evaluation, instructor: inst, subject: "CSCE", course: "121", term: '2015C')
      second = FactoryGirl.create(:evaluation, instructor: inst, subject: "CSCE", course: "121", term: '2015B')
      third = FactoryGirl.create(:evaluation, instructor: inst, subject: "CSCE", course: "121", term: '2010A')

      expect(helper.term_format(first.term)).to eq("FA15")
      expect(helper.term_format(second.term)).to eq("SU15")
      expect(helper.term_format(third.term)).to eq("SP10")
    end
  end
end
