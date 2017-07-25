class ResearchSessionPresenter < Struct.new(:research_session)
  delegate :age, :focus, :researcher_name, :researcher_other_name,
           :researcher_email, :researcher_phone,
           to: :research_session

  def methodology_list
    segments = research_session.methodologies.map do |methodology|
      i18n_key = "age.#{age}.#{methodology}"
      I18n.t(i18n_key)
    end
    segments.map { |segment| "<p>#{segment}</p>"}.join("\n").html_safe
  end

  def recording_methods_list
    'recording_methods_list'
  end
end
