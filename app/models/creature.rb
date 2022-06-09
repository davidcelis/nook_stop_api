class Creature < ApplicationRecord
  def self.available_now(hemisphere: "northern")
    now = Time.now
    month, hour = now.month, now.hour

    ids = all.map do |creature|
      times = creature.active_times[hemisphere].find { |times| times["month"] == month }
      next unless times.present?

      next creature.id unless times.key?("hours")

      start, finish = times["hours"]
      if start < finish
        creature.id if (hour >= start) && (hour < finish)
      else
        creature.id if (hour >= start) || (hour < finish)
      end
    end

    ids.compact!

    where(id: ids)
  end
end
