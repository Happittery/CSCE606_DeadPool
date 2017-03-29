module InstructorHelper

  def course_name_for(course)

    name = course.subject_course;
    if (course.section.to_s.starts_with?("2"))
      name = name + "H"
    end

    return name
  end
  
  def term_format(term)
    year = term[0..3]
    semester = term[4] 
    if semester == "A"
      t = "SP"+ year[2..3]
    elsif semester == "B"
      t = "SU" + year[2..3]
    elsif semester == "C"
      t = "FA" + year[2..3]
    end
    return t
  end
  
  def get_complete_name(course)
    complete_name = course.subject_course;
    if (course.section.to_s.starts_with?("2"))
      complete_name = complete_name + "H"
    end

    name = CourseName.where(subject_course: course.subject_course).first.try(:name)
    if (!name.nil?)
      complete_name = complete_name + " " + name
    end

    return complete_name
  end

  def is_honors(course_section)
    pos_fix = ""
    if (course_section.to_s.starts_with?("2"))
      pos_fix = "H"
    end
    return pos_fix
  end

end
