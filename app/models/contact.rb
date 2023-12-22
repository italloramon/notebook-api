class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def kind_description
    self.kind.description
  end

  def as_json(options = nil)
    super(
      root: true,
      methods: [:kind_description],
    )
  end
end
