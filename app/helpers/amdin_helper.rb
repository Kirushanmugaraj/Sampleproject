module AmdinHelper

  def fetch_all_college_name
    EducationDetail.all.collect{ |s| [s.college_name, s.college_name]}
  end

  def fetch_all_degree_name
    EducationDetail.all.collect{ |s| [s.degree, s.degree]}
  end

end
