class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction  

    def take_ride
        if !have_enough_tickets && !tall_enough
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !have_enough_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            goes_on_ride
        end
    end

    def have_enough_tickets
        self.user.tickets >= self.attraction.tickets

    end

    def tall_enough
        self.user.height >= self.attraction.min_height
    end

    def update_user_tickets
        self.user.tickets - self.attraction.tickets
    end

    def goes_on_ride
        happiness_level = self.user.happiness + self.attraction.happiness_rating
        nausea_level = self.user.nausea + self.attraction.nausea_rating
        self.user.update(happiness: happiness_level, nausea: nausea_level, tickets: update_user_tickets)
        "Thanks for riding the #{self.attraction.name}!"
    end
end
