class Manga < ApplicationRecord
    validates :title, presence: true, length: {minimum: 2, maximum: 100}
    validates :mangaka, presence: true, length: {minimum: 2, maximum: 100}
    validates :collected, presence: true, length: {minimum: 2, maximum: 100}
    validates :status, presence: true, length: {minimum: 2, maximum: 100}
end