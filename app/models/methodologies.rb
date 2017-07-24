class Methodologies
  NAME_VALUES = {
    interview:   'Interview',
    usability:   'Usability testing',
    survey:      'Survey',
    focusgroup:  'Focus group',
    codesign:    'Codesign workshop',
    observation: 'Observation/field study',
    diary:       'Diary study'
  }

  def self.allowed_values
    NAME_VALUES.keys
  end
end
