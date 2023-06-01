class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # users should only see the bookings of their ducks OR their own bookings
      # scope.where(record.duck.user == user || record.user == user)
      scope.all
    end
  end

  def show?
    true
  end
end
