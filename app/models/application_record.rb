class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
