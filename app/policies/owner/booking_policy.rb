class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:pet).where(pets: {user: user})
    end
  end
  def destroy?
    record.user == user
  end
  def create?
    record.user == user
  end
end
